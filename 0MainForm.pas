unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, ComCtrls, MyFunctions,
  ppClass, daDataView, daQueryDataView, daDBBDE, ppModule, daDataModule,
  ppDB, ppCtrls, ppPrnabl, ppBands, ppCache, DB, DBTables, ppDBPipe,
  ppDBBDE, ppComm, ppRelatv, ppProd, ppReport, DateUtils, ppViewr;

type
  TfmMain = class(TForm)
    Panel1: TPanel;
    OD: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    dbgMain: TDBGrid;
    Panel3: TPanel;
    btnOK: TSpeedButton;
    Label1: TLabel;
    edQtyToOrder: TEdit;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    edPartsRange: TEdit;
    btnDayRep: TBitBtn;
    btnWeekRep: TBitBtn;
    btnMonthRep: TBitBtn;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnLoadInventory: TBitBtn;
    btnLoadOrders: TBitBtn;
    ppRep: TppReport;
    ppPipe: TppBDEPipeline;
    qRep: TQuery;
    dsRep: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    daDataModule1: TdaDataModule;
    daBDEQueryDataView1: TdaBDEQueryDataView;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    btnPrintLines: TSpeedButton;
    ppPrintLines: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine7: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    daDataModule2: TdaDataModule;
    daBDEQueryDataView2: TdaBDEQueryDataView;
    ppLabel3: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape3: TppShape;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppShape4: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine10: TppLine;
    procedure dbgMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnOKClick(Sender: TObject);
    procedure btnDayRepClick(Sender: TObject);
    procedure btnLoadInventoryClick(Sender: TObject);
    procedure LoadInventory(FileName: string);
    procedure FormShow(Sender: TObject);
    procedure btnLoadOrdersClick(Sender: TObject);
    procedure InsertOrders(FileName: string);
    procedure btnWeekRepClick(Sender: TObject);
    procedure btnMonthRepClick(Sender: TObject);
    procedure ppRepPreviewFormCreate(Sender: TObject);
    procedure btnPrintLinesClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;
  THackDBGrid = class(TDBGrid)
    property DataLink;
    property UpdateLock;
  end;
var
  fmMain: TfmMain;

implementation

uses DBUnit, PurchaseOrder;

{$R *.dfm}


procedure TfmMain.dbgMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  index: Integer;
  Marked: Boolean;
begin
  Marked := False;
  if (dgMultiSelect in dbgMain.Options) and (THackDBGrid(dbgMain).Datalink.Active) then
    Marked := dbgMain.SelectedRows.Find(THackDBGrid(dbgMain).Datalink.Datasource.Dataset.Bookmark, index);

  if Marked then
  begin
    dbgMain.Canvas.Brush.Color := $DFEFDF; ;
    dbgMain.Canvas.Font.Color := clBlack;
  end;
  dbgMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TfmMain.btnOKClick(Sender: TObject);
var sku: string;
  qty: Integer;
begin
  sku := DM.dsInv.DataSet.FindField('SellerSku').AsString;
  DM.getSkuDesc(sku);
  qty := StrToInt(edQtyToOrder.Text);
  DM.UpdateInventory(sku, qty);
  with fmPo do
  begin
    edPartNo.Text := sku;
    edQty.Text := IntToStr(qty);
    fmPo.ShowModal;
  end;
end;


procedure TfmMain.btnLoadInventoryClick(Sender: TObject);
begin
  with OD do
    if Execute then
    begin
      LoadInventory(FileName);
    end;
end;

procedure TfmMain.LoadInventory(FileName: string);
var TmpLst: TStringList;
  TmpStr, Sku, QtyS: string;
  Delim: Char;
  Count, i, qty, insQty, updQty: Integer;
begin
  Delim := #9;
  try
    TmpLst := TStringList.Create;
    TmpLst.LoadFromFile(FileName);
    insQty := 0;
    updQty := 0;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      Count := WordCount(TmpStr, [Delim]);
      if (Count <> 6) then
      begin
//        ShowMessage('Word count= ' + IntToStr(Count));
        break;
      end;
      Sku := ExtractDelimited(1, TmpStr, [Delim]);
      QtyS := ExtractDelimited(Count, TmpStr, [Delim]);
      if (QtyS = '') then QtyS := '0';
      qty := StrToInt(QtyS);
      if (DM.FindBySku(Sku)) then
      begin
        DM.UpdateInventoryQty(Sku, qty);
        Label3.Caption := 'Update qty=' + QtyS + ' sku=' + Sku;
        inc(updQty);
      end
      else
      begin
        DM.InsertInventory(ExtractDelimited(1, TmpStr, [Delim]),
          ExtractDelimited(2, TmpStr, [Delim]),
          ExtractDelimited(3, TmpStr, [Delim]),
          ExtractDelimited(4, TmpStr, [Delim]),
          ExtractDelimited(5, TmpStr, [Delim]),
          ExtractDelimited(6, TmpStr, [Delim]));
        Label4.Caption := 'Insert into Inventory Sku=' + Sku;
        Inc(insQty);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  Label3.Caption := 'Updated ' + IntToStr(updQty) + ' parts';
  Label4.Caption := 'Inserted ' + IntToStr(insQty) + ' parts';
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label3.Caption := '';
  Label4.Caption := '';
  Label5.Caption := '';
  Label6.Caption := '';
