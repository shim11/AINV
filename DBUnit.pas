unit DBUnit;

interface

uses
  SysUtils, Classes, DB, Dialogs, DateUtils, ExtCtrls,
  MyFunctions, Forms, Graphics,
  XMLDoc, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdSMTP, frxExportImage, frxExportCSV, frxExportHTML, frxExportPDF,
  Xml.Win.msxmldom, Xml.XMLIntf, Xml.xmldom, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, frxClass,
  frxDBSet, IdUDPServer, IdGlobal, IdSocketHandle, IdUDPBase, IdHTTP,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, SqlTimSt, frxBarcode,
  frxExportBaseDialog;

type
  RefreshRes = record
    ItemsCount, Inventory, MyCost, Price: string;
  end;

  TVendorArray = array of string;

  TDM = class(TDataModule)
    dsItems: TDataSource;
    dsVendors: TDataSource;
    dsPO: TDataSource;
    dsPOLines: TDataSource;
    dsAInv: TDataSource;
    dsProfitReport: TDataSource;
    dsWarehouses: TDataSource;
    dsUnsplittedItems: TDataSource;
    tbVendors: TFdTable;
    tbItems: TFdTable;
    qAInv: TFdQuery;
    tbPo: TFdTable;
    tbPOLines: TFdTable;
    tbProfitReport: TFdTable;
    tbWarehouses: TFdTable;
    tbUnsplittedItems: TFdTable;
    tbPOLinesfldQtyOrd30: TIntegerField;
    tbPOLinesfldQtyOrd10: TIntegerField;
    tbPoVendorName: TStringField;
    tbPOLinescaseQty: TIntegerField;
    qProfitReport: TFdQuery;
    qRep: TFdQuery;
    qPoReport: TFdQuery;
    SMTP: TIdSMTP;
    XMLDocument1: TXMLDocument;
    qRep5000: TFdQuery;
    frx5000: TfrxReport;
    frxDs5000: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxCSVExport1: TfrxCSVExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxProfitReport: TfrxReport;
    frxDsProfitReport: TfrxDBDataset;
    frxTwoCompareProfit: TfrxReport;
    frxDsTwoCompareProfit: TfrxUserDataSet;
    frxDsCompareProfitReport: TfrxUserDataSet;
    frxCompareProfitReport: TfrxReport;
    receiver: TIdUDPServer;
    frxRep: TfrxReport;
    frxDsRep: TfrxDBDataset;
    frxPrintLines: TfrxReport;
    frxDsPoReport: TfrxDBDataset;
    frxPoReport: TfrxReport;
    HTTP1: TIdHTTP;
    tbSelfInfo: TFdTable;
    tbMailArchive: TFdTable;
    tbItemsProfit: TFdTable;
    tbPOLinesprofitDol: TFloatField;
    tbPOLinesprofitPer: TFloatField;
    frxCompareItemProfitByDates: TfrxReport;
    frxDsCompareItemProfitByDates: TfrxDBDataset;
    qCompByDates: TFdQuery;
    AlonDb: TFDConnection;
    tbVendorsvendorname: TWideStringField;
    tbVendorsfullname: TWideStringField;
    tbVendorscompany: TWideStringField;
    tbVendorsshipvia: TWideStringField;
    tbVendorsaddress: TWideStringField;
    tbVendorspobox: TWideStringField;
    tbVendorscity: TWideStringField;
    tbVendorsstate: TWideStringField;
    tbVendorszip: TWideStringField;
    tbVendorscountry: TWideStringField;
    tbVendorsphone: TWideStringField;
    tbVendorsphone2: TWideStringField;
    tbVendorsfax: TWideStringField;
    tbVendorsemail: TWideStringField;
    tbVendorsminorder: TBCDField;
    tbVendorsprefix: TWideStringField;
    tbVendorsadd: TWideStringField;
    tbVendorsterms: TWideStringField;
    tbVendorsfob: TWideStringField;
    tbVendorsisactive: TBooleanField;
    tbItemssku: TWideStringField;
    tbItemstitle: TWideStringField;
    tbItemsdescription: TWideStringField;
    tbItemscaseqty: TSmallintField;
    tbItemsweight: TBCDField;
    tbItemsprice: TBCDField;
    tbItemsqtyinv: TIntegerField;
    tbItemsfbacost: TBCDField;
    tbItemsmycost: TBCDField;
    tbItemsffsku: TWideStringField;
    tbItemsasin: TWideStringField;
    tbItemsqtymin: TIntegerField;
    tbItemsqtyord: TIntegerField;
    tbItemsqtymin10: TIntegerField;
    tbItemsqtyord10: TIntegerField;
    tbItemslastorderdate: TSQLTimeStampField;
    tbItemsqtyreceived: TIntegerField;
    tbItemsisactive: TBooleanField;
    tbItemsaddtopo: TBooleanField;
    tbItemsqtyordered: TIntegerField;
    tbItemsvendor: TWideStringField;
    tbItemsvendorqty: TIntegerField;
    tbItemsvendorqtyupdate: TSQLTimeStampField;
    tbItemsneedcase: TBooleanField;
    tbItemsoversize: TBooleanField;
    tbItemsmycost_changed: TBooleanField;
    tbItemsisvendoractive: TBooleanField;
    tbItemsProfitsku: TWideStringField;
    tbItemsProfitprofit_dol: TBCDField;
    tbItemsProfitprofit_percent: TBCDField;
    tbItemsProfitlast_update: TSQLTimeStampField;
    tbPopo: TIntegerField;
    tbPovendor: TWideStringField;
    tbPoorderdate: TSQLTimeStampField;
    tbPosentdate: TSQLTimeStampField;
    tbPoreceiveddate: TSQLTimeStampField;
    tbPototalprice: TBCDField;
    tbPowithcases: TBooleanField;
    tbPOLinespo: TIntegerField;
    tbPOLinesline: TSmallintField;
    tbPOLinessku: TWideStringField;
    tbPOLinesqty: TIntegerField;
    tbPOLinesprice: TBCDField;
    tbPOLinesqtyreceived: TIntegerField;
    tbPOLineschecked: TBooleanField;
    tbPOLinesamazonpo: TWideStringField;
    tbPOLineswhname: TWideStringField;
    tbPOLineslabelprep: TWideStringField;
    tbPOLinesshipid: TWideStringField;
    tbUnsplittedItemspo: TIntegerField;
    tbUnsplittedItemsline: TSmallintField;
    tbUnsplittedItemssku: TWideStringField;
    tbUnsplittedItemsqty: TIntegerField;
    tbUnsplittedItemsprice: TBCDField;
    tbUnsplittedItemsqtyreceived: TIntegerField;
    tbUnsplittedItemschecked: TBooleanField;
    tbUnsplittedItemsamazonpo: TWideStringField;
    tbUnsplittedItemswhname: TWideStringField;
    tbUnsplittedItemslabelprep: TWideStringField;
    tbUnsplittedItemsshipid: TWideStringField;
    tbProfitReportorderid: TWideStringField;
    tbProfitReportsku: TWideStringField;
    tbProfitReportvendor: TWideStringField;
    tbProfitReportorderdate: TSQLTimeStampField;
    tbProfitReportqty: TBCDField;
    tbProfitReportprincipal: TBCDField;
    tbProfitReportshipping: TBCDField;
    tbProfitReportfbaperunitfulfillmentfee: TBCDField;
    tbProfitReportfbaweightbasedfee: TBCDField;
    tbProfitReportfbaperorderfulfillmentfee: TBCDField;
    tbProfitReportcommission: TBCDField;
    tbProfitReportnetto: TBCDField;
    tbProfitReportainvcost: TBCDField;
    tbProfitReportprofit: TBCDField;
    tbWarehouseswhname: TWideStringField;
    tbWarehousesline1: TWideStringField;
    tbWarehousesline2: TWideStringField;
    tbWarehousesline3: TWideStringField;
    tbWarehousesline4: TWideStringField;
    tbSelfInfotype: TWideStringField;
    tbSelfInfomyname: TWideStringField;
    tbSelfInfoshortname: TWideStringField;
    tbSelfInfocompany: TWideStringField;
    tbSelfInfocompanyshortname: TWideStringField;
    tbSelfInfoaddress: TWideStringField;
    tbSelfInfopobox: TWideStringField;
    tbSelfInfocity: TWideStringField;
    tbSelfInfostate: TWideStringField;
    tbSelfInfozip: TWideStringField;
    tbSelfInfocountry: TWideStringField;
    tbSelfInfophone: TWideStringField;
    tbSelfInfophone2: TWideStringField;
    tbSelfInfofax: TWideStringField;
    tbSelfInfoemail: TWideStringField;
    tbSelfInfosmtp_server: TWideStringField;
    tbSelfInfosmtp_port: TSmallintField;
    tbSelfInfosmtp_user: TWideStringField;
    tbSelfInfosmtp_password: TWideStringField;
    tbMailArchivedoctype: TWideStringField;
    tbMailArchiveorderno: TWideStringField;
    tbMailArchiveorderversion: TIntegerField;
    tbMailArchivesentto: TWideStringField;
    tbMailArchivecc: TWideStringField;
    tbMailArchivesubject: TWideStringField;
    tbMailArchivenote: TWideStringField;
    tbMailArchiveattachedfilename: TWideStringField;
    tbMailArchivesentdate: TSQLTimeStampField;
    qAInvsku: TWideStringField;
    qAInvtitle: TWideStringField;
    qAInvdescription: TWideStringField;
    qAInvcaseqty: TSmallintField;
    qAInvweight: TBCDField;
    qAInvprice: TBCDField;
    qAInvqtyinv: TIntegerField;
    qAInvfbacost: TBCDField;
    qAInvmycost: TBCDField;
    qAInvffsku: TWideStringField;
    qAInvasin: TWideStringField;
    qAInvqtymin: TIntegerField;
    qAInvqtyord: TIntegerField;
    qAInvqtymin10: TIntegerField;
    qAInvqtyord10: TIntegerField;
    qAInvlastorderdate: TSQLTimeStampField;
    qAInvqtyreceived: TIntegerField;
    qAInvisactive: TBooleanField;
    qAInvaddtopo: TBooleanField;
    qAInvqtyordered: TIntegerField;
    qAInvvendor: TWideStringField;
    qAInvvendorqty: TIntegerField;
    qAInvvendorqtyupdate: TSQLTimeStampField;
    qAInvneedcase: TBooleanField;
    qAInvoversize: TBooleanField;
    qAInvmycost_changed: TBooleanField;
    qAInvisvendoractive: TBooleanField;
    tbVendorscontact_person: TWideStringField;
    qAInvqtywh: TIntegerField;
    tbItemsqtywh: TIntegerField;
    tbPoadded: TBooleanField;
    tbPobulkpo: TBooleanField;
    tbPobulkorders: TWideStringField;
    qSkuPo: TFdQuery;
    dsSkuPo: TDataSource;
    dsSelfInfo: TDataSource;
    frxPrintItemLabels: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    qItemLabels: TFdQuery;
    frxDsItemLabels: TfrxDBDataset;
    tbSearchItems: TFdTable;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    SmallintField1: TSmallintField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    IntegerField1: TIntegerField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    SQLTimeStampField1: TSQLTimeStampField;
    IntegerField6: TIntegerField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    IntegerField7: TIntegerField;
    WideStringField6: TWideStringField;
    IntegerField8: TIntegerField;
    SQLTimeStampField2: TSQLTimeStampField;
    BooleanField3: TBooleanField;
    BooleanField4: TBooleanField;
    BooleanField5: TBooleanField;
    BooleanField6: TBooleanField;
    IntegerField9: TIntegerField;
    dsSearchItems: TDataSource;
    tbPOLinesMySku: TStringField;
    tbMailArchivebody: TWideMemoField;
    tbMailArchiveattached: TWideMemoField;
    tbReconReport: TFdTable;
    tbReconReportshipid: TWideStringField;
    tbReconReportshipcreatedate: TSQLTimeStampField;
    tbReconReportdeleted: TIntegerField;
    tbReconReportlastupdate: TSQLTimeStampField;
    tbReconReportread: TIntegerField;
    dsReconReport: TDataSource;
    tbSelfInforeplyTo: TWideStringField;
    OD: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbPOLinesCalcFields(DataSet: TDataSet);
    procedure tbPoCalcFields(DataSet: TDataSet);
    procedure tbItemsmycostChange(Sender: TField);
    procedure tbItemsAfterPost(DataSet: TDataSet);
    procedure frxDsTwoCompareProfitGetValue(const VarName: string;
      var Value: Variant);
    procedure frxDsCompareProfitReportGetValue(const VarName: string;
      var Value: Variant);
    procedure receiverUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tbPOLinesAfterDelete(DataSet: TDataSet);
    procedure tbPOLinesBeforeDelete(DataSet: TDataSet);
    procedure tbVendorsAfterPost(DataSet: TDataSet);
    procedure tbVendorsisactiveChange(Sender: TField);
    procedure tbVendorsAfterInsert(DataSet: TDataSet);
    procedure tbItemsBeforePost(DataSet: TDataSet);
    procedure tbPOLinesAfterInsert(DataSet: TDataSet);
    procedure tbPOLinesBeforePost(DataSet: TDataSet);
    procedure tbPOLinesMySkuChange(Sender: TField);
    procedure tbVendorsBeforeDelete(DataSet: TDataSet);
    procedure tbReconReportdeletedGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);

  private
    { Private declarations }
  public
    qtyWhChanged: Boolean;
    cpVendors: array of string;
    vendorActiveChanged: Boolean;
    cpMonth1, cpMonth2, cpMonth3, cpMonth4, cpMonth5, cpMonth6, cpMonth7,
      cpMonth8, cpMonth9, cpMonth10, cpMonth11, cpMonth12: array of Double;
    procedure UpdateInventoryQty(PartNo: string; qty: Integer);
    function FindVendorByName(VendorName: string): string;
    procedure InsertInventory(Sku, FfSku, Asin, Title, Price, qty: string);
    procedure InsertInventoryOld(Sku, FfSku, Asin, fnSku, qty: string);
    procedure InsertOrders(OrderId, OrderDate, Sku, qty: string);
    function CreatePurchaseOrderLines(PO: Integer; vendor: string;
      withCase: Boolean): Integer;
    function OrderExists(OrderId, tableName: string): Boolean;
    function ProfitOrderExists(OrderId, Sku, tableName: string): Boolean;
    function getMaxPo(vendor: string; withCases: Boolean): Integer;
    function getVendorName(vendor: string): string;
    function getSkuDesc(Sku: string): string;
    function ItemExists(Sku: string): Boolean;
    function GetInventoryStatistics(vendor: string): RefreshRes;
    procedure CheckSqlUpdate(Path: string);
    function RunSql(SqlToRun: string): string;
    function getVendorFromSelectedItems(): string;
    procedure RefreshQuery(query: TDataSet);
    function GetCountAddedToPO(): Integer;
    function getTotalPo(poNum: Integer): Double;
    procedure UpdateQtyReceived(PO: string; receiveAllQty: Boolean);
    procedure UpdateMultiPOQtyReceived();
    function FindPoBySKU(Sku: string): Integer;
    procedure UpdateMinQty();
    procedure RenumberPurchaseOrderLines(PO: string);
    procedure ResetPurchaseOrderLines(PO: string);
    function CreatePurchaseOrders(vendor: string): Integer;
    function splitPo199(PO: string): String;
    function getCaseQty(Sku: string): Integer;
    function getNeedCase(Sku: string): Boolean;
    function CalcQtyByCase(qty, caseQty: Integer): Integer;
    procedure UpdateQtyOrdByCaseQty(Sku: string = '');
    procedure checkQtyOrdByCaseQty(updateAnyway: Boolean = false);
    function getffSku(Sku: string): string;
    function PoExists(PO: Integer): Boolean;
    function getMaxPoLine(poNum: Integer): Integer;
    function fillCombo(tableS, field, conds: string; addAll: Boolean;
      addEmpty: Boolean = false): TStringList;
    procedure UpdateMinQty10();
    function getMyCost(Sku: string): Double;
    function GetChecked(PO, line: string): Boolean;
    function getLastUpdateInvQty(vendor: string): TDateTime;
    function getProfitVendorsCount(vendors: string;
      dateFromPar, DateToPar: TDateTime): Integer;
    function getVendorsForProfitReport(vendors: string; cpVendors: TVendorArray;
      dateFromPar, DateToPar: TDateTime): TVendorArray;
    function isUpdateVendors(vendor: string): Boolean;
    procedure InsertOrUpdatePOLines(PO, Sku, warehouse, amazonOrder, qty,
      labelprep: string);
    procedure CheckPoLinesDuplicates();
    procedure InsertWarehouse(warehouse, aname, line2, line3: string);
    function getSqlResult(SQLStr: string): string;
    function getAddToPoItems(): TStringList;
    function getAddedPo(): TStringList;
    function DeleteDuplicatePOLines(PO: string): Boolean;
    function getSkuQtyPoLine(poNum: Integer; Sku: String): Integer;
    function BuildSearchFilter(SearchStr, tableName, strField, skuFld: string;
      ordernoFld: String = 'orderno'): string;
    procedure insertUpdateItemsProfit();
  end;

