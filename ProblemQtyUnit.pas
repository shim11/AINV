unit ProblemQtyUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellAPI, MyFunctions, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.DBCGrids, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, JvDBControls, Vcl.Menus, JvExDBGrids, JvDBGrid;

type
  TfmShipQtyProblem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgShipId: TjvDBGrid;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    cbShowDeleted: TCheckBox;
    Label1: TLabel;
    lbCount: TLabel;
    procedure dbgShipIdDblClick(Sender: TObject);
    procedure dbgShipIdDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cbShowDeletedClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure CountAll();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShipQtyProblem: TfmShipQtyProblem;

implementation

uses DBUnit, SkuPurchaseOrdersUnit;
{$R *.dfm}

procedure TfmShipQtyProblem.cbShowDeletedClick(Sender: TObject);
begin
  if (cbShowDeleted.Checked) then
  begin
    DM.tbReconReport.Filtered := false;
  end
  else
  begin
    DM.tbReconReport.Filter := 'deleted=0';
    DM.tbReconReport.Filtered := true;
  end;
end;

procedure TfmShipQtyProblem.dbgShipIdDblClick(Sender: TObject);
var
  FieldName, fieldValueStr, link, del: string;
begin
  FieldName := Uppercase(TjvDBGrid(Sender).Columns.Items[TjvDBGrid(Sender).col - 1].FieldName);
  fieldValueStr := DM.tbReconReport.FieldByName('shipid').AsString;
  if (FieldName = 'SHIPID') then
  begin
    link := 'https://sellercentral.amazon.com/gp/fba/inbound-shipment-workflow/index.html#' + fieldValueStr +
      '/summary/problems';
    ShellExecute(Application.Handle, nil, PWideChar(link), nil, nil, SW_SHOWNORMAL);
    DM.RunSql('update reconreport set read = 1 where shipid = ' + QuotedStr(fieldValueStr));
    DM.tbReconReport.Refresh;
  end
  else if ((FieldName = 'DELETED')) then
  begin
    if (DM.tbReconReport.FieldByName('deleted').AsInteger = 1) then
      del := '0'
    else
      del := '1';

    DM.RunSql('update reconreport set deleted = ' + del + ' where shipid = ' + QuotedStr(fieldValueStr));
    DM.tbReconReport.Refresh;
    CountAll();
  end;

end;

procedure TfmShipQtyProblem.CountAll();
var
  cnt: Integer;
begin
  cnt := retIntFieldValue(DM.AlonDb, 'select count(*) from reconreport where deleted = 0');
  lbCount.Caption := IntToStr(cnt);
end;

procedure TfmShipQtyProblem.dbgShipIdDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if (Column.FieldName = 'shipid') then
  begin
    if (DM.tbReconReport.FieldByName('read').AsInteger = 1) then
    begin
      dbgShipId.Canvas.Font.Color := clPurple;
    end
    else
      dbgShipId.Canvas.Font.Color := clBlue;
  end;
  // if (Column.FieldName = 'deleted') then
  if (DM.tbReconReport.FieldByName('deleted').AsInteger = 1) then
  begin
    dbgShipId.Canvas.Brush.Color := clYellow;
    dbgShipId.Canvas.Font.Style := [fsItalic];
  end
  else
  begin
    dbgShipId.Canvas.Brush.Color := clWhite;
    dbgShipId.Canvas.Font.Style := [];
  end;
  dbgShipId.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmShipQtyProblem.MenuItem3Click(Sender: TObject);
begin
  Close;
end;

end.
