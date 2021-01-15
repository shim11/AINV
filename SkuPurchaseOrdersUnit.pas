unit SkuPurchaseOrdersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, PMDBNavigator, Grids, DBGrids, ExtCtrls, StdCtrls, MyFunctions,
  JvDBControls, DB, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, JvExDBGrids, JvDBGrid;

type
  TfmSkuPurchaseOrders = class(TForm)
    Panel3: TPanel;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    dbgSkuPurchaseOrders: TjvDBGrid;
    N1: TMenuItem;
    ReceivePO1: TMenuItem;
    DeletePO1: TMenuItem;
    procedure dbgSkuPurchaseOrdersDblClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure dbgSkuPurchaseOrdersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      var SortMarker: TSortMarker; IsDown: Boolean);
    procedure dbgSkuPurchaseOrdersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
  private
    ascDesc: string;
  public
    { Public declarations }
  end;

var
  fmSkuPurchaseOrders: TfmSkuPurchaseOrders;

implementation

uses DBUnit, EditPoUnit;

{$R *.dfm}

procedure TfmSkuPurchaseOrders.dbgSkuPurchaseOrdersDblClick(Sender: TObject);
var
  tmpFilter: String;
begin
  if (DM.qSkuPo.FieldByName('po').AsInteger > 0) then
  begin
    addActivity(DM.AlonDb, 'TfmSkuPurchaseOrders.dbgSkuPurchaseOrdersDblClick po=' + DM.qSkuPo.FieldByName('po')
      .AsString);
    tmpFilter := DM.tbPo.Filter;
    DM.tbPo.Filter := 'po=' + DM.qSkuPo.FieldByName('po').AsString;
    DM.tbPo.Filtered := true;
    DM.tbPo.Active := true;
    DM.tbPOLines.Active := true;
    fmPo.ShowModal;
    DM.tbPo.Filter := tmpFilter;
    DM.tbPo.Filtered := false;
  end
  else
    ShowMessage('PO number not found');
end;

procedure TfmSkuPurchaseOrders.dbgSkuPurchaseOrdersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont;
  var Background: TColor; var SortMarker: TSortMarker; IsDown: Boolean);
var
  ordrFld: String;
begin
  ordrFld := Field.FieldName + ascDesc;
  if (TjvDBGrid(Sender).DataSource.DataSet is TFdTable) and (Field <> nil) then
  begin
    if (TFdTable(TjvDBGrid(Sender).DataSource.DataSet).IndexFieldNames = ordrFld) then
    begin
      if (ascDesc = ':A') then
        SortMarker := smUp
      else
        SortMarker := smDown;
      AFont.Color := clBlue;
    end;
  end;
end;

procedure TfmSkuPurchaseOrders.dbgSkuPurchaseOrdersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var
  ordrFld: String;
begin
  ordrFld := Field.FieldName;
  if (TFdTable(TjvDBGrid(Sender).DataSource.DataSet).IndexFieldNames = ordrFld + ascDesc) then
  begin
    if (ascDesc = ':A') then
      ascDesc := ':D'
    else
      ascDesc := ':A';
  end
  else
    ascDesc := ':D';
  TFdTable(TjvDBGrid(Sender).DataSource.DataSet).IndexFieldNames := ordrFld + ascDesc;
end;

procedure TfmSkuPurchaseOrders.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