var
  DM: TDM;

implementation

uses InventoryForm;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  AlonDb.Connected := false;
  AlonDb.Params.Database := 'AlonDb';
  AlonDb.Params.UserName := 'alon';
  AlonDb.Params.Password := 'ag1616';
  AlonDb.Params.DriverID := 'PG';
  AlonDb.DriverName := 'PG';
  AlonDb.Connected := true;
  RunSql('update ai_items set addtopo = false');
  RunSql('update po set added = false');
  dsItems.DataSet.Active := true;
  dsVendors.DataSet.Active := true;
  dsAInv.DataSet.Active := true;
  dsSelfInfo.DataSet.Active := true;
  tbPo.IndexFieldNames := 'OrderDate';
  CheckSqlUpdate(ExtractFilePath(ParamStr(0)));
  receiver.DefaultPort := registerUser(AlonDb, USER_APP_AINV);
  receiver.Active := true;
  vendorActiveChanged := false;
  // DM.RunSql('update profitreport pr set vendor=(select vendor from ai_items i where i.sku=pr.sku and vendor>"") where vendor=""');
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  unregisterUser(AlonDb, USER_APP_AINV);
end;

function TDM.getAddToPoItems(): TStringList;
begin
  result := fillCombo('ai_items', 'SKU', ' where addtopo=true', false);