end;

procedure TfmMain.btnLoadOrdersClick(Sender: TObject);
begin
  with OD do
    if Execute then
    begin
      InsertOrders(FileName);
    end;
end;

procedure TfmMain.InsertOrders(FileName: string);
var TmpLst: TStringList;
  TmpStr, OrderId, QtyS, DateS: string;
  Delim: TCharSet;
  Count, i, insQty, processed: Integer;
begin
  Delim := [#9];
  try
    TmpLst := TStringList.Create;
    TmpLst.LoadFromFile(FileName);
    insQty := 0;
    processed := 0;
    Screen.Cursor := crSQLWait;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      Count := WordCount(TmpStr, Delim);
      Inc(processed);
      Label6.Caption := 'Count=' + IntToStr(processed);
      if (Count <> 48) then
      begin
        ShowMessage('Word count= ' + IntToStr(Count));
        continue;
      end;
      OrderId := ExtractDelimited(1, TmpStr, Delim) + ExtractDelimited(4, TmpStr, Delim);
      DateS := ExtractDelimited(7, TmpStr, Delim);
      if (Trim(DateS) = '') then DateS := ExtractDelimited(9, TmpStr, Delim);
      DateS := Copy(DateS, 6, 2) + '/' + Copy(DateS, 9, 2) + '/' + Copy(DateS, 1, 4) + ' ' + Copy(DateS, 12, 2) + ':' + Copy(DateS, 15, 2);
      if (QtyS = '') then QtyS := '0';
      Label5.Caption := 'Process Order=' + OrderId + ' ' + DateS + ' ' + ExtractDelimited(14, TmpStr, Delim) + ' ' + ExtractDelimited(16, TmpStr, Delim);
      if (DM.OrderExists(OrderId)) then continue;
      Label5.Caption := 'Insert Order=' + OrderId + ' ' + DateS + ' ' + ExtractDelimited(14, TmpStr, Delim) + ' ' + ExtractDelimited(16, TmpStr, Delim);
      DM.InsertOrders(OrderId, DateS,
        ExtractDelimited(14, TmpStr, Delim),
        ExtractDelimited(16, TmpStr, Delim));
      Inc(insQty);
    end;
    Label6.Caption := 'Inserted ' + IntToStr(insQty) + ' orders. All procesed=' + IntToStr(processed);
    Label5.Caption := 'Updates for inventory min quantity ...';
    Application.ProcessMessages;
    DM.UpdateMinQty;
    Label5.Caption := 'Done.';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmMain.btnDayRepClick(Sender: TObject);
var date1: string;
begin
  date1 := DateToStr(IncDay(Date, -1));
  ppLabel1.Caption := 'Last day orders';
  qRep.Active := false;
  qRep.SQL.Clear;
  qRep.SQL.Add('select * from inventory where lastorder>"' + date1 + '"');
  qRep.Active := true;
  ppRep.Print;
end;

procedure TfmMain.btnWeekRepClick(Sender: TObject);
var date1: string;
begin
  ppLabel1.Caption := 'Last week orders';
  date1 := DateToStr(IncDay(Date, -7));
  qRep.Active := false;
  qRep.SQL.Clear;
  qRep.SQL.Add('select * from inventory where lastorder>"' + date1 + '"');
  qRep.Active := true;
  ppRep.Print;
end;

procedure TfmMain.btnMonthRepClick(Sender: TObject);
var date1: string;
begin
  ppLabel1.Caption := 'Last month orders';
  date1 := DateToStr(IncDay(Date, -30));
  qRep.Active := false;
  qRep.SQL.Clear;
  qRep.SQL.Add('select * from inventory where lastorder>"' + date1 + '"');
  qRep.Active := true;
  ppRep.Print;
end;

procedure TfmMain.ppRepPreviewFormCreate(Sender: TObject);
begin
  with (Sender as TppReport) do
  begin
    PreviewForm.WindowState := wsMaximized;
    TppViewer(PreviewForm.Viewer).ZoomSetting := zs100Percent;
  end;
end;

procedure TfmMain.btnPrintLinesClick(Sender: TObject);
begin
  qRep.Active := false;
  qRep.SQL.Clear;
  qRep.SQL.Add('select SellerSku,FfSku,QtyInv,QtyMin,QtyOrd,LastOrder');
  qRep.SQL.Add('from  inventory ');
  qRep.SQL.Add('order by QtyOrd desc');
//  qRep.SQL.Add('LIMIT 0, 20');
  qRep.Active := true;
  ppPrintLines.PageLimit := 1;
  ppPrintLines.Print;
end;

end.