end;

function TDM.getAddedPo(): TStringList;
begin
  result := fillCombo('po', 'po', ' where added=true', false);
end;

function TDM.fillCombo(tableS, field, conds: string; addAll: Boolean;
  addEmpty: Boolean = false): TStringList;
var
  StrLst: TStringList;
  q: TFdQuery;
begin
  StrLst := TStringList.Create;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select ' + field + ' from ' + tableS);
      if (conds > '') then
        SQL.Add(' ' + conds);
      SQL.Add(' order by ' + field);
      // ShowMessage(SQL.Text);
      if (addAll) then
        StrLst.Add('ALL');
      Active := true;
      First;
      while not Eof do
      begin
        StrLst.Add(Fields[0].AsString);
        Next;
      end;
    end;
    if (addEmpty) then
      StrLst.Add('<<EMPTY>>');
  finally
    q.Free;
  end;
  result := StrLst;
end;

procedure TDM.CheckSqlUpdate(Path: string);
var
  SR: TSearchRec;
  tmpLst: TStringList;
begin
  tmpLst := TStringList.Create;
  if FindFirst(Path + '*.sql', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        tmpLst.LoadFromFile(Path + SR.Name);
        RunSql(tmpLst.Text);
        if (not DirectoryExists(Path + 'SQL\')) then
          CreateDir(Path + 'SQL\');
        tmpLst.SaveToFile(Path + 'SQL\' + SR.Name + 'old');
        DeleteFile(Path + SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function TDM.RunSql(SqlToRun: string): string;
begin
  result := RunSqlP(AlonDb, SqlToRun, '');
end;

procedure TDM.insertUpdateItemsProfit();
var
  q: TFdQuery;
  Sku, itemProfit, percProfit: string;
begin
  RunSql('delete from items_profit');
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select  sku, sum(profit) / sum(qty) as itemProfit,');
      SQL.Add('(((sum(profit) / sum(qty) ) / ((sum(ainvcost) / sum(qty))) / sum(qty)) * 100) as percentProfit');
      SQL.Add('from  profitreport');
      SQL.Add('where ainvcost > 0 and principal > 0 and orderdate >' +
        QuotedStr(DateToStr(IncMonth(Now, -3))));
      SQL.Add('group by sku order by sku');
      Active := true;
      First;
      while not Eof do
      begin
        Sku := Fields[0].AsString;
        itemProfit := Fields[1].AsString;
        percProfit := Fields[2].AsString;
        RunSql('insert into items_profit (sku, profit_dol, profit_percent, last_update) values('
          + QuotedStr(Sku) + ',' + itemProfit + ',' + percProfit + ',' +
          QuotedStr(DateToStr(Now)) + ')');
        Next;
      end;
    end;
  finally
    q.Free;
    fmInventory.messagePanel.visible := false;
  end;
end;

procedure TDM.tbItemsAfterPost(DataSet: TDataSet);
var
  // q: TFdQuery;
  Sku: string;
  MyCost: string;
begin
  try
    fmInventory.messagePanel.visible := true;
    fmInventory.lbMsg1.Caption := 'Wait while updating cost ';
    fmInventory.lbMsg2.Caption := '     and profit ';
    fmInventory.lbMsg3.Caption := 'in ProfitReport table ...';
    fmInventory.messagePanel.Refresh;
    if (qtyWhChanged) then
    begin
      qtyWhChanged := false;
      UpdateQtyOrdByCaseQty(tbItemssku.Value);
    end;
    if (tbItems.FieldByName('mycost_changed').AsBoolean = true) then
    begin
      Sku := tbItems.FieldByName('sku').AsString;
      MyCost := tbItems.FieldByName('mycost').AsString;
      RunSql('update profitreport set ainvCost=' + MyCost + ' where sku=' +
        QuotedStr(Sku));
      RunSql('update profitreport set  profit=netto-(ainvcost*qty) where sku=' +
        QuotedStr(Sku));
      RunSql('update ai_items set  mycost_changed=false where sku=' +
        QuotedStr(Sku));
    end;
    // q := TFdQuery.Create(nil);
    // with q do
    // begin
    // Connection := AlonDb;
    // Active := false;
    // SQL.Clear;
    // SQL.Add('select sku, mycost from  ai_items where mycost_changed=true');
    // Active := true;
    // First;
    // while not Eof do
    // begin
    // Sku := Fields[0].AsString;
    // MyCost := Fields[1].AsString;
    // RunSql('update profitreport set ainvCost=' + MyCost + ' where sku=' + QuotedStr(Sku));
    // RunSql('update profitreport set  profit=netto-(ainvcost*qty) where sku=' + QuotedStr(Sku));
    // RunSql('update ai_items set  mycost_changed=false where sku=' + QuotedStr(Sku));
    // Next;
    // end;
    // end;
  finally
    // q.Free;
    fmInventory.messagePanel.visible := false;
  end;
end;

procedure TDM.tbItemsBeforePost(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('qtywh').OldValue <> DataSet.FieldByName('qtywh')
    .Value) then
  begin
    qtyWhChanged := true;
  end;
end;

procedure TDM.tbItemsmycostChange(Sender: TField);
begin
  Sender.DataSet.FieldByName('mycost_changed').AsBoolean := true;
end;

procedure TDM.tbPoCalcFields(DataSet: TDataSet);
var
  q: TFdQuery;
  VendorName: string;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select fullname from vendors where vendorname=' +
        QuotedStr(tbPovendor.AsString));
      Active := true;
      VendorName := Fields[0].AsString;
    end;
  finally
    q.Free;
  end;
  tbPoVendorName.Value := VendorName;
end;

procedure TDM.tbPOLinesAfterDelete(DataSet: TDataSet);
var
  PO: string;
begin
  PO := DataSet.FieldByName('PO').AsString;
  RunSql('update po set totalprice=' + FloatToStr(DM.getTotalPo(StrToInt(PO))) +
    ' where po=' + PO);
  RefreshQuery(tbItems);
  RefreshQuery(tbPo);
end;

procedure TDM.tbPOLinesAfterInsert(DataSet: TDataSet);
var
  line: String;
begin
  line := DataSet.FieldByName('line').AsString;
  if (line = '') then
  begin
    line := getSqlResult('select (max(line) + 1) from polines where po=' +
      DataSet.FieldByName('PO').AsString);
    if (line = '') then
      line := '1';
    DataSet.FieldByName('line').Value := StrToInt(line);
  end;
end;

procedure TDM.tbPOLinesBeforeDelete(DataSet: TDataSet);
var
  PO, Sku: string;
begin
  Sku := DataSet.FieldByName('sku').AsString;
  PO := DataSet.FieldByName('PO').AsString;
  addActivity(DM.AlonDb, 'DeletePoline sku=' + Sku + ' from po=' + PO);
  RunSql('update ai_items set lastorderdate=null where sku=' + QuotedStr(Sku));
end;

procedure TDM.tbPOLinesBeforePost(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('sku').AsString = '') then
    DataSet.Delete;
end;

procedure TDM.tbPOLinesCalcFields(DataSet: TDataSet);
var
  q: TFdQuery;
  qty30, qty10, caseQty: Integer;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select qtyord, qtyord10, caseqty from ai_items where sku=' +
        QuotedStr(tbPOLinessku.AsString));
      Active := true;
      qty30 := Fields[0].AsInteger;
      qty10 := Fields[1].AsInteger;
      caseQty := Fields[2].AsInteger;
    end;
  finally
    q.Free;
  end;
  tbPOLinesfldQtyOrd30.Value := qty30;
  tbPOLinesfldQtyOrd10.Value := qty10;
  tbPOLinescaseQty.Value := caseQty;
end;

procedure TDM.tbPOLinesMySkuChange(Sender: TField);
var
  Sku: String;
begin
  if ((Sender.FieldName = 'sku') and (Sender.Value <> '')) then
  begin
    Sku := Sender.Value;
    Sender.DataSet.FieldByName('qty').Value := getCaseQty(Sku);
    Sender.DataSet.FieldByName('price').Value := getMyCost(Sku);
  end;
end;

procedure TDM.tbReconReportdeletedGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (Sender.AsString = '1') then
    Text := 'Deleted'
  else
    Text := '';
end;

procedure TDM.tbVendorsBeforeDelete(DataSet: TDataSet);
var
  pass: String;
begin
  pass := '';
  InputQuery('Password needed',
    'Please enter password for delete vendor', pass);
  if (pass <> '0601') then
  begin
    ShowMessage('Vendor ' + DataSet.FieldByName('vendorname').AsString +
      ' was not deleted');
    addActivity(AlonDb, 'DM.tbVendorsBeforeDelete pass=' + pass + 'Vendor ' +
      DataSet.FieldByName('vendorname').AsString + ' was not deleted');
    Abort;
  end
  else
  begin
    ShowMessage('Vendor ' + DataSet.FieldByName('vendorname').AsString +
      ' was deleted');
    addActivity(AlonDb, 'DM.tbVendorsBeforeDelete pass=' + pass + ' vendor ' +
      DataSet.FieldByName('vendorname').AsString + ' was deleted');
  end;
end;

procedure TDM.tbVendorsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('isactive').AsBoolean := true;
  vendorActiveChanged := false;
end;

procedure TDM.tbVendorsAfterPost(DataSet: TDataSet);
var
  isactive: String;
begin
  if (vendorActiveChanged) then
  begin
    vendorActiveChanged := false;
    if (DataSet.FieldByName('isactive').AsBoolean) then
      isactive := 'true'
    else
      isactive := 'false';
    RunSql('update ai_items set isvendoractive=' + QuotedStr(isactive) +
      ' where vendor=' + QuotedStr(DataSet.FieldByName('vendorname').AsString));
    qAInv.Refresh;
    fmInventory.cbVendors.Items := DM.fillCombo('vendors', 'vendorname',
      ' where isactive=true', true);
    fmInventory.cbVendors.ItemIndex := 0;
    fmInventory.cbSetVendor.Items := DM.fillCombo('vendors', 'vendorname',
      ' where isactive=true', true);
    fmInventory.cbSetVendor.ItemIndex := 0;
    fmInventory.cbPoReportVendors.Items := DM.fillCombo('vendors', 'vendorname',
      ' where isactive=true', true);
    fmInventory.cbPoReportVendors.ItemIndex := 0;
    fmInventory.cbVendorsSelect(nil);
  end;
end;

procedure TDM.tbVendorsisactiveChange(Sender: TField);
begin
  vendorActiveChanged := true;
end;

procedure TDM.RefreshQuery(query: TDataSet);
begin
  with query do
  begin
    Refresh;
  end;
end;

function TDM.GetCountAddedToPO(): Integer;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select count(*) from ai_items where addtopo=true');
      // ShowMessage(SQL.Text);
      Active := true;
      result := Fields[0].AsInteger;
    end;
  finally
    q.Free;
  end;
end;

function TDM.GetInventoryStatistics(vendor: string): RefreshRes;
var
  q: TFdQuery;
  res: RefreshRes;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select count(*), sum(qtyinv), sum(price*qtyinv), sum(mycost*qtyinv) from ai_items where isactive=true');
      if (vendor <> 'ALL') then
        SQL.Add(' and vendor=' + QuotedStr(vendor));
      // ShowMessage(SQL.Text);
      Active := true;
      res.ItemsCount := Trim(Fields[0].AsString);
      res.Inventory := Trim(Fields[1].AsString);
      res.MyCost := Trim(Fields[3].AsString);
      res.Price := Trim(Fields[2].AsString);
      result := res;
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.UpdateInventoryQty(PartNo: string; qty: Integer);
var
  qUpdateInventory: TFdQuery;
begin
  qUpdateInventory := TFdQuery.Create(nil);
  try
    with qUpdateInventory do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('update ai_items set qtyinv=' + IntToStr(qty));
      SQL.Add(' where sku=' + QuotedStr(PartNo));
      ExecSQL;
    end;
  finally
    qUpdateInventory.Free;
  end;
end;

procedure TDM.InsertInventoryOld(Sku, FfSku, Asin, fnSku, qty: string);
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('insert into ai_items (Sku,FfSku,Asin,fnsku,QtyInv,isactive,caseqty)');
      SQL.Add('values(' + QuotedStr(Sku) + ',' + QuotedStr(FfSku) + ',' +
        QuotedStr(Asin) + ',' + QuotedStr(fnSku) + ',' + qty + ', true,1)');
      // ShowMessage(SQL.Text);
      ExecSQL;
    end;
  finally
    q.Free;
  end;
end;

function TDM.FindVendorByName(VendorName: string): string;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select vendorname from vendors where UPPER(fullname) like ' +
        QuotedStr(UpperCase(VendorName) + '%') + ' or UPPER(vendorname) like ' +
        QuotedStr(UpperCase(VendorName) + '%'));
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      result := Fields[0].AsString;
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.InsertInventory(Sku, FfSku, Asin, Title, Price, qty: string);
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('insert into ai_items (Sku,FfSku,Asin,Title,Price,QtyInv,QtyMin,QtyOrd)');
      SQL.Add('values("' + Sku + '","' + FfSku + '","' + Asin + '",');
      SQL.Add(QuotedStr(Title) + ',' + Price + ',' + qty + ',' + qty + ',0)');
      try
        ExecSQL;
      except
        ShowMessage(SQL.Text);
      end;
    end;
  finally
    q.Free;
  end;
end;

function TDM.ProfitOrderExists(OrderId, Sku, tableName: string): Boolean;
var
  q: TFdQuery;
  b: Boolean;
  Str: string;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select orderid from ' + tableName + ' where orderid=' +
        QuotedStr(OrderId) + ' and SKU=' + QuotedStr(Sku));
      Active := true;
      Str := Trim(Fields[0].AsString);
      if (Str = '') then
        b := false
      else
        b := true;
      result := b;
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.receiverUDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  Str: string;
begin
  Str := copy(PAnsiChar(AData), 0, Length(AData));
  if (Pos(ACTIVITY_MESSAGE, Str) > 0) then
  begin
    Str := copy(Str, 9, Length(Str) - 8);
    ShowMessage(Str);
  end;
  if (Str = ACTIVITY_CLOSE) then
  begin
    fmInventory.prepareToExit(ACTIVITY_CLOSE);
  end;
  if (Str = ACTIVITY_VERSION) then
  begin
    fmInventory.prepareToExit(ACTIVITY_VERSION);
  end;
  if (Str = ACTIVITY_RESTART) then
  begin
    fmInventory.prepareToExit(ACTIVITY_RESTART);
  end;

  // receiver.Send('localhost',1299,GetCurrentUserName + ' user Answer on '+ str);
end;

function TDM.OrderExists(OrderId, tableName: string): Boolean;
var
  q: TFdQuery;
  b: Boolean;
  Str: string;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select orderid from ' + tableName + ' where orderid=' +
        QuotedStr(OrderId));
      Active := true;
      Str := Trim(Fields[0].AsString);
      if (Str = '') then
        b := false
      else
        b := true;
      result := b;
    end;
  finally
    q.Free;
  end;
end;

function TDM.ItemExists(Sku: string): Boolean;
var
  q: TFdQuery;
  Str: string;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select * from ai_items where SKU=' + QuotedStr(Sku));
      Active := true;
      Str := Trim(Fields[0].AsString);
      result := Sku = Str;
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.InsertOrders(OrderId, OrderDate, Sku, qty: string);
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('insert into ai_orders (OrderId,OrderDate,Sku,Qty)');
      SQL.Add('values(' + QuotedStr(OrderId) + ',' + QuotedStr(OrderDate) + ','
        + QuotedStr(Sku) + ',' + qty + ')');
      // ShowMessage(SQL.Text);
      ExecSQL;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getMaxPo(vendor: string; withCases: Boolean): Integer;
var
  q: TFdQuery;
  res: Integer;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      if (withCases) then
        SQL.Add('select max(po) from po where vendor=' + QuotedStr(vendor) +
          ' and sentdate is null and withCases=true')
      else
        SQL.Add('select max(po) from po where vendor=' + QuotedStr(vendor) +
          ' and sentdate is null and withCases=false');
      Active := true;
      res := Fields[0].AsInteger;
      if (res = 0) then
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('select max(po) from po');
        Active := true;
        res := Fields[0].AsInteger;
        Inc(res);
        if (res = 1) then
          res := 1001;
      end;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.PoExists(PO: Integer): Boolean;
var
  q: TFdQuery;
  res: Integer;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select po from po where po=' + IntToStr(PO));
      Active := true;
      res := Fields[0].AsInteger;
      result := (res = PO);
    end;
  finally
    q.Free;
  end;
end;

function TDM.GetChecked(PO, line: string): Boolean;
var
  q: TFdQuery;
  res: Boolean;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select checked from polines where po=' + PO +
        ' and line=' + line);
      Active := true;
      res := Fields[0].AsBoolean;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getTotalPo(poNum: Integer): Double;
var
  q: TFdQuery;
  res: Double;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select sum(qty*price) from polines where po=' + IntToStr(poNum));
      Active := true;
      res := Fields[0].AsFloat;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getMaxPoLine(poNum: Integer): Integer;
var
  q: TFdQuery;
  res: Integer;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select max(line) from polines where po=' + IntToStr(poNum));
      Active := true;
      res := Fields[0].AsInteger;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getSkuQtyPoLine(poNum: Integer; Sku: String): Integer;
var
  q: TFdQuery;
  res: Integer;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select qty from polines where po=' + IntToStr(poNum) +
        ' and sku = ' + QuotedStr(Sku));
      Active := true;
      res := Fields[0].AsInteger;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getVendorFromSelectedItems(): string;
var
  q: TFdQuery;
  res: string;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select vendor from ai_items where addtopo=true');
      Active := true;
      res := Fields[0].AsString;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getProfitVendorsCount(vendors: string;
  dateFromPar, DateToPar: TDateTime): Integer;
var
  q: TFdQuery;
  count: Integer;
begin
  count := 0;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select vendor from  profitreport');
      SQL.Add(' where (orderdate between :DateFrom and :DateTo)');
      if ((Trim(vendors) > '')) then
      begin
        SQL.Add(' and upper(vendor) in (''' + ReplaceStr(UpperCase(vendors),
          ',', ''',''') + ''')');
      end
      else
        SQL.Add(' and vendor is not null');

      SQL.Add('group by vendor');
      ParamByName('DateFrom').AsDate := dateFromPar;
      ParamByName('DateTo').AsDate := DateToPar;
      Active := true;
      First;
      while not Eof do
      begin
        Inc(count);
        Next;
      end;
      result := count;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getVendorsForProfitReport(vendors: string; cpVendors: TVendorArray;
  dateFromPar, DateToPar: TDateTime): TVendorArray;
var
  q: TFdQuery;
  count: Integer;
begin
  count := 0;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select vendor from  profitreport');
      SQL.Add(' where (orderdate between :DateFrom and :DateTo)');
      if ((Trim(vendors) > '')) then
      begin
        SQL.Add('and upper(vendor) in (''' + ReplaceStr(UpperCase(vendors), ',',
          ''',''') + ''')');
      end
      else
        SQL.Add(' and vendor is not null');

      SQL.Add('group by vendor');
      SQL.Add('order by vendor');
      ParamByName('DateFrom').AsDate := dateFromPar;
      ParamByName('DateTo').AsDate := DateToPar;
      Active := true;
      First;
      while not Eof do
      begin
        cpVendors[count] := Fields[0].AsString;
        Inc(count);
        Next;
      end;
      result := cpVendors;
    end;
  finally
    q.Free;
  end;
end;

function TDM.isUpdateVendors(vendor: string): Boolean;
begin
  // result := (UpperCase(vendor) = 'TMC') or (UpperCase(vendor) = 'BNF') or (UpperCase(vendor) = 'SC');
  result := (UpperCase(vendor) = 'TMC') or (UpperCase(vendor) = 'BNF');
end;

function TDM.CreatePurchaseOrderLines(PO: Integer; vendor: string;
  withCase: Boolean): Integer;
var
  q: TFdQuery;
  Sku, Price: string;
  qty, lineNo, qty10, vendQty, caseQty, createdLines: Integer;
begin
  createdLines := 0;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      if (withCase) then
        SQL.Add('select SKU,QtyOrd,mycost, qtyOrd10, vendorQty, caseqty from ai_items where isactive = true and addtopo = true and vendor='
          + QuotedStr(vendor) + ' and caseqty > 1 order by sku')
      else
        SQL.Add('select SKU,QtyOrd,mycost, qtyOrd10, vendorQty, caseqty from ai_items where isactive = true and addtopo = true and vendor='
          + QuotedStr(vendor) + ' and caseqty = 1 order by sku');
      Active := true;
      First;
      lineNo := getMaxPoLine(PO);
      while not Eof do
      begin
        Inc(lineNo);
        Sku := Fields[0].AsString;
        qty := Fields[1].AsInteger;
        Price := Fields[2].AsString;
        qty10 := Fields[3].AsInteger;
        vendQty := Fields[4].AsInteger;
        caseQty := Fields[5].AsInteger; // getCaseQty(sku);
        if ((IntToStr(vendQty) <> '0') or not(isUpdateVendors(vendor))) then
        begin
          Inc(createdLines);
          if (qty = 0) then
            qty := caseQty;
          if (qty = 0) then
            qty := 1;
          if (qty10 > qty) then
          begin
            qty := qty10;
          end;
          if ((vendQty > 0) and (qty > vendQty)) then
            qty := (vendQty div caseQty) * caseQty;
          if (Trim(Price) = '') then
            Price := '0.0';
          RunSql('insert into polines (po,line,sku,qty,price) values(' +
            IntToStr(PO) + ', ' + IntToStr(lineNo) + ', ' + QuotedStr(Sku) +
            ', ' + IntToStr(qty) + ', ' + Price + ')');
          RunSql('update ai_items set lastorderdate=' +
            QuotedStr(DateTimeToStr(Now)) + ', qtyreceived=0' + ' where sku=' +
            QuotedStr(Sku));
        end;
        Next;
      end;
      // ShowMessage(SQL.Text);
    end;
  finally
    q.Free;
    result := createdLines;
  end;
  // RefreshQuery(DM.qAInv);
end;

function TDM.splitPo199(PO: string): String;
var
  vend, bulkOrders, isBulk, retVal: String;
  curPO, poCount, i: Integer;
begin
  retVal := 'Created PO#:';
  poCount := retIntFieldValue(AlonDb,
    'select count(*) from polines where po=' + PO);
  curPO := retIntFieldValue(AlonDb, 'select max(po) from po') + 1;
  bulkOrders := retStrFieldValue(AlonDb,
    'select bulkorders from po where po=' + PO);
  if (bulkOrders > '') then
  begin
    vend := 'BULK';
    isBulk := 'true';
  end
  else
  begin
    vend := retStrFieldValue(AlonDb, 'select vendor from po where po=' + PO);
    isBulk := 'false';
  end;
  if (poCount > 199) then
  begin
    poCount := (poCount div 199);
    for i := 1 to poCount do
    begin
      retVal := retVal + #10#13 + IntToStr(curPO);
      RunSql('insert into po (po,vendor, orderdate, totalprice, bulkpo, bulkorders) values ('
        + IntToStr(curPO) + ',' + QuotedStr(vend) + ',' +
        QuotedStr(DateTimeToStr(Now)) + ',0,' + QuotedStr(isBulk) + ',' +
        QuotedStr(bulkOrders) + ')');
      RunSql('update polines set po = ' + IntToStr(curPO) + ' where po=' + PO +
        ' and line between ' + IntToStr(i * 199) + ' and ' +
        IntToStr((i + 1) * 199));
      RenumberPurchaseOrderLines(IntToStr(curPO));
      Inc(curPO);
    end;
  end;
  result := retVal;
end;

function TDM.CreatePurchaseOrders(vendor: string): Integer;
var
  q: TFdQuery;
  // vendor: string;
  PO, poCount: Integer;
begin
  checkQtyOrdByCaseQty();
  q := TFdQuery.Create(nil);
  poCount := 0;
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      if ((Trim(vendor) > '') and (UpperCase(Trim(vendor)) <> 'ALL')) then
        RunSql('update ai_items set addtopo=true where upper(vendor) like ' +
          QuotedStr(UpperCase(vendor) + '%') +
          ' and mycost>0 and qtyord>0 and LastOrderDate is null and isactive=true')
      else
        RunSql('update ai_items set addtopo=true where vendor>'''' and mycost>0 and qtyord>0 and lastorderdate is null and isactive=true');
      SQL.Add('select vendor from ai_items where addtopo=true group by vendor');
      Active := true;
      First;
      while not Eof do
      begin
        vendor := Fields[0].AsString;
        PO := getMaxPo(vendor, true);
        tbPo.Active := true;
        if (not PoExists(PO)) then
          tbPo.Insert
        else
          tbPo.Edit;
        tbPopo.Value := PO;
        tbPovendor.Value := vendor;
        tbPoorderdate.Value := DateTimeToSQLTimeStamp(Now);
        tbPo.FieldByName('withcases').Value := true;
        if (CreatePurchaseOrderLines(PO, vendor, true) > 0) then
        begin
          tbPototalprice.Value := getTotalPo(PO);
          tbPo.Post;
          // Inc(PO);
          Inc(poCount);
        end
        else
        begin
          tbPo.Cancel;
        end;
        // Second stage - PO without cases
        PO := getMaxPo(vendor, false);
        tbPo.Active := true;
        if (not PoExists(PO)) then
          tbPo.Insert
        else
          tbPo.Edit;
        tbPopo.Value := PO;
        tbPovendor.Value := vendor;
        tbPoorderdate.Value := DateTimeToSQLTimeStamp(Now);
        tbPo.FieldByName('withcases').Value := false;
        if (CreatePurchaseOrderLines(PO, vendor, false) > 0) then
        begin
          tbPototalprice.Value := getTotalPo(PO);
          tbPo.Post;
          Inc(poCount);
        end
        else
        begin
          tbPo.Cancel;
        end;
        Next;
      end;
      // ShowMessage(SQL.Text);
    end;
  finally
    q.Free;
  end;
  RunSql('update ai_items set addToPo=false');
  RefreshQuery(DM.qAInv);
  result := poCount;
end;

procedure TDM.RenumberPurchaseOrderLines(PO: string);
var
  poCount: Integer;
begin
  if (PO = '') then
    exit;
  RunSql('UPDATE polines p SET rownum = t.RN, line = line + 10000 from (SELECT po,sku,amazonpo,whname, Row_number()'
    + 'OVER (ORDER BY po,sku, amazonpo,whname) AS RN FROM polines where po=' +
    PO + ') as t where p.PO=' + PO +
    ' and p.po=t.po and p.sku=t.sku and p.amazonpo=t.amazonpo and p.whname=t.whname');
  // ' and p.po=t.po and p.sku=t.sku');
  //
  RunSql('update polines set line = rownum where po=' + PO);
end;

procedure TDM.ResetPurchaseOrderLines(PO: string);
var
  q: TFdQuery;
  Sku: string;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select sku from polines where Po =' + PO);
      Active := true;
      First;
      while not Eof do
      begin
        Sku := Fields[0].AsString;
        RunSql('update ai_items set LastOrderDate=null where SKU=' +
          QuotedStr(Sku));
        Next;
      end;
      // ShowMessage(SQL.Text);
    end;
  finally
    q.Free;
  end;
end;

function TDM.getVendorName(vendor: string): string;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select fullname from vendors where vendorname=' +
        QuotedStr(vendor));
      Active := true;
      result := Fields[0].AsString;
    end;
  finally
    q.Free;
  end;

end;

function TDM.getSkuDesc(Sku: string): string;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select title from ai_items where sku=' + QuotedStr(Sku));
      Active := true;
      result := Fields[0].AsString;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getffSku(Sku: string): string;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select ffsku from ai_items where sku=' + QuotedStr(Sku));
      Active := true;
      result := Fields[0].AsString;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getCaseQty(Sku: string): Integer;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select caseqty from ai_items where sku=' + QuotedStr(Sku));
      Active := true;
      result := Fields[0].AsInteger;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getNeedCase(Sku: string): Boolean;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select needcase from ai_items where sku=' + QuotedStr(Sku));
      Active := true;
      result := Fields[0].AsBoolean;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getSqlResult(SQLStr: string): string;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add(SQLStr);
      Active := true;
      result := Fields[0].AsString;
    end;
  finally
    q.Free;
  end;
end;

function TDM.getMyCost(Sku: string): Double;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select mycost from ai_items where sku=' + QuotedStr(Sku));
      Active := true;
      result := Fields[0].AsFloat;
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.UpdateQtyReceived(PO: string; receiveAllQty: Boolean);
var
  q: TFdQuery;
  qStr, Sku, qty, qtyR: string;
begin
  qtyR := 'qtyReceived';
  if receiveAllQty then
    qtyR := 'qty';
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select sku, ' + qtyR + ' from polines where po=' + PO + ' and ' +
        qtyR + '> 0');
      Active := true;
      First;
      while not Eof do
      begin
        Sku := Fields[0].AsString;
        qty := Fields[1].AsString;
        qStr := 'update ai_items set qtyreceived=' + qty +
          ', lastorderdate=null where sku=' + QuotedStr(Sku);
        RunSql(qStr);
        Next;
      end;
    end;
    UpdateQtyOrdByCaseQty(Sku);
  finally
    q.Free;
  end;
end;

procedure TDM.UpdateMultiPOQtyReceived();
var
  poList: TStringList;
  q: TFdQuery;
  qStr, Sku, qty, poBulk, vend, fileName: string;
  i: Integer;
begin
  q := TFdQuery.Create(nil);
  poList := TStringList.Create;
  try
    poList := DM.getAddedPo;
    if (poList.count = 0) then
    begin
      // vend := 'BULK';
      // poList := fillCombo('po', 'po', ' where vendor =' + QuotedStr(vend), false);
      raise Exception.Create('Not found any selected PO');
    end;
    for i := 0 to poList.count - 1 do
    begin
      if (i = 0) then
        poBulk := poList[i]
      else
        poBulk := poBulk + ',' + poList[i];
    end;
    // DM.RunSql('update po set receiveddate=' + QuotedStr(DateTimeToStr(Now)) + ' where po in (' + poBulk + ')');
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select sku, qty from polines where po in (' + poBulk +
        ') and qty > 0');
      Active := true;
      First;
      while not Eof do
      begin
        Sku := Fields[0].AsString;
        qty := Fields[1].AsString;
        qStr := qStr + 'update ai_items set qtyreceived=' + qty +
          ', lastorderdate=null where sku=' + QuotedStr(Sku) + ';' + #13;
        Next;
      end;
    end;
    qStr := qStr + 'update po set receiveddate=' + QuotedStr(DateTimeToStr(Now))
      + ' where po in (' + poBulk + ');' + #13;
    poList.Clear;
    poList.Add(qStr);
    fileName := 'c:\Temp\' + DateToFileName(Now, true);
    poList.SaveToFile(fileName + '.sql');
    RunExternalSql('', DM.AlonDb.Name, fileName + '.bat', fileName + '.sql');
    RunSql('update po set added = false');
    checkQtyOrdByCaseQty(true);
  finally
    q.Free;
    poList.Free;
  end;
end;

function TDM.FindPoBySKU(Sku: string): Integer;
var
  q: TFdQuery;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select po from polines where sku=' + QuotedStr(Sku) +
        ' order by po desc');
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      result := Fields[0].AsInteger;
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.UpdateMinQty();
var
  q: TFdQuery;
  date1, Sku, qty: string;
begin
  RunSql('update ai_items set qtyMin=0, qtyMin10=0, qtyord=0, qtyord10=0');
  q := TFdQuery.Create(nil);
  date1 := DateToStr(IncDay(Date, -30));
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select sku, sum(qty) from ai_orders where orderDate>' +
        QuotedStr(date1) + ' group by sku');
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      while not Eof do
      begin
        Sku := Fields[0].AsString;
        qty := Fields[1].AsString;
        RunSql('update ai_items set qtyMin=' + qty + ' where sku=' +
          QuotedStr(Sku));
        Next;
      end;
    end;
  finally
    q.Free;
  end;
  UpdateMinQty10();
  UpdateQtyOrdByCaseQty();
  RefreshQuery(qAInv);
end;

procedure TDM.UpdateMinQty10();
var
  q: TFdQuery;
  date1, Sku, qty: string;
  qtyI: Integer;
begin
  q := TFdQuery.Create(nil);
  date1 := DateToStr(IncDay(Date, -10));
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select sku, sum(qty) from ai_orders where orderDate>' +
        QuotedStr(date1) + ' group by sku');
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      while not Eof do
      begin
        Sku := Fields[0].AsString;
        qtyI := Fields[1].AsInteger;
        qty := IntToStr(qtyI);
        RunSql('update ai_items set qtyMin10=' + qty + ', qtyOrd10=' +
          IntToStr(qtyI * 3) + ' where sku=' + QuotedStr(Sku));
        Next;
      end;
    end;
    // RunExternalSql('update ai_items set qtyMin=(qtyMin10 * 3) where  qtyMin < (qtyMin10 * 3)',AlonDb.Database);
    RunSql('update ai_items set qtyMin=(qtyMin10 * 3) where  qtyMin < (qtyMin10 * 3)');
  finally
    q.Free;
  end;
end;

procedure TDM.checkQtyOrdByCaseQty(updateAnyway: Boolean = false);
var
  count: Integer;
  qStr, fileName: String;
  poList: TStringList;
begin
  poList := TStringList.Create;
  count := retIntFieldValue(AlonDb,
    'select count(*) from ai_items where caseqty > 0 and qtyord > 0 and ' +
    '(qtyord % caseqty) > 0 ');
  if (count > 0) or (updateAnyway) then
    try
      begin
        qStr := qStr +
          'update ai_items set qtyOrd=qtymin-(qtyinv + qtywh), qtyOrd10=(qtymin10 * 3)-(qtyinv + qtywh) '
          + 'where qtymin >= (qtyinv + qtywh);' + #13;
        qStr := qStr +
          'update ai_items set qtyOrd=0 where qtymin <= (qtyinv + qtywh);' +
          #13;
        qStr := qStr +
          'update ai_items set qtyOrd10=0 where qtymin10 <= (qtyinv + qtywh);' +
          #13;
        qStr := qStr +
          'update ai_items set qtyOrd = (((qtyOrd / caseQty) * caseQty) + caseQty) where caseqty > 0 '
          + 'and qtyord > 0 and (qtyord % caseqty) > 0;' + #13;
        qStr := qStr +
          'update ai_items set qtyOrd10 = (((qtyOrd10 / caseQty) * caseQty) + caseQty) '
          + 'where caseqty > 0 and qtyord10 > 0 and (qtyord10 % caseqty) > 0;' +
          #13;
        poList.Clear;
        poList.Add(qStr);
        fileName := 'c:\Temp\UpdateCaseQty.sql';
        poList.SaveToFile(fileName);
        RunExternalSql('', DM.AlonDb.Name, 'c:\Temp\UpdateCaseQty.bat',
          fileName);
      end;
    finally
      poList.Free;
    end;
end;

procedure TDM.UpdateQtyOrdByCaseQty(Sku: string = '');
begin
  checkQtyOrdByCaseQty(true);
  if (Sku = '') then
    RefreshQuery(qAInv);
end;

function TDM.CalcQtyByCase(qty, caseQty: Integer): Integer;
begin
  result := qty;
  if ((caseQty > 1) and (qty mod caseQty > 0)) then
  begin
    result := ((qty div caseQty) * caseQty) + caseQty;
  end;
end;

function TDM.getLastUpdateInvQty(vendor: string): TDateTime;
var
  q: TFdQuery;
  res: TDateTime;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select max(vendorQtyUpdate) from ai_items where vendor=' +
        QuotedStr(vendor) + ' and vendorQty>0');
      Active := true;
      res := Fields[0].AsDateTime;
      result := res;
    end;
  finally
    q.Free;
  end;
end;

function TDM.DeleteDuplicatePOLines(PO: string): Boolean;
  function isLineExists(tmpLst: TStringList; Sku, aOrder, wh: String): Boolean;
  var
    i: Integer;
    tmpSku, tmpOrder, tmpWh: String;
  begin
    result := false;
    if (tmpLst.count > 0) then
      for i := 0 to tmpLst.count - 1 do
      begin
        tmpSku := Trim(ExtractDelimited(1, tmpLst[i], [#9]));
        tmpOrder := Trim(ExtractDelimited(2, tmpLst[i], [#9]));
        tmpWh := Trim(ExtractDelimited(3, tmpLst[i], [#9]));
        if ((Sku = tmpSku) and (aOrder = tmpOrder) and (wh = tmpWh)) then
          result := true;
      end;
  end;

var
  q: TFdQuery;
  wh, aOrder, Sku, ll, tab, SQLStr: string;
  tmpLst: TStringList;
begin
  result := false;
  tab := #09;
  q := TFdQuery.Create(nil);
  tmpLst := TStringList.Create;
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select line,sku, amazonpo,whname from polines where Po =' + PO);
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      while not Eof do
      begin
        ll := Fields[0].AsString;
        Sku := Fields[1].AsString;
        aOrder := Fields[2].AsString;
        wh := Fields[3].AsString;
        if (isLineExists(tmpLst, Sku, aOrder, wh)) then
        begin
          SQLStr := 'delete from polines where Po =' + PO + ' and sku=' +
            QuotedStr(Sku) + ' and line=' + ll;
          RunSql(SQLStr);
          result := true;
        end
        else
          tmpLst.Add(Sku + tab + aOrder + tab + wh);
        Next;
      end;
      // ShowMessage(SQL.Text);
    end;
  finally
    q.Free;
    tmpLst.Free;
  end;

end;

procedure TDM.InsertOrUpdatePOLines(PO, Sku, warehouse, amazonOrder, qty,
  labelprep: string);
var
  q: TFdQuery;
  wh, aOrder, aqty, Price, ll: string;
  needInsert: Boolean;
  maxPo: Integer;
begin
  // ShowMessage(PO+'-'+sku+'-'+warehouse+'-'+amazonorder);
  needInsert := true;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select po,line,sku,qty,price,qtyreceived,checked,amazonpo,whname from polines where Po ='
        + PO + ' and sku=' + QuotedStr(Sku) + ' and (whname=' + QuotedStr('') +
        ' or whname=' + QuotedStr(warehouse) + ')');
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      while not Eof do
      begin
        aqty := Fields[3].AsString;
        Price := Fields[4].AsString;
        aOrder := Fields[7].AsString;
        wh := Fields[8].AsString;
        ll := Fields[1].AsString;
        needInsert := false;
        RunSql('update polines set qty=' + qty + ',whname=' +
          QuotedStr(warehouse) + ',amazonpo=' + QuotedStr(amazonOrder) +
          ', labelprep=' + QuotedStr(labelprep) + ' where Po =' + PO +
          ' and sku=' + QuotedStr(Sku) + ' and line=' + ll);
        Next;
      end;
      // ShowMessage(SQL.Text);
    end;
    if (needInsert) then
    begin
      if (Price = '') then
        Price := FloatToStrF(getMyCost(Sku), ffNumber, 6, 2);
      maxPo := getMaxPoLine(StrToInt(PO)) + 1;
      RunSql('insert into polines (po,line,sku,price,amazonpo,whname,qty,labelprep) values ('
        + PO + ',' + IntToStr(maxPo) + ',' + QuotedStr(Sku) + ',' + Price + ','
        + QuotedStr(amazonOrder) + ',' + QuotedStr(warehouse) + ',' + qty + ','
        + QuotedStr(labelprep) + ')');
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.CheckPoLinesDuplicates();
var
  q: TFdQuery;
  res : String;
begin
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('SELECT po,amazonpo,sku, count(*) FROM POLINES where amazonpo > '' and '+
          'whname > '' and po>5000 group by po,amazonpo,sku having count(*) > 1 order by po desc');
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      while not Eof do
      begin
        res := res + Fields[0].AsString+' ' + Fields[1].AsString +' '+ Fields[2].AsString +' '+ Fields[3].AsString+'<br>';
        Next;
      end;
    end;
    if (res <> '') then
    begin
        sendLogMail('Found duplicates in PO lines',res);
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.InsertWarehouse(warehouse, aname, line2, line3: string);
var
  q: TFdQuery;
begin
  // ShowMessage(PO+'-'+sku+'-'+warehouse+'-'+amazonorder);
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select * from warehouses where whname =' + QuotedStr(warehouse));
      // ShowMessage(SQL.Text);
      Active := true;
      First;
      if (Fields[0].AsString = warehouse) then
        exit;
      RunSql('insert into warehouses (whname, line1,line2,line3) values (' +
        QuotedStr(warehouse) + ',' + QuotedStr(aname) + ',' + QuotedStr(line2) +
        ',' + QuotedStr(line3) + ')');
    end;
  finally
    q.Free;
  end;
end;

procedure TDM.frxDsCompareProfitReportGetValue(const VarName: string;
  var Value: Variant);
var
  lsFieldName: string;
begin
  lsFieldName := UpperCase(VarName);
  with DM do
  begin

    if (lsFieldName = 'VENDOR') then
      Value := cpVendors[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD1') then
      Value := cpMonth1[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD2') then
      Value := cpMonth2[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD3') then
      Value := cpMonth3[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD4') then
      Value := cpMonth4[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD5') then
      Value := cpMonth5[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD6') then
      Value := cpMonth6[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD7') then
      Value := cpMonth7[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD8') then
      Value := cpMonth8[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD9') then
      Value := cpMonth9[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD10') then
      Value := cpMonth10[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD11') then
      Value := cpMonth11[frxDsCompareProfitReport.RecNo]
    else if (lsFieldName = 'FIELD12') then
      Value := cpMonth12[frxDsCompareProfitReport.RecNo]
    else
      Value := '';
  end;
end;

procedure TDM.frxDsTwoCompareProfitGetValue(const VarName: string;
  var Value: Variant);
var
  lsFieldName: string;
begin
  lsFieldName := UpperCase(VarName);
  with DM do
  begin
    if (lsFieldName = 'VENDOR') then
      Value := cpVendors[frxDsTwoCompareProfit.RecNo]
    else if (lsFieldName = 'FIELD1') then
      Value := cpMonth1[frxDsTwoCompareProfit.RecNo]
    else if (lsFieldName = 'FIELD2') then
      Value := cpMonth2[frxDsTwoCompareProfit.RecNo]
    else
      Value := '';
  end;
end;

function TDM.BuildSearchFilter(SearchStr, tableName, strField, skuFld: string;
  ordernoFld: String = 'orderno'): string;
var
  q: TFdQuery;
  order, StrRes, SQLStr: string;
  firstRes: Boolean;
begin
  firstRes := true;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := AlonDb;
      Active := false;
      SQL.Clear;
      SearchStr := UpperCase(('%' + SearchStr + '%'));
      SQLStr := 'select distinct ' + ordernoFld + ' from ' + tableName +
        ' where cast(' + ordernoFld + ' as char(8)) like :PAR';
      // + SearchStr;
      if (skuFld > '') then
        SQLStr := SQLStr + ' or Upper(' + skuFld + ') like :PAR';
      // (SearchStr);
      if (strField > '') then
        SQLStr := SQLStr + ' or Upper(' + strField + ') like  :PAR';
      // (SearchStr);

      SQLStr := SQLStr + ' order by ' + ordernoFld;
      SQL.Add(SQLStr);
      ParamByName('PAR').AsString := SearchStr;
      Prepare;
      Active := true;
      First;
      // ShowMessage(SQL.Text);
      StrRes := ordernoFld + '=';
      while not Eof do
      begin
        if (firstRes) then
          firstRes := false
        else
          StrRes := StrRes + ' or ' + ordernoFld + '=';
        order := FieldByName(ordernoFld).AsString;
        StrRes := StrRes + QuotedStr(order);
        Next;
      end;
    end;
    // ShowMessage(StrRes);
    if (StrRes = (ordernoFld + '=')) then
    begin
      StrRes := '';
      raise Exception.Create('Nothing found');
    end;
    result := StrRes;
  finally
    q.Free;
  end;
end;

end.
