unit InventoryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  System.UiTypes,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, ComCtrls, MyFunctions,
  DB, DateUtils, Menus, NativeXml, DBCtrls, XMLIntf, XMLDoc, xmldom,
  IdBaseComponent, IdMessageClient, IdSMTPBase, IdSMTP,
  IdMessage, frxClass, IdSSLOpenSSL, IOUtils, Types, System.ImageList,
  Vcl.ImgList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  SqlTimSt, Vcl.Mask,
  JvComponentBase, JvFormPlacement, JvExDBGrids, JvDBGrid, JvAppStorage,
  JvAppIniStorage, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase;

type
  TVendorArray = array of string;

  TfmInventory = class(TForm)
    OD: TOpenDialog;
    PageControl1: TPageControl;
    tshInventory: TTabSheet;
    Panel2: TPanel;
    dbgMain: TjvDBGrid;
    tshReports: TTabSheet;
    tshLoadData: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnLoadInventory: TBitBtn;
    Panel3: TPanel;
    btnCreatePO: TSpeedButton;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Setiteminactive1: TMenuItem;
    Setitemactive1: TMenuItem;
    N1: TMenuItem;
    AddItemtoPO1: TMenuItem;
    MainMenu1: TMainMenu;
    Editvendor1: TMenuItem;
    N3: TMenuItem;
    Purchaseorders1: TMenuItem;
    View1: TMenuItem;
    Receiveitem1: TMenuItem;
    btnLoadOrders: TBitBtn;
    btnLoadBNFInventory: TBitBtn;
    btnUnloadBNF: TBitBtn;
    Rg1: TRadioGroup;
    Ver1291: TMenuItem;
    Panel5: TPanel;
    Label1: TLabel;
    edItemSearch: TEdit;
    Label12: TLabel;
    Label7: TLabel;
    Panel4: TPanel;
    Label18: TLabel;
    lblTotalRec: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    lbInventory: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbAmazonPrice: TLabel;
    Label13: TLabel;
    lbMyCost: TLabel;
    btnRefresh: TSpeedButton;
    btnPrintLines: TSpeedButton;
    btnSelectFound: TBitBtn;
    Panel6: TPanel;
    btnShowPO: TBitBtn;
    btnVendors: TBitBtn;
    cbVendors: TComboBox;
    N4: TMenuItem;
    DeleteItem1: TMenuItem;
    btnLoadProfitReport: TBitBtn;
    Warehouses1: TMenuItem;
    Panel8: TPanel;
    btnBnfInv: TBitBtn;
    Label22: TLabel;
    btnTmcInv: TBitBtn;
    btnShultzInv: TBitBtn;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    lbLastUpdateBnf: TLabel;
    lbLastUpdateTmc: TLabel;
    lbLastUpdateShultz: TLabel;
    Panel9: TPanel;
    btnDoAction: TBitBtn;
    cbSetVendor: TComboBox;
    Label26: TLabel;
    Panel10: TPanel;
    Label2: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    cbOrderBy: TComboBox;
    edDateFrom: TDateTimePicker;
    edSku: TEdit;
    edDateTo: TDateTimePicker;
    cbDesc: TCheckBox;
    btnProfitReport: TBitBtn;
    Panel11: TPanel;
    Label27: TLabel;
    edDateFrom1: TDateTimePicker;
    edDateTo1: TDateTimePicker;
    cbPoReportVendors: TComboBox;
    Label28: TLabel;
    Label29: TLabel;
    cbOrderBy1: TComboBox;
    btnPoReport: TBitBtn;
    edSku1: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    edVendors: TEdit;
    TimerForUpdates: TTimer;
    N5: TMenuItem;
    Refresh1: TMenuItem;
    Panel12: TPanel;
    Label33: TLabel;
    Label35: TLabel;
    edDateFrom2: TDateTimePicker;
    edDateTo2: TDateTimePicker;
    btnCompareProfitReport: TBitBtn;
    edCpVendors: TEdit;
    btnSelectVisible: TBitBtn;
    adminPanel: TPanel;
    btnReportList: TButton;
    btnReportRequest: TButton;
    btnReportGet: TButton;
    Label32: TLabel;
    Label34: TLabel;
    btnMeleInv: TBitBtn;
    lbLastUpdateMele: TLabel;
    Label36: TLabel;
    btnBWKDInv: TBitBtn;
    lbLastUpdateBWKD: TLabel;
    N6: TMenuItem;
    UpdatemyCostinprofitreport1: TMenuItem;
    tchFeedback: TTabSheet;
    Panel14: TPanel;
    Panel15: TPanel;
    TimerForFeedback: TTimer;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edCopyTo: TEdit;
    edFromMail: TDBEdit;
    edFromName: TDBEdit;
    edPort: TDBEdit;
    edUser: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    edPassword: TDBEdit;
    btnSendRequest: TBitBtn;
    edMailsPerHour: TEdit;
    Label44: TLabel;
    lbFGreen: TLabel;
    lbFRed: TLabel;
    Label47: TLabel;
    Panel16: TPanel;
    lbLastSendDate: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    lbOrderNo: TLabel;
    lbSentTo: TLabel;
    Panel17: TPanel;
    Label46: TLabel;
    Label50: TLabel;
    edDateFrom3: TDateTimePicker;
    edDateTo3: TDateTimePicker;
    btnTwoCompareProfit: TBitBtn;
    edCp2Vendors: TEdit;
    Panel7: TPanel;
    Label9: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    btnCreateCMFile: TBitBtn;
    edMaxPrice: TEdit;
    edMinPrice: TEdit;
    edAddShipCost: TEdit;
    btnRangeSku: TBitBtn;
    pnRange: TPanel;
    memRange: TMemo;
    messagePanel: TPanel;
    lbMsg1: TLabel;
    lbMsg2: TLabel;
    lbMsg3: TLabel;
    Panel18: TPanel;
    btn5000Cost: TBitBtn;
    LoadFiles: TTimer;
    ExitTimer: TTimer;
    cbUseRange: TCheckBox;
    FormStorage1: TJvFormStorage;
    Panel19: TPanel;
    edPathToPostgres: TEdit;
    Label20: TLabel;
    btnUpItemsProfit: TButton;
    ImageList1: TImageList;
    Emptyorderdate1: TMenuItem;
    btnDayRep: TBitBtn;
    btnWeekRep: TBitBtn;
    btnMonthRep: TBitBtn;
    edPrevDateFrom: TDateTimePicker;
    Label21: TLabel;
    edPrevDateTo: TDateTimePicker;
    edCurDatefrom: TDateTimePicker;
    Label51: TLabel;
    edCurDateTo: TDateTimePicker;
    btnPeriodCompareReport: TBitBtn;
    edSku3: TEdit;
    Label52: TLabel;
    btnBackupDb: TButton;
    btnDbRestore: TButton;
    btnVacuum: TButton;
    btnUpdVndCosts: TButton;
    GetReporSettlement: TTimer;
    Panel13: TPanel;
    Label53: TLabel;
    cbShow: TComboBox;
    cbAction: TComboBox;
    lbSelectedLinesLbl: TLabel;
    lbSelectedLines: TLabel;
    cbBnfUpdate: TCheckBox;
    cbTmcUpdate: TCheckBox;
    edSmtp: TDBEdit;
    adminPanel2: TPanel;
    Label54: TLabel;
    edMyName: TDBEdit;
    Label55: TLabel;
    edMyShortName: TDBEdit;
    Label56: TLabel;
    edMyCompany: TDBEdit;
    Label57: TLabel;
    edCompanyShortName: TDBEdit;
    Label58: TLabel;
    edAddress: TDBEdit;
    Label59: TLabel;
    edPoBox: TDBEdit;
    Label60: TLabel;
    edCity: TDBEdit;
    Label61: TLabel;
    edState: TDBEdit;
    Label62: TLabel;
    edZip: TDBEdit;
    Label63: TLabel;
    edCountry: TDBEdit;
    Label64: TLabel;
    edPhone: TDBEdit;
    Label65: TLabel;
    edPhone2: TDBEdit;
    Label66: TLabel;
    edFax: TDBEdit;
    Label67: TLabel;
    btnSaveInfo: TButton;
    btnReconLoad: TBitBtn;
    Panel20: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    edSIRepDateFrom: TDateTimePicker;
    edSIRepDateTo: TDateTimePicker;
    btnSoldItemsReport: TBitBtn;
    cbSIRepVendors: TComboBox;
    edYear: TEdit;
    Label70: TLabel;
    edMonth: TEdit;
    btnUpdateItemsSoldMonthly: TButton;
    Shippingproblems1: TMenuItem;
    Searchaddress1: TMenuItem;
    btnUpdOrdQty: TButton;
    IniFileStorage1: TJvAppIniFileStorage;
    Panel21: TPanel;
    btnCloseMemo: TBitBtn;
    btnProcessAll: TButton;
    btnTestEmail: TButton;
    SMTP: TIdSMTP;
    edReplyTo: TDBEdit;
    Label71: TLabel;
    procedure dbgMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCreatePOClick(Sender: TObject);
    procedure btnDayRepClick(Sender: TObject);
    procedure btnLoadInventoryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnWeekRepClick(Sender: TObject);
    procedure btnMonthRepClick(Sender: TObject);
    procedure btnPrintLinesClick(Sender: TObject);
    procedure dbgMainDblClick(Sender: TObject);
    procedure Setiteminactive1Click(Sender: TObject);
    procedure Setitemactive1Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure AddItemtoPO1Click(Sender: TObject);
    procedure Editvendor1Click(Sender: TObject);
    procedure Setfiltervendor1Click(Sender: TObject);
    procedure Purchaseorders1Click(Sender: TObject);
    procedure Receiveitem1Click(Sender: TObject);
    procedure btnLoadOrdersClick(Sender: TObject);
    procedure btnLoadBNFInventoryClick(Sender: TObject);
    procedure btnUnloadBNFClick(Sender: TObject);
    procedure dbgMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure edItemSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgMainGetBtnParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; var SortMarker: TSortMarker; IsDown: Boolean);
    // procedure edVendorSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSelectFoundClick(Sender: TObject);
    procedure cbVendorsSelect(Sender: TObject);
    procedure btnCreateCMFileClick(Sender: TObject);
    procedure DeleteItem1Click(Sender: TObject);
    procedure btnLoadProfitReportClick(Sender: TObject);
    procedure btnProfitReportClick(Sender: TObject);
    procedure Warehouses1Click(Sender: TObject);
    procedure btnShultzInvClick(Sender: TObject);
    procedure btnBnfInvClick(Sender: TObject);
    procedure btnTmcInvClick(Sender: TObject);
    procedure btnDoActionClick(Sender: TObject);
    procedure btnPoReportClick(Sender: TObject);
    procedure TimerForUpdatesTimer(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure btnCompareProfitReportClick(Sender: TObject);
    procedure btnSelectVisibleClick(Sender: TObject);
    procedure btnReportListClick(Sender: TObject);
    procedure btnReportRequestClick(Sender: TObject);
    procedure btnReportGetClick(Sender: TObject);
    procedure btnMeleInvClick(Sender: TObject);
    procedure btnBWKDInvClick(Sender: TObject);
    procedure SendRequestByTimer(Sender: TObject);
    procedure SMTPFailedRecipient(Sender: TObject;
      const AAddress, ACode, AText: string; var VContinue: Boolean);
    procedure btnSendRequestClick(Sender: TObject);
    procedure btnTwoCompareProfitClick(Sender: TObject);
    procedure edDateFrom3Exit(Sender: TObject);
    procedure memRangeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRangeSkuClick(Sender: TObject);
    procedure btn5000CostClick(Sender: TObject);
    procedure LoadFilesTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitTimerTimer(Sender: TObject);
    procedure btnUpItemsProfitClick(Sender: TObject);
    procedure dbgMainCellClick(Column: TColumn);
    procedure Emptyorderdate1Click(Sender: TObject);
    procedure btnPeriodCompareReportClick(Sender: TObject);
    procedure btnBackupDbClick(Sender: TObject);
    procedure btnDbRestoreClick(Sender: TObject);
    procedure btnVacuumClick(Sender: TObject);
    procedure btnUpdVndCostsClick(Sender: TObject);
    procedure GetReporSettlementTimer(Sender: TObject);
    procedure cbActionSelect(Sender: TObject);
    procedure est1Click(Sender: TObject);
    procedure btnSaveInfoClick(Sender: TObject);
    procedure cbOrderBySelect(Sender: TObject);
    procedure btnReconLoadClick(Sender: TObject);
    procedure LoadRecon(FileName: string);
    procedure btnSoldItemsReportClick(Sender: TObject);
    procedure btnUpdateItemsSoldMonthlyClick(Sender: TObject);
    procedure Shippingproblems1Click(Sender: TObject);
    procedure Searchaddress1Click(Sender: TObject);
    procedure btnUpdOrdQtyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseMemoClick(Sender: TObject);
    procedure btnProcessAllClick(Sender: TObject);
    procedure btnTestEmailClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    // ascDesc: string;
  public
    timeToClose: Integer;
    EmergencyStop: Boolean;
    CurrentOrder: Integer;
    CurrentAsc: Boolean;
    FoundNewVersion: Boolean;
    SelectFoundItems: string;
    SelectVisibleItems: string;
    countSelected: Integer;
    onlyActive: Boolean;
    procedure SetOrder(OrderBy: Integer; Asc: Boolean);
    procedure LoadInventory(FileName: string);
    procedure InsertOrders(FileName: string);
    procedure LoadBNFInventory(FileName: string);
    procedure LoadProfitReport(FileName: string);
    function CheckFileDir(Action: Integer; fileNamePart: string): Boolean;
    procedure UpdateShultzInventory(FileName: string);
    function SendRequestToBNF(test: Boolean): Boolean;
    function ProcessXMLBNFReplay(XmlStream: TStringStream; zero: Boolean;
      prefix, parentNode, itemName, inventoryName: string): Boolean;
    function ProcessXMLTMCReplay(XmlStream: TStringStream; zero: Boolean;
      prefix, parentNode, itemName, inventoryName: string): Boolean;
    function SendRequestToTMC(test: Boolean): Boolean;
    procedure runJavaModule(Action: string; reportName: string = '');
    procedure UpdateMeleInventory(FileName: string);
    procedure UpdateBWKDInventory(FileName: string);
    procedure InsertFeedbackOrders(FileName: string);
    procedure SendRequests();
    function sendmail(order, title, email, ship, sname: string): Boolean;
    procedure prepareToExit(act: String);
    procedure setCountSelectedLines();

  end;

var
  fmInventory: TfmInventory;

const
  ORDER_DEFAULT = 0;
  ORDER_BY_SKU = 1;
  ORDER_BY_VENDOR = 2;
  ORDER_BY_INV = 3;
  ORDER_BY_QTY_MIN = 4;
  ORDER_BY_QTY_TO_ORD = 5; // , ORDER_BY_ = ,ORDER_BY_ = ,,ORDER_BY_ = ,;
  ORDER_BY_ADD_TO_PO = 6;
  ORDER_BY_QTY_WH = 7;
  ORDER_BY_ORDER_DATE = 8;

  LOAD_PROFIT = 1;
  LOAD_INV = 2;
  LOAD_ORDERS = 3;
  LOAD_RECON = 4;

implementation

uses DBUnit, EditItemUnit, EditVendorUnit, VendorsUnit, EditPoUnit,
  PurchaseOrdersUnit, SkuPurchaseOrdersUnit,
  EditReceivePoUnit, WarehousesUnit, CountdownUnit, ProblemQtyUnit,
  AdressSearchUnit;
{$R *.dfm}

procedure TfmInventory.dbgMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  isActive, addedToPo, isvendoractive: Boolean;
  bitmap: TBitmap;
  fixRect: TRect;
  bmpWidth: Integer;
  imgIndex: Integer;
begin
  fixRect := Rect;
  imgIndex := 0;
  if Column.FieldName = 'addtopo' then
  begin
    if (Uppercase(Column.Field.AsString) = 'FALSE') then
      imgIndex := 0
    else if (Uppercase(Column.Field.AsString) = 'TRUE') then
    begin
      imgIndex := 1;
      // dbgMain.Canvas.Brush.Color := clAqua;
    end;
    bitmap := TBitmap.Create;
    try
      ImageList1.GetBitmap(imgIndex, bitmap);
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      TjvDBGrid(Sender).Canvas.StretchDraw(fixRect, bitmap);
    finally
      bitmap.Free;
    end;
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;
  with dbgMain.Canvas do
  begin
    addedToPo := Column.Field.DataSet.FieldByName('addtopo').AsBoolean;
    if (not(gdSelected in State)) then
    begin
      if (Uppercase(Column.FieldName) <> 'SKU') and
        (Uppercase(Column.FieldName) <> 'ADDTOPO') then
        if (addedToPo) then
        begin
          Brush.Color := clAqua;
        end;
    end;
  end;
  with dbgMain.Canvas do
  begin
    // brush.Color := clRed;
    isActive := Column.Field.DataSet.FieldByName('isActive').AsBoolean;
    isvendoractive := Column.Field.DataSet.FieldByName('isvendoractive')
      .AsBoolean;
    // if (not (gdFocused in State)) then
    if (isActive and isvendoractive) then
    begin
      if (Uppercase(Column.FieldName) = 'QTYORD') then
      begin
        Font.Color := clRed;
        Font.Style := [fsBold];
      end
      else
      begin
        // Font.Color := clBlack;
        Font.Style := [fsBold];
      end;
    end
    else if (not isvendoractive) then
    begin
      Font.Color := clGrayText;
      Font.Style := [fsItalic, fsBold];
    end
    else
    begin
      Font.Color := clGrayText;
      Font.Style := [fsStrikeOut, fsBold];
    end;
  end;

  dbgMain.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
end;

procedure TfmInventory.btnCreatePOClick(Sender: TObject);
var
  poNum, poCount, poCount1: Integer;
  vendor: string;
begin
  addActivity(DM.AlonDb, 'btnCreatePOClick');
  poCount := 0;
  if (DM.GetCountAddedToPO > 0) then
    with DM do
    begin
      vendor := getVendorFromSelectedItems;
      if (vendor > '') then
      begin
        poNum := getMaxPo(vendor, true);
        tbPO.Active := true;
        if (not PoExists(poNum)) then
        begin
          tbPO.Insert;
          tbPOPO.Value := poNum;
          tbPOVendor.Value := vendor;
          tbPOOrderDate.Value := DateTimeToSQLTimeStamp(Now);
        end
        else
        begin
          tbPO.Filter := 'po=' + IntToStr(poNum);
          tbPO.Filtered := true;
          tbPO.Edit;
        end;
        poCount := CreatePurchaseOrderLines(poNum, vendor, true);
        if (poCount > 0) then
        begin
          tbPOTotalPrice.Value := getTotalPo(poNum);
          tbPO.FieldByName('withcases').Value := true;
          tbPO.Post;
          poCount := 1;
          // Inc(poNum);
        end
        else
        begin
          tbPO.Cancel;
        end;
        // Second stage - create PO without cases
        poNum := getMaxPo(vendor, false);
        tbPO.Active := true;
        if (not PoExists(poNum)) then
        begin
          tbPO.Insert;
          tbPOPO.Value := poNum;
          tbPOVendor.Value := vendor;
          tbPOOrderDate.Value := DateTimeToSQLTimeStamp(Now);
        end
        else
        begin
          tbPO.Filter := 'po=' + IntToStr(poNum);
          tbPO.Filtered := true;
          tbPO.Edit;
        end;
        poCount1 := CreatePurchaseOrderLines(poNum, vendor, false);
        if (poCount1 > 0) then
        begin
          tbPOTotalPrice.Value := getTotalPo(poNum);
          tbPO.FieldByName('withcases').Value := false;
          tbPO.Post;
          poCount1 := 1;
        end
        else
        begin
          tbPO.Cancel;
        end;

        if (poCount = 1) then
        begin
          tbPOLines.Active := true;
          fmPo.ShowModal;
        end;
        if (poCount > 1) then
        begin
          DM.tbPO.Active := true;
          fmPurchaseOrders.ShowModal;
        end;
        tbPO.Filtered := false;
        RunSql('update ai_items set addtopo=false');
        RefreshQuery(DM.qAinv);
        poCount := poCount + poCount1;
      end;
    end
  else
  begin
    vendor := cbVendors.Items.Strings[cbVendors.ItemIndex];
    poCount := DM.CreatePurchaseOrders(vendor);
    if (poCount > 0) then
    begin
      DM.tbPO.Active := true;
      fmPurchaseOrders.ShowModal;
    end;
  end;
  if (poCount = 0) then
  begin
    ShowMessage('Purchase order did not created');
  end
  else
  begin
    ShowMessage('Created ' + IntToStr(poCount) + ' purchase orders');
  end;
  setCountSelectedLines();
end;

procedure TfmInventory.setCountSelectedLines();
var
  cnt: Integer;
begin
  cnt := DM.GetCountAddedToPO;
  if (cnt > 0) then
  begin
    btnSelectVisible.Caption := 'Clear selected';
    btnSelectFound.Caption := 'Clear selected';
    lbSelectedLinesLbl.Visible := true;
    lbSelectedLines.Visible := true;
    lbSelectedLines.Caption := IntToStr(cnt);
  end
  else
  begin
    btnSelectVisible.Caption := 'Select visible';
    btnSelectFound.Caption := 'Select for PO';
    lbSelectedLinesLbl.Visible := false;
    lbSelectedLines.Visible := false;
  end;
end;

procedure TfmInventory.btnLoadInventoryClick(Sender: TObject);
begin
  // addActivity(DM.AlonDb, 'btnLoadInventoryClick');
  if not CheckFileDir(LOAD_INV, '*AFN_INVENTORY*.*') then
    with OD do
      if (Execute) then
      begin
        Label3.Caption := 'update ai_items set qtyinv=0';
        DM.RunSql('update ai_items set qtyinv=0');
        Sleep(2000);
        Label5.Caption := 'update ai_items set qtyinv=0. Done';
        LoadInventory(FileName);
      end;
  DM.RunSql('update ai_items set qtymin=qtyinv where qtymin=0 and qtyinv > 0');
  DM.UpdateQtyOrdByCaseQty();
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.LoadInventory(FileName: string);
var
  TmpLst: TStringList;
  Sku, FfSku, fnSku, Asin, qtyS, TmpStr, oldPref: string;
  Delim: Char;
  i, { qty, } insQty, updQty: Integer;
begin
  addActivity(DM.AlonDb, 'Load inventory file ' + FileName);
  Delim := #9;
  try
    try
      TmpLst := TStringList.Create;
      TmpLst.LoadFromFile(FileName);
      TmpStr := TmpLst[0];
      if (Pos(',', TmpStr) > 0) then
      begin
        Label3.Caption := 'Corrupted file ' + FileName;
        addActivity(DM.AlonDb, 'Corrupted file ' + FileName);
        Exit;
      end;

      insQty := 0;
      updQty := 0;
      Screen.Cursor := crSQLWait;
      for i := 1 to TmpLst.Count - 1 do
      begin
        Application.ProcessMessages;
        TmpStr := TmpLst[i];
        if (ExtractDelimited(5, TmpStr, [Delim]) <> 'UNSELLABLE') then
        begin
          Sku := Trim(ExtractDelimited(1, TmpStr, [Delim]));
          Sku := ReplaceStr(Sku, '&amp;', '-');
          Sku := ReplaceStr(Sku, '&quot;', '"');
          Sku := ReplaceStr(Sku, '&', '-');
          oldPref := ExtractDelimited(1, Sku, ['-']);
          if (oldPref <> Sku) then
          begin
            FfSku := ReplaceStr(Sku, oldPref + '-', '');
          end;
          // FfSku := ExtractDelimited(2, TmpStr, [Delim]);
          fnSku := ExtractDelimited(2, TmpStr, [Delim]);
          Asin := ExtractDelimited(3, TmpStr, [Delim]);
          qtyS := ExtractDelimited(6, TmpStr, [Delim]);
          // Label4.Caption := 'Sku=' + Sku+' Asin='+Asin+' Qty='+QtyS;

          if (qtyS = '') then
            qtyS := '0';
          // qty := StrToInt(QtyS);
          if (DM.ItemExists(Sku)) then
          begin
            if (qtyS <> '0') then
            begin
              Label3.Caption := 'Update qty=' + qtyS + ' sku=' + Sku;
              DM.RunSql('update ai_items set qtyinv=' + qtyS + ', fnsku=' +
                QuotedStr(fnSku) + ' where sku=' + QuotedStr(Sku));
              inc(updQty);
            end;
          end
          else
          begin
            Label4.Caption := 'Insert into Inventory Sku=' + Sku;
            DM.InsertInventoryOld(Sku, FfSku, Asin, fnSku, qtyS);
            inc(insQty);
          end;
        end;
      end;
    except
      on e: SysUtils.Exception do
      begin
        sendLogMail('Error log from LoadItems', e.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
  Label3.Caption := FormatDateTime('dd/mm/yyyy tt', Now) + ' Updated ' +
    IntToStr(updQty) + ' parts';
  Label4.Caption := FormatDateTime('dd/mm/yyyy tt', Now) + ' Inserted ' +
    IntToStr(insQty) + ' parts';
end;

procedure TfmInventory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormStorage1.SaveFormPlacement;
end;

procedure TfmInventory.FormCreate(Sender: TObject);
begin
  IniFileStorage1.FileName := ExtractFilePath(ParamStr(0)) + GetCurrentUserName
    + '\AINV.ini';
  FormStorage1.AppStorage := IniFileStorage1;
  FormStorage1.RestoreFormPlacement;
end;

procedure TfmInventory.FormShow(Sender: TObject);
var
  date: TDate;
  user: String;
begin
  PageControl1.ActivePage := tshInventory;
  Label3.Caption := '';
  Label4.Caption := '';
  Label5.Caption := '';
  Label6.Caption := '';
  cbShow.ItemIndex := 0;
  cbVendors.Items := DM.fillCombo('vendors', 'vendorname',
    ' where isactive=true', true, true);
  cbVendors.ItemIndex := 0;
  cbSetVendor.Items := DM.fillCombo('vendors', 'vendorname',
    ' where isactive=true', true);
  cbSetVendor.ItemIndex := 0;
  cbPoReportVendors.Items := DM.fillCombo('vendors', 'vendorname',
    ' where isactive=true', true);
  cbPoReportVendors.ItemIndex := 0;
  cbSIRepVendors.Items := DM.fillCombo('vendors', 'vendorname',
    ' where isactive=true', true);
  cbSIRepVendors.ItemIndex := 0;
  btnRefreshClick(Sender);
  edDateTo.date := IncDay(Now, 1);
  edDateFrom.date := IncMonth(Now, -3);
  edDateTo1.date := IncDay(Now, 1);
  edDateFrom1.date := IncMonth(Now, -12);
  edDateTo2.date := IncDay(Now, 1);
  edDateFrom2.date := IncMonth(Now, -12);
  edCurDateTo.date := IncDay(Now, -1);
  edCurDatefrom.date := IncDay(Now, -8);
  edPrevDateTo.date := IncMonth(edCurDateTo.date, -12);
  edPrevDateFrom.date := IncMonth(edCurDatefrom.date, -12);
  edSIRepDateFrom.date := IncMonth(edCurDateTo.date, -6);
  edSIRepDateTo.date := IncMonth(Now, -1);
  edYear.Text := IntToStr(YearOf(IncMonth(Now, -1)));
  edMonth.Text := IntToStr(MonthOf(IncMonth(Now, -1)));
  date := IncMonth(Now, -1);
  edDateFrom3.date := EncodeDate(ExtractFromDateTime(date, 'year'),
    ExtractFromDateTime(date, 'month'), 1);
  edDateTo3.date := EncodeDate(ExtractFromDateTime(date, 'year'),
    ExtractFromDateTime(date, 'month'), DaysInAMonth(ExtractFromDateTime(date,
    'year'), ExtractFromDateTime(date, 'month')));
  lbLastUpdateBnf.Caption := DateTimeToStr(DM.getLastUpdateInvQty('BNF'));
  lbLastUpdateTmc.Caption := DateTimeToStr(DM.getLastUpdateInvQty('TM'));
  lbLastUpdateShultz.Caption := DateTimeToStr(DM.getLastUpdateInvQty('SC'));
  lbLastUpdateMele.Caption := DateTimeToStr(DM.getLastUpdateInvQty('MELE'));
  lbLastUpdateBWKD.Caption := DateTimeToStr(DM.getLastUpdateInvQty('BWKD'));
  lbLastSendDate.Caption :=
    DM.getSqlResult('select max(sentdate) from forders');
  lbOrderNo.Caption := DM.getSqlResult
    ('select orderid from forders where sentdate=(select max(sentdate) from forders) order by shipdate desc limit 1');
  lbSentTo.Caption := DM.getSqlResult
    ('select name from forders where sentdate=(select max(sentdate) from forders) order by shipdate desc limit 1');
  user := Uppercase(GetCurrentUserName);
  if ((user = 'ADMINISTRATOR') or (user = 'SHIM')) then
  begin
    adminPanel.Visible := true;
    adminPanel2.Visible := true;
    GetReporSettlement.Enabled := true;
    TimerForUpdates.Enabled := true;
    TimerForFeedback.Enabled := true;
  end
  else
  begin
    adminPanel.Visible := false;
    adminPanel2.Visible := false;
  end;
  if (not isAdmin()) then
  begin
    tshReports.TabVisible := false;
    tshLoadData.TabVisible := false;
    tchFeedback.TabVisible := false;
  end
  else
  begin
    TimerForFeedback.Enabled := false;
    TimerForFeedback.Enabled := true;
    TimerForUpdates.Enabled := true;
  end;
  PATH_TO_PG := edPathToPostgres.Text;
  if (PATH_TO_PG = '') then
  begin
    GetPostgresDir;
    edPathToPostgres.Text := PATH_TO_PG;
  end;
  dbgMain.DataSource := DM.dsAInv;
  dbgMain.SetFocus;
  PressKey(VK_RIGHT);
  // TFdTable(dbgMain.DataSource.DataSet).IndexFieldNames := 'qtyord:D'
end;

procedure TfmInventory.btnLoadOrdersClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'btnLoadOrdersClick');
  if not CheckFileDir(LOAD_ORDERS, '*AMAZON_FULFILLED_SHIPMENTS*.*') then
    with OD do
      if Execute then
      begin
        InsertOrders(FileName);
        InsertFeedbackOrders(FileName);
      end
      else
        DM.UpdateMinQty;
end;

procedure TfmInventory.InsertOrders(FileName: string);
var
  TmpLst: TStringList;
  TmpStr, OrderId, qtyS, DateS, price, Sku, Desc: string;
  Delim: TCharSet;
  date: TDate;
  { Count, } i, insQty, processed: Integer;
begin
  addActivity(DM.AlonDb, 'Load orders file ' + FileName);
  Delim := [#9];
  try
    try
      TmpLst := TStringList.Create;
      TmpLst.LoadFromFile(FileName);
      TmpStr := TmpLst[0];
      if (Pos(',', TmpStr) > 0) then
      begin
        Label3.Caption := 'Corrupted file ' + FileName;
        addActivity(DM.AlonDb, 'Corrupted file ' + FileName);
        Exit;
      end;
      insQty := 0;
      processed := 0;
      Screen.Cursor := crSQLWait;
      date := IncDay(Now, -35);
      DM.RunSql('delete from ai_orders where orderdate < ' +
        QuotedStr(DateToStr(date)));
      for i := 1 to TmpLst.Count - 1 do
      begin
        try
          Application.ProcessMessages;
          TmpStr := TmpLst[i];
          inc(processed);
          Label6.Caption := 'Count=' + IntToStr(processed);
          OrderId := ExtractDelimited(1, TmpStr, Delim) +
            ExtractDelimited(14, TmpStr, Delim);
          qtyS := ExtractDelimited(16, TmpStr, Delim);
          price := ExtractDelimited(18, TmpStr, Delim);
          Sku := ExtractDelimited(14, TmpStr, Delim);
          Desc := ExtractDelimited(15, TmpStr, Delim);
          Desc := ReplaceStr(Desc, '"', '');
          Desc := ReplaceStr(Desc, '''', '');
          DateS := ExtractDelimited(7, TmpStr, Delim);
          if (price = '') then
            price := '0.0'
          else
          begin
            // Log('SKU='+sku + ' price= ' + price);
            price := FloatToStr(StrToFloat(price) / StrToInt(qtyS));
            DM.RunSql('update ai_items set price=' + price + ' where sku=' +
              QuotedStr(Sku));
            DM.RunSql('update ai_items set title=' + QuotedStr(Desc) +
              ' where sku=' + QuotedStr(Sku));
          end;
          if (Trim(DateS) = '') then
            DateS := ExtractDelimited(9, TmpStr, Delim);
          // DateS := Copy(DateS, 6, 2) + '/' + Copy(DateS, 9, 2) + '/' + Copy(DateS, 1, 4) + ' ' + Copy(DateS, 12, 2) + ':' + Copy(DateS, 15, 2);
          if (qtyS = '') then
            qtyS := '0';
          Label5.Caption := 'Process Order=' + OrderId + ' ' + DateS + ' ' +
            ExtractDelimited(12, TmpStr, Delim) + ' ' +
            ExtractDelimited(15, TmpStr, Delim);
          if (DM.OrderExists(OrderId, 'ai_orders')) then
            continue;
          Label5.Caption := 'Insert Order=' + OrderId + ' ' + DateS + ' ' + Sku
            + ' ' + qtyS;
          // DM.InsertOrders(OrderId, DateS, sku, QtyS);
          DM.RunSql(
            'insert into ai_orders (OrderId,OrderDate,Sku,Qty,itemprice)' +
            'values(' + QuotedStr(OrderId) + ',' + QuotedStr(DateS) + ',' +
            QuotedStr(Sku) + ',' + qtyS + ',' + price + ')');
          inc(insQty);
        except
          on e: SysUtils.Exception do
            Label5.Caption := 'Error = ' + e.Message;
        end;
      end;
      Label6.Caption := FormatDateTime('dd/mm/yyyy tt', Now) + ' Inserted ' +
        IntToStr(insQty) + ' orders. All procesed=' + IntToStr(processed);
      Label5.Caption := FormatDateTime('dd/mm/yyyy tt', Now) +
        ' Updates for inventory min quantity ...';
      Application.ProcessMessages;
      DM.UpdateMinQty;
      Label5.Caption := 'Done.';
    except
      on e: SysUtils.Exception do
      begin
        sendLogMail('Error log from InsertOrders', e.Message);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmInventory.InsertFeedbackOrders(FileName: string);
var
  TmpLst: TStringList;
  TmpStr, OrderId, Name, email, ship, DateS, Sku, title, SqlStr: string;
  Delim: TCharSet;
  i, insQty, processed: Integer;
begin
  Delim := [#9];
  Log('', true, true);
  try
    TmpLst := TStringList.Create;
    TmpLst.LoadFromFile(FileName);
    insQty := 0;
    processed := 0;
    Screen.Cursor := crSQLWait;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Application.ProcessMessages;
      TmpStr := ReplaceStr(TmpLst[i], '"', '');
      TmpStr := ReplaceStr(TmpStr, '''', '');
      TmpStr := ReplaceStr(TmpStr, '`', '');
      // Count := WordCount(TmpStr, Delim);
      inc(processed);
      OrderId := ExtractDelimited(1, TmpStr, Delim);
      DateS := ExtractDelimited(7, TmpStr, Delim);
      Name := ExtractDelimited(12, TmpStr, Delim);
      email := ExtractDelimited(11, TmpStr, Delim);
      ship := ExtractDelimited(24, TmpStr, Delim);
      Sku := ExtractDelimited(14, TmpStr, Delim);
      title := ExtractDelimited(15, TmpStr, Delim);
      if (Trim(DateS) = '') then
        DateS := ExtractDelimited(9, TmpStr, Delim);
      // DateS := Copy(DateS, 6, 2) + '/' + Copy(DateS, 9, 2) + '/' + Copy(DateS, 1, 4) + ' ' + Copy(DateS, 12, 2) + ':' + Copy(DateS, 15, 2);
      Label5.Caption := 'Process Order=' + OrderId + ' ' + DateS + ' ' +
        ExtractDelimited(14, TmpStr, Delim) + ' ' + ExtractDelimited(16,
        TmpStr, Delim);
      if (not DM.OrderExists(OrderId, 'forders')) then
      begin
        SqlStr := 'insert into forders (OrderId, Name, Email, Shipping, ShipDate, Sku, Title, Sent)';
        SqlStr := SqlStr + ' values(' + QuotedStr(OrderId) + ',' +
          QuotedStr(Name) + ',' + QuotedStr(email) + ',';
        SqlStr := SqlStr + QuotedStr(ship) + ',' + QuotedStr(DateS) + ',' +
          QuotedStr(Sku) + ',' + QuotedStr(title) + ', false)';
        DM.RunSql(SqlStr);
        inc(insQty);
        Label6.Caption := 'Inserted ' + OrderId + ' ' +
          ExtractDelimited(14, TmpStr, Delim) + ' ' +
          ExtractDelimited(16, TmpStr, Delim);
      end;
    end;
    Label6.Caption := FormatDateTime('dd/mm/yyyy tt', Now) + ' Inserted ' +
      IntToStr(insQty) + ' feedback orders. All procesed=' +
      IntToStr(processed);
    Application.ProcessMessages;
    Label5.Caption := 'Done.';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmInventory.memRangeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( { (Key = VK_RETURN) or } (Key = VK_ESCAPE)) then
    pnRange.Visible := false;
end;

procedure TfmInventory.btnLoadProfitReportClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'btnLoadProfitReportClick');
  CheckFileDir(LOAD_PROFIT, '*SETTLEMENT*.XML');
end;

function TfmInventory.CheckFileDir(Action: Integer;
  fileNamePart: string): Boolean;
var
  Path, Archive: string;
  SR: TSearchRec;
  TmpLst: TStringList;
  Count: Integer;
begin
  Count := 0;
  Path := 'c:\Amazon\production\reports\';
  Archive := Path + 'Archive\';
  TmpLst := TStringList.Create;
  try
    if (not DirectoryExists(Archive)) then
      CreateDir(Archive);
    if FindFirst(Path + fileNamePart, faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Attr <> faDirectory) then
        begin
          if (Pos('.TXT', Uppercase(SR.Name)) > 0) then
          begin
            if (Action = LOAD_INV) then
            begin
              Label3.Caption := 'update ai_items set qtyinv=0';
              DM.RunSql('update ai_items set qtyinv=0');
              Sleep(2000);
              Label5.Caption := 'update ai_items set qtyinv=0. Done';
              LoadInventory(Path + SR.Name);
            end;
            if (Action = LOAD_ORDERS) then
            begin
              InsertOrders(Path + SR.Name);
              InsertFeedbackOrders(Path + SR.Name);
            end;
            if (Action = LOAD_RECON) then
            begin
              LoadRecon(Path + SR.Name);
            end;
            inc(Count);
          end
          else
          begin
            if (Action = LOAD_PROFIT) then
              LoadProfitReport(Path + SR.Name);
            inc(Count);
          end;
          TmpLst.LoadFromFile(Path + SR.Name);
          TmpLst.SaveToFile(Archive + SR.Name);
          DeleteFile(Path + SR.Name);
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
    if (Count = 0) then
    begin
      Label5.Caption := 'Not found files for processing';
      Result := false;
    end
    else
      Result := true;
  finally
    TmpLst.Free;
  end;
end;

procedure TfmInventory.LoadProfitReport(FileName: string);
var
  OrderId, Sku, oldSku, qtyS, DateS, typeName: string;
  netto, aInvCost, profit, principalD, ShippingD, FBAPerUnitFulfillmentFeeD,
    FBAWeightBasedFeeD, FBAPerOrderFulfillmentFeeD, CommissionD: Double;
  insQty, updQty, processed, qty: Integer;
  XML: TNativeXml;

  procedure insertProfitReports();
  begin
    if ((OrderId > '') and (oldSku > '') and (principalD > 0)) then
    begin
      Application.ProcessMessages;
      inc(processed);
      qtyS := IntToStr(qty);
      Label6.Caption := 'Count=' + IntToStr(processed);
      // Memo1.Lines.Add('--- --- --- --- --- --- -- --- --- ');
      // Memo1.Lines.Add(OrderId + ' | ' + oldSku + ' | ' + IntToStr(Qty) + ' | ' + FloatToStr(principalD));
      // Memo1.Lines.Add('--- --- --- --- --- --- -- --- --- ');
      aInvCost := DM.getMyCost(oldSku);
      netto := (principalD + FBAPerUnitFulfillmentFeeD + FBAWeightBasedFeeD +
        FBAPerOrderFulfillmentFeeD + CommissionD);
      profit := netto - aInvCost * qty;
      if (not DM.ProfitOrderExists(OrderId, oldSku, 'profitreport')) then
      begin
        DM.RunSql('insert into profitreport values(' + QuotedStr(OrderId) + ','
          + QuotedStr(oldSku) + ',' + QuotedStr('') + ',' + QuotedStr(DateS) +
          ',' + qtyS + ',' + FloatToStrF(principalD, ffFixed, 6, 2) + ',' +
          FloatToStrF(ShippingD, ffFixed, 6, 2) + ',' +
          FloatToStrF(FBAPerUnitFulfillmentFeeD, ffFixed, 6, 2) + ',' +
          FloatToStrF(FBAWeightBasedFeeD, ffFixed, 6, 2) + ',' +
          FloatToStrF(FBAPerOrderFulfillmentFeeD, ffFixed, 6, 2) + ',' +
          FloatToStrF(CommissionD, ffFixed, 6, 2) + ',' + FloatToStrF(netto,
          ffFixed, 6, 2) + ',' + FloatToStrF(aInvCost, ffFixed, 6, 2) + ',' +
          FloatToStrF(profit, ffFixed, 6, 2) + ')');
        Application.ProcessMessages;
        Label5.Caption := 'Inserted Order=' + OrderId + ' ' + DateS + ' ' + Sku
          + ' ' + qtyS;
        inc(insQty);
      end
      else
      begin
        DM.RunSql('update profitreport set principal=' + FloatToStrF(principalD,
          ffFixed, 6, 2) + ', qty=' + qtyS + ', shipping=' +
          FloatToStrF(ShippingD, ffFixed, 6, 2) + ', FBAPerUnitFulfillmentFee='
          + FloatToStrF(FBAPerUnitFulfillmentFeeD, ffFixed, 6, 2) +
          ', FBAWeightBasedFee=' + FloatToStrF(FBAWeightBasedFeeD, ffFixed, 6,
          2) + ', FBAPerOrderFulfillmentFee=' +
          FloatToStrF(FBAPerOrderFulfillmentFeeD, ffFixed, 6, 2) +
          ',Commission=' + FloatToStrF(CommissionD, ffFixed, 6, 2) + ', netto='
          + FloatToStrF(netto, ffFixed, 6, 2) + ', ainvcost=' +
          FloatToStrF(aInvCost, ffFixed, 6, 2) + ', profit=' +
          FloatToStrF(profit, ffFixed, 6, 2) + ' where orderid=' +
          QuotedStr(OrderId) + ' and sku=' + QuotedStr(oldSku));
        Application.ProcessMessages;
        Label6.Caption := 'Updated Order=' + OrderId + ' ' + DateS + ' ' + Sku +
          ' ' + qtyS;
        inc(updQty);
      end;
    end;
    Application.ProcessMessages;
    principalD := 0;
    ShippingD := 0;
    FBAPerUnitFulfillmentFeeD := 0;
    FBAWeightBasedFeeD := 0;
    FBAPerOrderFulfillmentFeeD := 0;
    CommissionD := 0;
    qty := 0;
  end;

  procedure DrawXMLItem(XMLItem: NativeXml.TXmlNode);
  var
    i: Integer;
  begin
    if XMLItem.Name = 'AmazonOrderID' then
    begin
      insertProfitReports;
      OrderId := XMLItem.Value;
      // Memo1.Lines.Add(XMLItem.Name + ' : ' + XMLItem.Value);
    end;
    if XMLItem.Name = 'SKU' then
    begin
      Sku := XMLItem.Value;
      if ((oldSku > '') and (oldSku <> Sku)) then
        insertProfitReports;
      oldSku := Sku;
      // Memo1.Lines.Add(XMLItem.Name + ' : ' + XMLItem.Value);
    end;
    if XMLItem.Name = 'Quantity' then
    begin
      qty := qty + XMLItem.ValueAsInteger;
      // Memo1.Lines.Add(XMLItem.Name + ' : ' + XMLItem.Value);
    end;
    if XMLItem.Name = 'PostedDate' then
    begin
      DateS := XMLItem.Value;
      // Memo1.Lines.Add(XMLItem.Name + ' : ' + XMLItem.Value);
    end;
    if XMLItem.Name = 'Amount' then
    begin
      if (typeName = 'Principal') then
        principalD := principalD + XMLItem.ValueAsFloat;
      if (typeName = 'FBAWeightBasedFee') then
        FBAWeightBasedFeeD := FBAWeightBasedFeeD + XMLItem.ValueAsFloat;
      if (typeName = 'FBAPerUnitFulfillmentFee') then
        FBAPerUnitFulfillmentFeeD := FBAPerUnitFulfillmentFeeD +
          XMLItem.ValueAsFloat;
      if (typeName = 'FBAPerOrderFulfillmentFee') then
        FBAPerOrderFulfillmentFeeD := FBAPerOrderFulfillmentFeeD +
          XMLItem.ValueAsFloat;
      if (typeName = 'Commission') then
        CommissionD := CommissionD + XMLItem.ValueAsFloat;
      if (typeName = 'Shipping') then
        ShippingD := ShippingD + XMLItem.ValueAsFloat;
      if (typeName = 'ShippingChargeback') then
        ShippingD := ShippingD + XMLItem.ValueAsFloat;
      // Memo1.Lines.Add(typeName + ' : ' + XMLItem.Value);
      typeName := '';
    end;
    if XMLItem.Name = 'Type' then
      typeName := XMLItem.Value;
    for i := 0 to XMLItem.ContainerCount - 1 do
      DrawXMLItem(XMLItem.Containers[i]);
  end;

begin
  addActivity(DM.AlonDb, 'Load Profit report file ' + FileName);
  insQty := 0;
  updQty := 0;
  processed := 0;
  try
    try
      oldSku := '';
      // oldOrder := '';
      Screen.Cursor := crSQLWait;
      XML := TNativeXml.Create(Self);
      XML.LoadFromFile(FileName);
      // memo1.Lines.BeginUpdate;
      if assigned(XML.Root) then
        DrawXMLItem(XML.Root);

      // memo1.Lines.EndUpdate;
      Application.ProcessMessages;
      Application.ProcessMessages;
      Label5.Caption := 'Updated ' + IntToStr(updQty) + ' orders. Done.';
      Label6.Caption := 'Inserted ' + IntToStr(insQty) +
        ' orders. All procesed=' + IntToStr(processed);
      // DM.insertUpdateItemsProfit;
      // RunExternalSql
      // ('update profitreport pr set vendor=(select vendor from ai_items i where i.sku=pr.sku and vendor>'''') where vendor=''''',
      // DM.AlonDb.Database, 'runSql1.bat');
      // // DM.RunSql('update profitreport pr set vendor=(select vendor from ai_items i where i.sku=pr.sku and vendor>'''') where vendor=''''');
      // Application.ProcessMessages;
      // // DM.RunSql('update profitreport pr set ainvcost=(select mycost from ai_items i where i.sku=pr.sku and mycost>0) where ainvcost=0 or ainvcost is null');
      // RunExternalSql
      // ('update profitreport pr set ainvcost=(select mycost from ai_items i where i.sku=pr.sku and mycost > 0) where exists (select * from ai_items a1, profitreport p1 where a1.SKU = p1.SKU and mycost <> ainvcost) or ainvcost is null',
      // DM.AlonDb.Database, 'runSql2.bat');
      // // DM.RunSql('update profitreport pr set ainvcost=(select mycost from ai_items i where i.sku=pr.sku and mycost > 0) where exists (select * from ai_items a1, profitreport p1 where a1.SKU = p1.SKU and mycost <> ainvcost) or ainvcost is null');
      // Application.ProcessMessages;
    except
      on e: SysUtils.Exception do
      begin
        sendLogMail('Error log from LoadProfitReports', e.Message);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmInventory.btnMeleInvClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'btnMeleInvClick');
  with OD do
    if Execute then
    begin
      DM.RunSql('update ai_items set vendorqty=0 where vendor=' +
        QuotedStr('MELE'));
      UpdateMeleInventory(FileName);
    end;
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.UpdateMeleInventory(FileName: string);
var
  TmpLst: TStringList;
  TmpStr, Sku, qtyS, DateS: string;
  Delim: Char;
  i, updQty: Integer;
begin
  Delim := #9;
  // Delim := ',';
  DateS := QuotedStr(DateTimeToStr(Now));
  try
    TmpLst := TStringList.Create;
    TmpLst.LoadFromFile(FileName);
    updQty := 0;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      Sku := ReplaceStr(ExtractDelimited(1, TmpStr, [Delim]), '"', '');
      Sku := ReplaceStr(Sku, '&', '+');
      Sku := ReplaceStr(Sku, '?', 'M');
      Sku := ReplaceStr(Sku, '''', '');
      qtyS := ExtractDelimited(5, TmpStr, [Delim]);
      if (qtyS = '') or (qtyS = 'A') then
        qtyS := '100'
      else
        qtyS := '0';
      DM.RunSql('update ai_items set vendorQty=' + qtyS + ', vendorqtyupdate=' +
        DateS + ' where ffsku=' + QuotedStr(Sku) + ' and vendor=' +
        QuotedStr('MELE'));
      Label4.Caption := 'Update  Inventory qty Sku=' + Sku;
      inc(updQty);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  lbLastUpdateMele.Caption := DateS;
  Label3.Caption := 'Updated ' + IntToStr(updQty) + ' parts';
end;

procedure TfmInventory.dbgMainCellClick(Column: TColumn);
begin
  if (Column.FieldName = 'addtopo') then
  begin
    Column.Grid.DataSource.DataSet.Edit;
    if (Uppercase(Column.Field.AsString) = 'FALSE') then
    begin
      Column.Field.AsString := 'True';
      inc(countSelected);
    end
    else
    begin
      inc(countSelected, -1);
      Column.Field.AsString := 'False';
    end;
    Column.Grid.DataSource.DataSet.Post;
    PressKey(VK_DOWN);
    PressKey(VK_RIGHT);
    PressKey(VK_UP);
    PressKey(VK_LEFT);
    setCountSelectedLines();
  end;
end;

procedure TfmInventory.dbgMainDblClick(Sender: TObject);
var
  FieldName, fieldValueStr: string;
  // fieldValue: Integer;
begin
  FieldName := Uppercase(TjvDBGrid(Sender).Columns.Items[TjvDBGrid(Sender).col -
    1].FieldName);
  if ((FieldName = 'VENDOR') or (FieldName = 'VENDORQTY')) then
  begin
    // fieldValueStr := TjvDBGrid(Sender).Columns.Items[TjvDBGrid(Sender).col - 1].Field.AsString;
    fieldValueStr := DM.qAinv.FieldByName('VENDOR').AsString;
    if (fieldValueStr > '') then
      fmEditVendor.ShowModal;
  end
  else if ((FieldName = 'LASTORDERDATE')) then
  begin
    fieldValueStr := DM.qAinv.FieldByName('SKU').AsString;
    if (fieldValueStr > '') then
    begin
      with DM.qSkuPo do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('select p.po, p.orderdate, l.qty, l.line from po p,polines l');
        SQL.Add('where sku=' + QuotedStr(fieldValueStr) + ' and l.po=p.po');
        SQL.Add('order by orderdate desc');
        Active := true;
      end;
      fmSkuPurchaseOrders.Caption := 'Purchase orders for SKU # ' +
        fieldValueStr;
      fmSkuPurchaseOrders.ShowModal;
    end;
  end
  else
  // if ((FieldName = 'SKU') or (FieldName = 'DESCRIPTION') or (FieldName = 'CUSTSKU')) then
  begin
    fieldValueStr := DM.qAinv.FieldByName('SKU').AsString;
    if (fieldValueStr > '') then
      fmEditItem.ShowModal;
    // DM.RefreshQuery(DM.qAinv);
  end;
end;

procedure TfmInventory.Setiteminactive1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Setiteminactive1Click SKU=' +
    DM.qAinv.FieldByName('SKU').AsString);
  DM.RunSql('update ai_items set isactive=false where SKU=' +
    QuotedStr(DM.qAinv.FieldByName('SKU').AsString));
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.Setitemactive1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Setitemactive1Click SKU=' +
    DM.qAinv.FieldByName('SKU').AsString);
  DM.RunSql('update ai_items set isactive=true where SKU=' +
    QuotedStr(DM.qAinv.FieldByName('SKU').AsString));
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.LoadFilesTimer(Sender: TObject);
var
  lst: TStringDynArray;
  i: Integer;
  foundInv, foundOrd, procInv, procOrd: Boolean;
begin
  LoadFiles.Tag := LoadFiles.Tag + 1;
  lst := TDirectory.GetFiles('c:\Amazon\production\reports\');
  foundInv := false;
  foundOrd := false;
  procInv := false;
  procOrd := false;
  if (Length(lst) > 0) then
    for i := 0 to Length(lst) - 1 do
    begin
      if (Pos('AFN_INVENTORY', lst[i]) > 0) then
        foundInv := true;
      if (Pos('AMAZON_FULFILLED_SHIPMENTS', lst[i]) > 0) then
        foundOrd := true;
    end;

  if (foundInv and foundOrd) then
  begin
    LoadFiles.Enabled := false;
    LoadFiles.Tag := 0;
    TimerForUpdates.Enabled := true;
    if (CheckFileDir(LOAD_INV, '*AFN_INVENTORY*.*')) then
    begin
      procInv := true;
      sendLogMail('AFN_INVENTORY loaded', 'AFN_INVENTORY loaded ');
    end;
    if (CheckFileDir(LOAD_ORDERS, '*AMAZON_FULFILLED_SHIPMENTS*.*')) then
    begin
      procOrd := true;
      sendLogMail('AMAZON_FULFILLED_SHIPMENTS loaded',
        'AMAZON_FULFILLED_SHIPMENTS loaded ');
    end;
    if (CheckFileDir(LOAD_PROFIT, '*SETTLEMENT*.*')) then
    begin
      sendLogMail('SETTLEMENT loaded', 'SETTLEMENT loaded ');
    end;
    if (CheckFileDir(LOAD_RECON, '*INBOUND_NONCOMPLIANCE*.*')) then
    begin
      sendLogMail('RECON report loaded', 'RECON report loaded ');
    end;
  end
  else if (LoadFiles.Tag > 8) then
  begin
    LoadFiles.Enabled := false;
    TimerForUpdates.Enabled := true;
    if ((procInv = false) or (procOrd = false)) then
      sendLogMail('Error load inventory', 'Timer started ' +
        IntToStr(LoadFiles.Tag) + ' times');
    LoadFiles.Tag := 0;
  end
  else
    runJavaModule('GetReport');
end;

procedure TfmInventory.TimerForUpdatesTimer(Sender: TObject);
var
  HourNow, MinNow, Sec, MSec: Word;
  // admin, user               : String;
begin
  if ((Uppercase(GetCurrentUserName) <> 'SHIM') and
    (Uppercase(GetCurrentUserName) <> 'ADMINISTRATOR')) then
  begin
    Log('exits without any action');
    Exit;
  end;
  DecodeTime(Now, HourNow, MinNow, Sec, MSec);
  if (HourNow > 5) then
  begin
    Log('Timer hour=' + IntToStr(HourNow) + ' user=' + GetCurrentUserName +
      '  Timer finished for today');
    Exit;
  end;
  Log('Timer hour=' + IntToStr(HourNow) + ' user=' + GetCurrentUserName);
  if (HourNow = 2) then
  begin
    btnReportRequestClick(nil);
    LoadFiles.Enabled := true;
    TimerForUpdates.Enabled := false;
  end;
  if (HourNow = 3) then
  begin
    runJavaModule('GetReport');
  end;
  if (HourNow = 4) then
  begin
    if (CheckFileDir(LOAD_PROFIT, '*SETTLEMENT*.*')) then
    begin
      sendLogMail('SETTLEMENT loaded', 'SETTLEMENT loaded ');
    end;
  end;
  if (HourNow = 5) then
  begin
    try
      btnBnfInvClick(nil);
      btnTmcInvClick(nil);
    except
      on e: Exception do
        Log(e.Message, true);
    end;
    btnUpdVndCostsClick(nil);
    btnUpItemsProfitClick(nil);
    if ((DayOf(Now) = 5) or (DayOf(Now) = 10)) then
    begin
      btnUpdateItemsSoldMonthlyClick(nil);
      Log('Items sold monthly updated');
    end;
    Log('Finished.');
  end;
end;

procedure TfmInventory.btnProcessAllClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnProcessAllClick');
  LoadFiles.Tag := 0;
  btnReportRequestClick(nil);
  LoadFiles.Enabled := true;
  // TimerForUpdates.Enabled := false;
end;

procedure TfmInventory.GetReporSettlementTimer(Sender: TObject);
begin
  runJavaModule('GetReport', '_GET_V2_SETTLEMENT_REPORT_DATA_XML_');
end;

procedure TfmInventory.runJavaModule(Action: string; reportName: string = '');
begin
//ExecAndWait
//    ('java -jar AmazonAinv.jar com.ainv.projects.Starter runModule=GetReportsForAinv dir=c:\Amazon\production\reports\\ logdir='
//    + ExtractFilePath(ParamStr(0)) + '\\ action=' + Action + ' addfile=' + reportName);
ExeAndWait
    ('java -jar AmazonAinv.jar com.ainv.projects.Starter runModule=GetReportsForAinv dir=c:\Amazon\production\reports\\ logdir='
    + ExtractFilePath(ParamStr(0)) + '\\ action=' + Action + ' addfile=' + reportName);
end;

procedure TfmInventory.Searchaddress1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Searchaddress1Click');
  DM.tbWarehouses.Active := true;
  fmAdressSearch.ShowModal;
end;

procedure TfmInventory.btnReportListClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnReportListClick');
  runJavaModule('ReportList');
  // sendLogMail('Check send log mail', 'Test send log mail');
end;

procedure TfmInventory.btnReportGetClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnReportGetClick');
  runJavaModule('GetReport');
end;

procedure TfmInventory.btnReportRequestClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnReportRequestClick');
  runJavaModule('Request');
end;

procedure TfmInventory.Warehouses1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Warehouses1Click');
  DM.tbWarehouses.Active := true;
  fmWarehouses.ShowModal;
end;

procedure TfmInventory.btnRangeSkuClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnRangeSkuClick');
  pnRange.Visible := true;
  pnRange.BringToFront;
  memRange.SetFocus;
end;

procedure TfmInventory.btnReconLoadClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'btnReconLoadClick');
  if not CheckFileDir(LOAD_RECON, '*INBOUND_NONCOMPLIANCE*.*') then
    with OD do
      if (Execute) then
      begin
        LoadRecon(FileName);
      end;
end;

procedure TfmInventory.LoadRecon(FileName: string);
var
  TmpLst: TStringList;
  shipId, createDate, TmpStr: string;
  Delim: Char;
  i: Integer;
begin
  addActivity(DM.AlonDb, 'Load Reconcile file ' + FileName);
  Delim := #9;
  try
    TmpLst := TStringList.Create;
    TmpLst.LoadFromFile(FileName);
    Screen.Cursor := crSQLWait;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      if (ExtractDelimited(10, TmpStr, [Delim])
        = 'INACCURATE_ASIN_QUANTITY_IN_CARTON') then
      begin
        createDate := Trim(ExtractDelimited(2, TmpStr, [Delim]));
        shipId := Trim(ExtractDelimited(3, TmpStr, [Delim]));
        if (retStrFieldValue(DM.AlonDb,
          'select shipid from reconreport where shipid=' + QuotedStr(shipId)) <>
          shipId) then
        begin
          Label4.Caption := 'Insert into reconcile report ShipId = ' + shipId;
          DM.RunSql('insert into reconreport values(' + QuotedStr(shipId) + ','
            + QuotedStr(createDate) + ',0,' +
            QuotedStr(DateTimeToStr(Now)) + ')');
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  Label4.Caption := FormatDateTime('dd/mm/yyyy tt', Now) +
    ' Finished load recon file ';
end;

procedure TfmInventory.btnRefreshClick(Sender: TObject);
var
  res: RefreshRes;
  vendor: string;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnRefreshClick');
  vendor := Trim(cbVendors.Items.Strings[cbVendors.ItemIndex]);
  res := DM.GetInventoryStatistics(vendor);
  lblTotalRec.Caption := res.ItemsCount;
  lbInventory.Caption := res.Inventory;
  lbAmazonPrice.Caption := res.price;
  lbMyCost.Caption := res.MyCost;
  // cbVendors.Items := DM.fillCombo('vendors', 'vendorname', ' where isactive=true', true);
  // cbSetVendor.Items := DM.fillCombo('vendors', 'vendorname', ' where isactive=true', true);
  // cbPoReportVendors.Items := DM.fillCombo('vendors', 'vendorname', ' where isactive=true', true);
  // DM.UpdateQtyOrdByCaseQty();
end;

procedure TfmInventory.AddItemtoPO1Click(Sender: TObject);
var
  po, place: Integer;
begin
  addActivity(DM.AlonDb, 'TfmInventory.AddItemtoPO1Click');
  place := DM.qAinv.RecNo;
  if (Trim(DM.qAinv.FieldByName('Vendor').AsString) = '') then
  begin
    ShowMessage('Please define vendor for this Item');
    Exit;
  end
  else if (DM.qAinv.FieldByName('lastorderdate').AsString <> '') then
  begin
    po := DM.FindPoBySKU(DM.qAinv.FieldByName('SKU').AsString);
    if (po = 0) then
    begin
      DM.RunSql('update ai_items set lastorderdate=null where sku=' +
        QuotedStr(DM.qAinv.FieldByName('sku').AsString));
    end
    else
    begin
      ShowMessage('This item already exists in PO # ' + IntToStr(po));
      Exit;
    end;
  end;
  if ((Trim(DM.qAinv.FieldByName('VendorQty').AsString) = '0') and
    (DM.isUpdateVendors(DM.qAinv.FieldByName('Vendor').AsString))) then
  // ((UpperCase(Trim(DM.qAInv.FieldByName('Vendor').AsString)) = 'BNF') or (UpperCase(Trim(DM.qAInv.FieldByName('Vendor').AsString)) = 'TMC'))) then
  begin
    if (MessageDlg('Vendor''s qty of this item is "0".' + #13 + #10 +
      'Do you want anyway include this line to PO?', mtConfirmation,
      [mbOK, mbCancel], 0) = mrCancel) then
      Exit;
  end;
  with DM do
  begin
    if (qAInvAddToPo.Value = false) then
    begin
      RunSql('update ai_items set addtopo=true where sku=' +
        QuotedStr(qAinv.FieldByName('sku').AsString));
      cbVendorsSelect(nil);
    end
    else
    begin
      RunSql('update ai_items set addtopo=false where sku=' +
        QuotedStr(qAinv.FieldByName('sku').AsString));
      RefreshQuery(DM.qAinv);
      cbVendorsSelect(nil);
    end;
  end;
  DM.qAinv.RecNo := place;
  setCountSelectedLines();
end;

procedure TfmInventory.Editvendor1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Editvendor1Click');
  DM.tbVendors.Filtered := false;
  DM.tbVendors.Active := true;
  fmVendors.ShowModal;
end;

procedure TfmInventory.Setfiltervendor1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Setfiltervendor1Click');
  with DM do
  begin
    if (qAinvVendor.Value > '') then
    begin
      if (onlyActive) then
      begin
        qAinv.Filter := 'isActive=true and vendor=' +
          QuotedStr(qAinvVendor.AsString);
      end
      else
      begin
        qAinv.Filter := 'vendor=' + QuotedStr(qAinvVendor.AsString);
      end;
      qAinv.Filtered := true;
    end;
  end;
end;

procedure TfmInventory.Purchaseorders1Click(Sender: TObject);
begin
  // addActivity(DM.AlonDb, 'TfmInventory.Purchaseorders1Click');
  DM.tbVendors.Filtered := false;
  fmPurchaseOrders.ShowModal;
end;

procedure TfmInventory.Receiveitem1Click(Sender: TObject);
var
  po: Integer;
begin
  addActivity(DM.AlonDb, 'TfmInventory.Receiveitem1Click');
  po := DM.FindPoBySKU(DM.qAInvSKU.AsString);
  if (po > 0) then
  begin
    DM.tbPO.Active := true;
    DM.tbPO.Locate('po', po, []);
    fmReceiver.ShowModal;
  end
  else
    ShowMessage('PO number not found for this item');
end;

procedure TfmInventory.Refresh1Click(Sender: TObject);
begin
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.btnLoadBNFInventoryClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnLoadBNFInventoryClick');
  with OD do
    if Execute then
    begin
      LoadBNFInventory(FileName);
    end;
  // DM.RunSql('update items set isActive=true');
  RunExternalSql
    ('update ai_items set qtymin=qtyinv where qtymin=0 and qtyinv> 0',
    DM.AlonDb.Params.Database);
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.LoadBNFInventory(FileName: string);
var
  TmpLst: TStringList;
  TmpStr, Sku, FfSku, title, Desc, price, qtyS, myPrice, UPC, weight: string;
  Delim: Char;
  tmpPrice: Double;
  i, qty, insQty, updQty: Integer;
begin
  Delim := #9;
  try
    TmpLst := TStringList.Create;
    TmpLst.LoadFromFile(FileName);
    insQty := 0;
    updQty := 0;
    // "Item Number"	"Catalog Description"	"Available Inventory"	"Each Price"	"Major Category"	"Each Weight (lbs.)"	"Each UPC"	"Item Title"
    for i := 1 to TmpLst.Count - 1 do
    begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      FfSku := ExtractDelimited(1, TmpStr, [Delim]);
      Sku := 'BNF-' + FfSku;
      Desc := ExtractDelimited(2, TmpStr, [Delim]);
      Desc := ReplaceStr(Desc, '"', '');
      weight := ExtractDelimited(6, TmpStr, [Delim]);
      if (weight = '') then
        weight := '0.0';
      price := ExtractDelimited(4, TmpStr, [Delim]);
      if (price = '') then
        price := '0.0';
      tmpPrice := (StrToFloat(price) + 2.5) / 0.65;
      myPrice := FloatToStrF(tmpPrice, ffFixed, 6, 2);
      qtyS := ExtractDelimited(3, TmpStr, [Delim]);
      UPC := ExtractDelimited(7, TmpStr, [Delim]);
      title := ExtractDelimited(8, TmpStr, [Delim]);
      title := ReplaceStr(title, '"', '');
      if (qtyS = '') then
        qtyS := '0';
      qty := StrToInt(qtyS);
      if (DM.ItemExists(Sku)) then
      begin
        DM.UpdateInventoryQty(Sku, qty);
        Label3.Caption := 'Update qty=' + qtyS + ' sku=' + Sku;
        inc(updQty);
      end
      else
      begin
        DM.RunSql(
          'insert into ai_items (sku,ffsku,title,description,qtyinv,price,mycost,asin, weight, isactive) values ('
          + QuotedStr(Sku) + ',' + QuotedStr(FfSku) + ',' + QuotedStr(title) +
          ',' + QuotedStr(Desc) + ',' + qtyS + ',' + price + ',' + myPrice + ','
          + QuotedStr(UPC) + ',' + weight + ',true)');
        Label4.Caption := 'Insert into Inventory Sku=' + Sku;
        inc(insQty);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  Label3.Caption := 'Updated ' + IntToStr(updQty) + ' parts';
  Label4.Caption := 'Inserted ' + IntToStr(insQty) + ' parts';
end;

procedure TfmInventory.btnUnloadBNFClick(Sender: TObject);
var
  StrLst: TStringList;
  q: TFdQuery;
  // tab: Char;
  CurrDir, Sku, clearSku, title, Desc, qty, price, Asin: string;
  i, qtyN: Integer;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnUnloadBNFClick');
  CurrDir := ExtractFilePath(ParamStr(0));
  // tab := #9;
  StrLst := TStringList.Create;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := DM.AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select SKU,FfSku,Asin,mycost,qtyinv,title,description from ai_items where SKU like ''BNF-%''');
      Active := true;
      First;
      i := 0;
      StrLst.Add('<?xml version="1.0"?>');
      StrLst.Add
        ('<AmazonEnvelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="amzn-envelope.xsd">');
      StrLst.Add
        ('<Header><DocumentVersion>1.01</DocumentVersion><MerchantIdentifier>M_THESPECIAL_5452616</MerchantIdentifier></Header>');
      StrLst.Add('<MessageType>' + Rg1.Items.Strings[Rg1.ItemIndex] +
        '</MessageType>');
      //
      StrLst.Add('<Message>');
      while not Eof do
      // for i := 0 to 10 do
      begin
        Sku := Fields[0].AsString;
        clearSku := Fields[1].AsString;
        Asin := Fields[2].AsString;
        price := FloatToStrF(Fields[3].AsFloat, ffFixed, 6, 2);
        qtyN := Fields[4].AsInteger - 25;
        if (qtyN < 0) then
          qtyN := 0;
        qty := IntToStr(qtyN);
        title := Fields[5].AsString;
        Desc := Fields[6].AsString;
        inc(i);
        // StrLst.Add(Fields[0].AsString + tab + Fields[1].AsString + tab + '3' + tab + CurrToStrF(Fields[2].AsFloat, ffNumber, 1) + tab + '11' + tab + Fields[3].AsString + tab + 'a' + tab + '2' + tab + ' ' + tab + ' ');
        if (Rg1.ItemIndex = 0) then
        begin
          // Product feed
          StrLst.Add('<MessageID>' + IntToStr(i) + '</MessageID>');
          StrLst.Add('<OperationType>Update</OperationType>');
          StrLst.Add('<Product>');
          StrLst.Add('<SKU>' + Sku + '</SKU>');
          StrLst.Add('<ProductTaxCode>A_GEN_TAX</ProductTaxCode>');
          // strLst.Add('<StandardProductID>'+Asin+'</StandardProductID>');
          StrLst.Add('<LaunchDate>2011-05-26T00:00:01</LaunchDate>');
          StrLst.Add('<DescriptionData>');
          StrLst.Add('<Title>' + title + '</Title>');
          StrLst.Add('<Description>' + Desc + '</Description>');
          StrLst.Add('</DescriptionData>');
          StrLst.Add('</Product>');
        end;
        // Inventory quantity feed
        if (Rg1.ItemIndex = 1) then
        begin
          StrLst.Add('<MessageID>' + IntToStr(i) + '</MessageID>');
          StrLst.Add('<OperationType>Update</OperationType>');
          StrLst.Add('<Inventory>');
          StrLst.Add('<SKU>' + Sku + '</SKU>');
          StrLst.Add('<Quantity>' + qty + '</Quantity>');
          StrLst.Add('<FulfillmentLatency>1</FulfillmentLatency>');
          StrLst.Add('</Inventory>');
        end;
        // Price feed
        if (Rg1.ItemIndex = 2) then
        begin
          StrLst.Add('<MessageID>' + IntToStr(i) + '</MessageID>');
          StrLst.Add('<Price>');
          StrLst.Add('<SKU>' + Sku + '</SKU>');
          StrLst.Add('<StandardPrice currency="USD">' + price +
            '</StandardPrice>');
          StrLst.Add('</Price>');
        end;

        // Image Feed
        if (Rg1.ItemIndex = 3) then
        begin
          StrLst.Add('<MessageID>' + IntToStr(i) + '</MessageID>');
          StrLst.Add('<OperationType>Update</OperationType>');
          StrLst.Add('<ProductImage>');
          StrLst.Add('<SKU>' + Sku + '</SKU>');
          StrLst.Add('<ImageType>Main</ImageType>');
          StrLst.Add('<ImageLocation>http://miraduga.com/downloads/bnfpics/' +
            clearSku + '/' + clearSku + '_800.jpg</ImageLocation>');
          StrLst.Add('</ProductImage>');
        end;
        Next;
      end;
    end;
    StrLst.Add('</Message>');
    StrLst.Add('</AmazonEnvelope>');
    StrLst.SaveToFile(CurrDir + 'Uploads\' + Rg1.Items.Strings[Rg1.ItemIndex] +
      '_upload.xml');
    StrLst.Clear;
    Label4.Caption := 'Done';
  finally
    StrLst.Free;
    q.Free;
  end;
end;

procedure TfmInventory.DeleteItem1Click(Sender: TObject);
begin
  DM.RunSql('delete from ai_items where SKU=' +
    QuotedStr(DM.qAinv.FieldByName('SKU').AsString));
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.SetOrder(OrderBy: Integer; Asc: Boolean);
var
  qStr, ascDesc: string;
begin
  CurrentOrder := OrderBy;
  CurrentAsc := Asc;
  ascDesc := ' asc ';
  if (not Asc) then
    ascDesc := ' desc ';
  qStr := 'select * from  ai_items order by ';
  case OrderBy of
    ORDER_BY_SKU:
      qStr := qStr + ' SKU ' + ascDesc;
    ORDER_BY_VENDOR:
      qStr := qStr + ' (VENDOR is null), VENDOR ' + ascDesc;
    ORDER_BY_INV:
      qStr := qStr + ' QTYINV ' + ascDesc;
    ORDER_BY_QTY_MIN:
      qStr := qStr + ' QTYMIN ' + ascDesc;
    ORDER_BY_ADD_TO_PO:
      qStr := qStr + ' ADDTOPO ' + ascDesc;
    ORDER_BY_QTY_WH:
      qStr := qStr + ' QTYWH ' + ascDesc;
    ORDER_BY_ORDER_DATE:
      qStr := qStr + ' (LASTORDERDATE is null), LASTORDERDATE ' + ascDesc;
    ORDER_BY_QTY_TO_ORD:
      // qStr := qStr + ' QTYORD ' + ascdesc;
      qStr := qStr + '  qtyOrd desc, qtyInv asc, qtyMin desc, sku asc';
    // ORDER_DEFAULT: qStr := qStr + ' qtyInv asc,qtyOrd desc, qtyMin desc, sku asc';
  else
    qStr := qStr + ' qtyOrd desc, qtyInv asc, qtyMin desc, sku asc';
  end;
  with DM.qAinv do
  begin
    Active := false;
    SQL.Clear;
    SQL.Add(qStr);
    Active := true;
  end;
end;

procedure TfmInventory.Shippingproblems1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.Shippingproblems1Click');
  DM.tbReconReport.Active := true;
  DM.tbReconReport.Filter := 'deleted=0';
  DM.tbReconReport.Filtered := true;
  fmShipQtyProblem.CountAll;
  fmShipQtyProblem.Show;
end;

procedure TfmInventory.dbgMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var
  OrderBy: Integer;
  Asc, setNewOrder: Boolean;
begin
  // addActivity(DM.AlonDb, 'fmInventory.dbgMainTitleBtnClick');
  // orderBy := ORDER_DEFAULT;
  OrderBy := CurrentOrder;
  setNewOrder := false;
  Asc := true;
  if (Uppercase(Field.FieldName) = 'SKU') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_SKU;
    Asc := true;
  end
  else if (Uppercase(Field.FieldName) = 'VENDOR') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_VENDOR;
    Asc := true;
  end
  else if (Uppercase(Field.FieldName) = 'QTYINV') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_INV;
    Asc := true;
  end
  else if (Uppercase(Field.FieldName) = 'QTYMIN') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_QTY_MIN;
    Asc := false;
  end
  else if (Uppercase(Field.FieldName) = 'QTYORD') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_QTY_TO_ORD;
    Asc := false;
  end
  else if (Uppercase(Field.FieldName) = 'ADDTOPO') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_ADD_TO_PO;
    Asc := false;
  end
  else if (Uppercase(Field.FieldName) = 'QTYWH') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_QTY_WH;
    Asc := false;
  end
  else if (Uppercase(Field.FieldName) = 'LASTORDERDATE') then
  begin
    setNewOrder := true;
    OrderBy := ORDER_BY_ORDER_DATE;
    Asc := false;
  end;
  if (CurrentOrder = OrderBy) then
    Asc := not CurrentAsc;
  if (setNewOrder) then
    SetOrder(OrderBy, Asc);
end;

procedure TfmInventory.dbgMainGetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
var
  HighLight: Boolean;
begin
  HighLight := false;
  if (Uppercase(Field.FieldName) = 'SKU') and (CurrentOrder = ORDER_BY_SKU) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'VENDOR') and
    (CurrentOrder = ORDER_BY_VENDOR) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'QTYINV') and
    (CurrentOrder = ORDER_BY_INV) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'QTYMIN') and
    (CurrentOrder = ORDER_BY_QTY_MIN) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'QTYORD') and
    (CurrentOrder = ORDER_BY_QTY_TO_ORD) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'ADDTOPO') and
    (CurrentOrder = ORDER_BY_ADD_TO_PO) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'QTYWH') and
    (CurrentOrder = ORDER_BY_QTY_WH) then
    HighLight := true
  else if (Uppercase(Field.FieldName) = 'LASTORDERDATE') and
    (CurrentOrder = ORDER_BY_ORDER_DATE) then
    HighLight := true
  else
    SortMarker := smNone;
  if HighLight then
  begin
    if (CurrentAsc) then
      SortMarker := smUp
    else
      SortMarker := smDown;
    AFont.Color := clBlue;
  end;
end;

procedure TfmInventory.edDateFrom3Exit(Sender: TObject);
begin
  edDateTo3.date := EncodeDate(ExtractFromDateTime(edDateFrom3.date, 'year'),
    ExtractFromDateTime(edDateFrom3.date, 'month'),
    DaysInAMonth(ExtractFromDateTime(edDateFrom3.date, 'year'),
    ExtractFromDateTime(edDateFrom3.date, 'month')));
end;

procedure TfmInventory.Emptyorderdate1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.EmptyOrderDate SKU=' +
    QuotedStr(DM.qAinv.FieldByName('SKU').AsString));
  DM.RunSql('update ai_items set lastorderdate=null where SKU=' +
    QuotedStr(DM.qAinv.FieldByName('SKU').AsString));
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.est1Click(Sender: TObject);
begin
  DM.qSkuPo.Active;
  fmSkuPurchaseOrders.ShowModal;
end;

procedure TfmInventory.ExitTimerTimer(Sender: TObject);
begin
  if (timeToClose = 0) then
  begin
    fmCountDown.Show;
    ExitTimer.Interval := fmCountDown.countdown * 1000 + 2000;
    ExitTimer.Enabled := false;
    ExitTimer.Enabled := true;
    timeToClose := 5
  end
  else
  begin
    addActivity(DM.AlonDb,
      '----------- Change version / restart ---------------');
    Close;
  end;
end;

procedure TfmInventory.prepareToExit(act: String);
begin
  if (act = ACTIVITY_VERSION) or (act = ACTIVITY_RESTART) then
  begin
    fmCountDown.lbSecTo.Caption := ' seconds to restart';
    fmCountDown.changeVersion := true;
  end
  else
  begin
    fmCountDown.lbSecTo.Caption := ' seconds to shutdown';
    fmCountDown.changeVersion := false;
  end;
  fmCountDown.countdown := 60;
  ExitTimer.Enabled := true;
end;

procedure TfmInventory.btnSaveInfoClick(Sender: TObject);
begin
  DM.tbSelfInfo.Post;
end;

procedure TfmInventory.btnSelectFoundClick(Sender: TObject);
begin
  if ((Sender as TBitBtn).Caption = 'Clear selected') then
  begin
    DM.RunSql('update ai_items set addtopo=false');
    DM.RefreshQuery(DM.qAinv);
  end
  else
  begin
    if (SelectFoundItems <> '') then
    begin
      DM.RunSql(SelectFoundItems);
      DM.RefreshQuery(DM.qAinv);
    end
    else
    begin
      DM.RunSql(
        'update ai_items set addtopo=true where vendor>'''' and mycost>0 and qtyord>0 and lastorderdate is null and isactive=true');
      DM.RefreshQuery(DM.qAinv);
    end;
  end;
  setCountSelectedLines();
end;

procedure TfmInventory.btnSelectVisibleClick(Sender: TObject);
begin
  if ((Sender as TBitBtn).Caption = 'Clear selected') then
  begin
    DM.RunSql('update ai_items set addtopo=false');
    DM.RefreshQuery(DM.qAinv);
  end
  else
  begin
    if (SelectVisibleItems <> '') then
    begin
      DM.RunSql(SelectVisibleItems);
      DM.RefreshQuery(DM.qAinv);
    end;
  end;
  setCountSelectedLines();
end;

procedure TfmInventory.edItemSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) then
    cbVendorsSelect(Sender);
end;

procedure TfmInventory.cbActionSelect(Sender: TObject);
var
  Action: string;
begin
  Action := cbAction.Items.Strings[cbAction.ItemIndex];
  if (Action = 'Set vendor') then
    cbSetVendor.Enabled := true
  else
    cbSetVendor.Enabled := false;
end;

procedure TfmInventory.cbOrderBySelect(Sender: TObject);
begin
  if (cbOrderBy.Text = 'Total Qty sold') then
    cbDesc.Checked := true;
end;

procedure TfmInventory.cbVendorsSelect(Sender: TObject);
var
  vendor: string;
  statShow: String;
  Filter: String;
begin
  if (DM.GetCountAddedToPO > 0) then
  begin
    DM.RunSql('update ai_items set addtopo=false');
    DM.RefreshQuery(DM.qAinv);
    setCountSelectedLines();
  end;
  vendor := cbVendors.Items.Strings[cbVendors.ItemIndex];
  statShow := cbShow.Items.Strings[cbShow.ItemIndex];
  onlyActive := false;
  if (Trim(vendor) = 'ALL') or (Trim(vendor) = '<<EMPTY>>') then
  begin
    if (statShow = 'Active') then
    begin
      Filter := 'isactive=true and isvendoractive=true';
      onlyActive := true;
    end
    else if (statShow = 'Inactive') then
    begin
      Filter := '(isactive=false or isvendoractive=false)';
    end
    else
    begin
      Filter := '';
    end;
    if (Trim(vendor) = '<<EMPTY>>') then
      if (Filter = '') then
        Filter := 'vendor = ' + QuotedStr('')
      else
        Filter := Filter + ' and vendor = ' + QuotedStr('');

    DM.qAinv.Filter := Filter;
    DM.qAinv.Filtered := true;
    if (edItemSearch.Text > '') then
    begin
      SelectFoundItems :=
        'update ai_items set addtopo=true where upper(sku) like ''%' +
        Uppercase(Trim(edItemSearch.Text)) +
        '%'' and mycost>0 and qtyord>0  and lastorderdate is null and (vendorQty > 0 or vendorQty is null)';
      SelectVisibleItems :=
        'update ai_items set addtopo=true where upper(sku) like ''%' +
        Uppercase(Trim(edItemSearch.Text)) + '%''';
      if DM.qAinv.Filter > '' then
        DM.qAinv.Filter := DM.qAinv.Filter + ' and upper(sku) like ' +
          QuotedStr('%' + Uppercase(Trim(edItemSearch.Text)) + '%')
      else
        DM.qAinv.Filter := 'upper(sku) like ' +
          QuotedStr('%' + Uppercase(Trim(edItemSearch.Text)) + '%');
    end
    else
    begin
      SelectFoundItems := '';
      SelectVisibleItems := '';
    end;
    DM.qAinv.Filtered := true;
  end
  else
    with DM do
    begin
      if (statShow = 'Active') then
      begin
        DM.qAinv.Filter := 'isactive=true and vendor=' + QuotedStr(vendor);
        onlyActive := true;
      end
      else if (statShow = 'Inactive') then
      begin
        DM.qAinv.Filter := 'isactive=false and vendor=' + QuotedStr(vendor);
      end
      else if (statShow = 'Empty vendor') then
      begin
        DM.qAinv.Filter := 'vendor = ' + QuotedStr('');
      end
      else
      begin
        DM.qAinv.Filter := 'vendor=' + QuotedStr(vendor);
      end;
      qAinv.Filtered := true;
      if (edItemSearch.Text > '') then
      begin
        SelectFoundItems := 'update ai_items set addtopo=true where vendor=' +
          QuotedStr(vendor) + ' and upper(sku) like ' +
          QuotedStr('%' + Uppercase(Trim(edItemSearch.Text)) + '%') +
          ' and mycost>0 and qtyord>0  and lastorderdate is null  and (vendorQty > 0 or vendorQty is null)';
        SelectVisibleItems := 'update ai_items set addtopo=true where vendor=' +
          QuotedStr(vendor) + ' and upper(sku) like ' +
          QuotedStr('%' + Uppercase(Trim(edItemSearch.Text)) + '%');
        qAinv.Filter := qAinv.Filter + ' and upper(sku) like ' +
          QuotedStr('%' + Uppercase(Trim(edItemSearch.Text)) + '%');
      end
      else
      begin
        SelectFoundItems := 'update ai_items set addtopo=true where vendor=' +
          QuotedStr(vendor) +
          ' and mycost>0 and qtyord>0  and lastorderdate is null  and (vendorQty > 0 or vendorQty is null)';
        SelectVisibleItems := 'update ai_items set addtopo=true where vendor=' +
          QuotedStr(vendor);
      end;
    end;
  btnRefreshClick(nil);

end;

procedure TfmInventory.btnCreateCMFileClick(Sender: TObject);
var
  vendor, sqlText: string;
  StrLst: TStringList;
  q: TFdQuery;
  tab: Char;
  MyCost: Double;
  CurrDir, Sku, Asin, maxPrice, minPrice: string;
  i: Integer;
begin
  vendor := cbVendors.Items.Strings[cbVendors.ItemIndex];
  if (Trim(vendor) = '') then
  begin
    if (edItemSearch.Text > '') then
    begin
      sqlText :=
        'select SKU,ASIN, mycost from ai_items where upper(sku) like ''%' +
        Uppercase(Trim(edItemSearch.Text)) + '%'' and mycost>0';
    end
    else
    begin
      sqlText := 'select SKU,ASIN, mycost from ai_items where mycost>0';
    end
  end
  else if (edItemSearch.Text > '') then
  begin
    sqlText := 'select SKU,ASIN, mycost from ai_items where vendor=' +
      QuotedStr(vendor) + ' and upper(sku) like ''%' +
      Uppercase(Trim(edItemSearch.Text)) + '%'' and mycost>0';
  end
  else
  begin
    sqlText := 'select SKU,ASIN, mycost from ai_items where vendor=' +
      QuotedStr(vendor) + ' and mycost>0';
  end;
  if (Trim(vendor) = '') then
    vendor := 'All';
  CurrDir := ExtractFilePath(ParamStr(0)) + 'CMax_upload_' + vendor + '.txt';
  tab := #9;
  StrLst := TStringList.Create;
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := DM.AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add(sqlText);
      Active := true;
      First;
      i := 0;
      // sku	asin	maximum-selling-price	minimum-selling-price	map	quantity	fba

      StrLst.Add('sku' + tab + 'asin' + tab + 'maximum-selling-price' + tab +
        'minimum-selling-price' + tab + 'map' + tab + 'quantity' + tab + 'fba');
      while not Eof do
      // for i := 1 to 10 do
      begin
        inc(i);
        Sku := Fields[0].AsString;
        Asin := Fields[1].AsString;
        MyCost := Fields[2].AsFloat;
        maxPrice := FloatToStrF(MyCost * StrToFloat(edMaxPrice.Text),
          ffFixed, 6, 2);
        minPrice := FloatToStrF(MyCost * StrToFloat(edMinPrice.Text) +
          StrToFloat(edAddShipCost.Text), ffFixed, 6, 2);
        StrLst.Add(Sku + tab + Asin + tab + maxPrice + tab + minPrice + tab +
          ' ' + tab + '1' + tab + 'y');
        Application.ProcessMessages;
        Next;
      end;
      if (i > 1) then
        StrLst.SaveToFile(CurrDir);
      StrLst.Clear;
    end;
  finally
    StrLst.Free;
    q.Free;
  end;
  ShowMessage('File for ChannelMax repricing : ' + CurrDir);
end;
// ------------------------------------------------------------------------------

procedure TfmInventory.btnShultzInvClick(Sender: TObject);
begin
  with OD do
    if Execute then
    begin
      DM.RunSql('update ai_items set vendorqty=0 where vendor=' +
        QuotedStr('SC'));
      UpdateShultzInventory(FileName);
    end;
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.UpdateShultzInventory(FileName: string);
var
  TmpLst: TStringList;
  TmpStr, Sku, qtyS, DateS: string;
  Delim: Char;
  i, updQty: Integer;
begin
  Delim := #9;
  // Delim := ',';
  DateS := QuotedStr(DateTimeToStr(Now));
  TmpLst := TStringList.Create;
  try
    TmpLst.LoadFromFile(FileName);
    updQty := 0;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      Sku := ReplaceStr(ExtractDelimited(4, TmpStr, [Delim]), '"', '');
      Sku := ReplaceStr(Sku, '&', '+');
      // Sku := ReplaceStr(Sku, ' ', '_');
      Sku := ReplaceStr(Sku, '''', '');
      qtyS := ExtractDelimited(8, TmpStr, [Delim]);
      if (qtyS = '') then
        qtyS := '0';
      DM.RunSql('update ai_items set vendorQty=' + qtyS + ', vendorqtyupdate=' +
        DateS + ' where ffsku=' + QuotedStr(Sku) + ' and vendor=' +
        QuotedStr('SC'));
      Label4.Caption := 'Update  Inventory qty Sku=' + Sku;
      inc(updQty);
    end;
  finally
    Screen.Cursor := crDefault;
    TmpLst.Free;
  end;
  lbLastUpdateShultz.Caption := DateS;
  Label3.Caption := 'Updated ' + IntToStr(updQty) + ' parts';
end;

procedure TfmInventory.btnTestEmailClick(Sender: TObject);
begin
  sendLogMail('Test email', 'Test test');
  ShowMessage('Test mail sent');
end;

// ---------------TMC------------------------------------------------------------

procedure TfmInventory.btnTmcInvClick(Sender: TObject);
begin
  if (not cbTmcUpdate.Checked) then
    Exit;
  addActivity(DM.AlonDb, 'TfmInventory.btnTmcInvClick');
  DM.RunSql('update ai_items set vendorqty=0 where vendor=' + QuotedStr('TM'));
  SendRequestToTMC(false);
  DM.RefreshQuery(DM.qAinv);
end;

function TfmInventory.SendRequestToTMC(test: Boolean): Boolean;
var
  replayStream: TStringStream;
  // respHeader  : TALHTTPResponseHeader;
  StrLst: TStringList;
begin
  Label4.Caption := 'Send inventory request to TMC';
  Application.ProcessMessages;
  Screen.Cursor := crSQLWait;
  StrLst := TStringList.Create;
  try
    // respHeader := TALHTTPResponseHeader.Create;
    replayStream := TStringStream.Create('');
    DM.HTTP1.URL.Create
      ('http://www.trademarkcommerce.com/merchants/files/feeds/tminv_feed.xml');
    DM.HTTP1.Get
      ('http://www.trademarkcommerce.com/merchants/files/feeds/tminv_feed.xml',
      replayStream);
    StrLst.Add(replayStream.DataString);
    // strLst.SaveToFile('ResponseTMCInv.xml');
    // strLst.LoadFromFile('ResponseTMCInv.xml');
    // strLst.SaveToStream(ReplayStream);
    Result := (ProcessXMLTMCReplay(replayStream, false, 'TMC-', 'Product',
      'ProductCode', 'InventoryLevel'));
  finally
    Label4.Caption := 'Update TMC Inventory finished';
    DM.HTTP1.Disconnect;
    Screen.Cursor := crDefault;
    StrLst.Free;
  end;
end;

function TfmInventory.ProcessXMLTMCReplay(XmlStream: TStringStream;
  zero: Boolean; prefix, parentNode, itemName, inventoryName: string): Boolean;
var
  item, inv, DateS: string;
  nodesCount, i, qty: Integer;
  procedure ReadNodes(Node: IXMLNode);
  begin
    if (Node.parentNode.NodeName = parentNode) then
    begin
      if (Node.NodeName = itemName) then
      begin
        // item := prefix + Node.NodeValue;
        item := Node.NodeValue;
      end;
    end;
    if (Node.parentNode.NodeName = inventoryName) then
    begin
      inv := Node.NodeValue;
    end;
    if (Node.parentNode.NodeName = itemName) then
    begin
      // item := prefix + Node.NodeValue;
      item := Node.NodeValue;
    end;
  end;

  procedure getChildNodes(Node: IXMLNode);
  var
    cnt, i: Integer;
  begin
    if (not Node.HasChildNodes) then
    begin
      ReadNodes(Node);
    end;
    if (Node.HasChildNodes) then
    begin
      cnt := Node.ChildNodes.Count;
      for i := 0 to cnt - 1 do
      begin
        getChildNodes(Node.ChildNodes[i]);
      end;
    end
    else
      Exit;
  end;

begin
  DateS := QuotedStr(DateTimeToStr(Now));
  try
    DM.XMLDocument1.LoadFromStream(XmlStream);
    nodesCount := DM.XMLDocument1.DocumentElement.ChildNodes[1]
      .ChildNodes.Count;
    if (nodesCount > 0) then
    begin
      for i := 0 to nodesCount - 1 do
      begin
        getChildNodes(DM.XMLDocument1.DocumentElement.ChildNodes[1]
          .ChildNodes[i]);
        if (Trim(inv) > '') then
          qty := StrToInt(inv)
        else
          qty := 0;
        if (qty < 0) or (zero) then
          qty := 0;
        DM.RunSql('update ai_items set vendorqty=' + IntToStr(qty) +
          ', vendorqtyupdate=' + DateS + ' where ffsku=' + QuotedStr(item));
        Label4.Caption := 'Update  Inventory qty Sku=' + item;
        Application.ProcessMessages;
      end;
    end;
  except
    on e: SysUtils.Exception do
      ShowMessage(e.Message);
  end;
  lbLastUpdateTmc.Caption := DateS;
  Result := true;
  // DeleteFile(FileName);
  // logLst.SaveToFile('logfile.log');
end;

procedure TfmInventory.btnDoActionClick(Sender: TObject);
var
  vendor, Sku, Action: string;
  updProfitReport, upsql: String;
  i: Integer;
  skuList: TStringList;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnDoActionClick');
  skuList := TStringList.Create;
  try
    vendor := cbSetVendor.Items.Strings[cbSetVendor.ItemIndex];
    Action := cbAction.Items.Strings[cbAction.ItemIndex];
    messagePanel.Visible := true;
    if (DM.GetCountAddedToPO > 0) then
    begin
      skuList := DM.getAddToPoItems;
      if (vendor = 'ALL') then
        vendor := '';
      if (Action = 'Set vendor') then
        lbMsg1.Caption := 'Set vendor ' + vendor;
      if (Action = 'Set active') then
        lbMsg1.Caption := 'Set items active ';
      if (Action = 'Set inactive') then
        lbMsg1.Caption := 'Set items inactive ';
      lbMsg2.Caption := '';
      lbMsg3.Caption := '';
      for i := 0 to skuList.Count - 1 do
      begin
        Sku := skuList[i];
        lbMsg2.Caption := 'for SKU = ' + Sku;
        messagePanel.Refresh;
        if (Action = 'Set vendor') then
        begin
          lbMsg3.Caption := 'Update items';
          DM.RunSql('update ai_items set vendor=' + QuotedStr(vendor) +
            ' where sku=' + QuotedStr(Sku));
          // lbMsg3.Caption := 'Update profitreports';
          updProfitReport := updProfitReport + 'update profitreport set vendor='
            + QuotedStr(vendor) +
            ', ainvcost=(select mycost from ai_items i where i.sku=' +
            QuotedStr(Sku) + ' and mycost > 0)' + ' where sku=' +
            QuotedStr(Sku) + ';';
          // DM.RunSql('update profitreport p set vendor=' + QuotedStr(vendor) + ' where sku=' + QuotedStr(Sku));
        end
        else if (Action = 'Set active') then
        begin
          DM.RunSql('update ai_items set isactive=true where SKU=' +
            QuotedStr(Sku));
        end
        else if (Action = 'Set inactive') then
        begin
          DM.RunSql('update ai_items set isactive=false where SKU=' +
            QuotedStr(Sku));
        end;
      end;
      DM.RunSql('update ai_items set addtopo=false');
      DM.RefreshQuery(DM.qAinv);
      setCountSelectedLines();
      messagePanel.Visible := false;
      // showMessage(updProfitReport);
      skuList.Clear;
      upsql := ReplaceStr(updProfitReport, ';', ';' + #13);
      if (Trim(upsql) <> '') then
      begin
        skuList.Add(upsql);
        RunExternalSql(updProfitReport, DM.AlonDb.Name,
          'c:\Temp\' + DateToFileName(Now, true) + '.bat');
        skuList.SaveToFile('c:\Temp\' + DateToFileName(Now, true) + '.sql');
      end;
    end
    else
      ShowMessage('Please select rows for this action');
  finally
    messagePanel.Visible := false;
    skuList.FreeInstance;
  end;
end;

procedure TfmInventory.btnBWKDInvClick(Sender: TObject);
begin
  with OD do
    if Execute then
    begin
      DM.RunSql('update ai_items set vendorqty=0 where vendor=' +
        QuotedStr('BWKD'));
      UpdateBWKDInventory(FileName);
    end;
  DM.RefreshQuery(DM.qAinv);
end;

procedure TfmInventory.UpdateBWKDInventory(FileName: string);
var
  TmpLst, fileLst: TStringList;
  TmpStr, Sku, qtyS, DateS: string;
  Delim: Char;
  i, updQty: Integer;
begin
  Delim := #9;
  // Delim := ',';
  DateS := QuotedStr(DateTimeToStr(Now));
  TmpLst := TStringList.Create;
  fileLst := TStringList.Create;
  try
    TmpLst.LoadFromFile(FileName);
    updQty := 0;
    for i := 1 to TmpLst.Count - 1 do
    begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      TmpStr := TmpLst[i];
      Sku := ReplaceStr(ExtractDelimited(1, TmpStr, [Delim]), '"', '');
      Sku := ReplaceStr(Sku, '&', '+');
      // Sku := ReplaceStr(Sku, ' ', '_');
      Sku := ReplaceStr(Sku, '''', '');
      qtyS := ExtractDelimited(3, TmpStr, [Delim]);

      if (qtyS = 'AVAILABLE') then
        qtyS := '6'
      else
        qtyS := '0';
      DM.RunSql('update ai_items set vendorQty=' + qtyS + ', vendorqtyupdate=' +
        DateS + ' where ffsku=' + QuotedStr(Sku) + ' and vendor=' +
        QuotedStr('BWKD'));
      Label4.Caption := 'Update  Inventory qty Sku=' + Sku;
      fileLst.Add('BWKD-' + Sku + #09 + qtyS);
      inc(updQty);
    end;
    updateAmazonInventory(fileLst, 'BWKD', false);
  finally
    Screen.Cursor := crDefault;
    TmpLst.Free;
    fileLst.Free;
  end;
  lbLastUpdateBWKD.Caption := DateS;
  Label3.Caption := 'Updated ' + IntToStr(updQty) + ' parts';
end;

procedure TfmInventory.btnBackupDbClick(Sender: TObject);
var
  Path: String;
begin
  PATH_TO_PG := edPathToPostgres.Text;
  Path := BackupPostgresDatabase('C:\DbBackup\', DM.AlonDb.Params.Database);
  ShowMessage('DB backup finished. File = ' + Path);
end;

procedure TfmInventory.btnDbRestoreClick(Sender: TObject);
var
  Path: String;
begin
  PATH_TO_PG := edPathToPostgres.Text;
  with OD do
    if Execute then
    begin
      Path := RestorePostgresDatabase(FileName, DM.AlonDb.Params.Database);
      ShowMessage('DB ' + DM.AlonDb.Params.Database + ' restored ' + Path);
      Log(Path);
    end;
end;

procedure TfmInventory.btnVacuumClick(Sender: TObject);
var
  Path: String;
begin
  PATH_TO_PG := edPathToPostgres.Text;
  Path := VacuumPostgresDatabase(DM.AlonDb.Params.Database);
  ShowMessage('DB vacuum finished. Path = ' + Path);
end;

// -------------BNF--------------------------------------------------------------
procedure TfmInventory.btnBnfInvClick(Sender: TObject);
begin
  if (not cbBnfUpdate.Checked) then
    Exit;
  addActivity(DM.AlonDb, 'TfmInventory.btnBnfInvClick');
  DM.RunSql('update ai_items set vendorqty=0 where vendor=' + QuotedStr('BNF'));
  SendRequestToBNF(false);
  DM.RefreshQuery(DM.qAinv);
end;

function TfmInventory.SendRequestToBNF(test: Boolean): Boolean;
var
  str: string;
  SendStream, replayStream: TStringStream;
  // respHeader              : TALHTTPResponseHeader;
  StrLst: TStringList;
begin
  Label4.Caption := 'Send inventory request to BNF';
  Application.ProcessMessages;
  Screen.Cursor := crSQLWait;
  try
    str := '<invxml><AccessRequest><XMLlickey>IRIUA30Z6SI659MF</XMLlickey><UserId>alon@lilgift.com</UserId><Password>ag1616</Password></AccessRequest>';
    str := str + '<query><item>ALL</item></query></invxml>';
    SendStream := TStringStream.Create(str);
    StrLst := TStringList.Create;
    Label4.Caption := 'Send inventory request to vendor';
    // respHeader := TALHTTPResponseHeader.Create;
    replayStream := TStringStream.Create('');
    DM.HTTP1.URL.Create('https://www.bnfusa.com/xml_xchange/inv/post.lasso');
    DM.HTTP1.Post('https://www.bnfusa.com/xml_xchange/inv/post.lasso',
      SendStream, replayStream);
    // DM.HTTP.URL := 'https://www.bnfusa.com/xml_xchange/inv/post.lasso';
    // DM.HTTP.Post('https://www.bnfusa.com/xml_xchange/inv/post.lasso', SendStream, replayStream, respHeader);
    StrLst.Add(replayStream.DataString);
    // StrLst.SaveToFile('ResponseBnfInv.xml');
    // strLst.LoadFromFile('ResponseBnfInv.xml');
    // strLst.SaveToStream(replayStream);
    Result := (ProcessXMLBNFReplay(replayStream, false, 'BNF-', 'record',
      'item', 'inv'));
  finally
    Label4.Caption := 'Update BNF Inventory finished';
    DM.HTTP1.Disconnect;
    Screen.Cursor := crDefault;
  end;
end;

function TfmInventory.ProcessXMLBNFReplay(XmlStream: TStringStream;
  zero: Boolean; prefix, parentNode, itemName, inventoryName: string): Boolean;
var
  item, inv, DateS: string;
  nodesCount, i, qty: Integer;
  procedure ReadNodes(Node: IXMLNode);
  begin
    if (Node.parentNode.NodeName = parentNode) then
    begin
      if (Node.NodeName = itemName) then
      begin
        // item := prefix + Node.NodeValue;
        item := Node.NodeValue;
      end;
      if (Node.NodeName = inventoryName) then
      begin
        inv := Node.NodeValue;
      end;
    end;
  end;
  procedure getChildNodes(Node: IXMLNode);
  var
    cnt, i: Integer;
  begin
    if (Node.IsTextElement) then
    begin
      ReadNodes(Node);
    end;
    if (Node.HasChildNodes) then
    begin
      cnt := Node.ChildNodes.Count;
      for i := 0 to cnt - 1 do
      begin
        getChildNodes(Node.ChildNodes[i]);
      end;
    end
    else
      Exit;
  end;

begin
  DateS := QuotedStr(DateTimeToStr(Now));
  try
    DM.XMLDocument1.LoadFromStream(XmlStream);
    nodesCount := DM.XMLDocument1.DocumentElement.ChildNodes.Count;
    if (nodesCount > 0) then
    begin
      for i := 0 to nodesCount - 1 do
      begin
        getChildNodes(DM.XMLDocument1.DocumentElement.ChildNodes[i]);
        if (Trim(inv) > '') then
          qty := StrToInt(inv)
        else
          qty := 0;
        if (qty < 0) then
          qty := 0;
        DM.RunSql('update ai_items set vendorqty=' + IntToStr(qty) +
          ', vendorqtyupdate=' + DateS + ' where ffsku=' + QuotedStr(item));
        Label4.Caption := 'Update  Inventory qty Sku=' + item;
        Application.ProcessMessages;
      end;
    end;
  except
    on e: SysUtils.Exception do
      ShowMessage(e.Message);
  end;
  lbLastUpdateBnf.Caption := DateS;
  Result := true;
  // DeleteFile(FileName);
  // logLst.SaveToFile('logfile.log');
end;

// ------------------------------   Send Feedback Requests   -------------------------------------------------------------------
procedure TfmInventory.SendRequestByTimer(Sender: TObject);
var
  HourNow, MinNow, Sec, MSec: Word;
  Year, Month, Day, DOW: Word;
  user: String;
begin
  user := GetCurrentUserName;
  if ((Uppercase(GetCurrentUserName) <> 'SHIM') and
    (Uppercase(GetCurrentUserName) <> 'ADMINISTRATOR')) then
  begin
    // log('exits without any action');
    Exit;
  end;
  DecodeTime(Now, HourNow, MinNow, Sec, MSec);
  DecodeDateFully(Now, Year, Month, Day, DOW);
  Log('Timer hour=' + IntToStr(HourNow) + ' day of week = ' + IntToStr(DOW) +
    ' user=' + user, false, false, 'SendRequests');
  // user := retStrFieldValue(DM.AlonDb, 'select userid from tools_logged_users where upper(userid) = ' + QuotedStr('ADMINISTRATOR'));
  // if ((Uppercase(user) = 'ADMINISTRATOR') and (Uppercase(GetCurrentUserName) <> 'ADMINISTRATOR')) then
  // Exit;
  if ((DOW = 1) or (DOW = 7) or ((DOW = 6) and (HourNow > 15)) or
    ((DOW = 2) and (HourNow < 7))) then
    Exit;
  // if (isAdmin) then
  // begin
  Log('------------Runned by timer-------------------------', false, false,
    'SendRequests');
  // 26-02-2020
  // SendRequests();
  // end;
end;

procedure TfmInventory.btnSendRequestClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnSendRequestClick');
  if (btnSendRequest.Caption = 'Send request') then
  begin
    TimerForFeedback.Enabled := false;
    TimerForFeedback.Enabled := true;
    // 26-02-2020
    // SendRequests();
  end
  else
  begin
    btnSendRequest.Caption := 'Send request';
    EmergencyStop := true;
  end;
  lbFRed.Caption := lbFRed.Caption + '. Done.';
end;

procedure TfmInventory.SendRequests();
var
  q: TFdQuery;
  order, title, email, ship, sname: string;
  Count, failed, mPerHour: Integer;
  sent: Boolean;
begin
  btnSendRequest.Caption := 'Stop';
  EmergencyStop := false;
  mPerHour := StrToInt(edMailsPerHour.Text);
  q := TFdQuery.Create(nil);
  try
    with q do
    begin
      Connection := DM.AlonDb;
      Active := false;
      SQL.Clear;
      SQL.Add('select orderid, title, email, shipping, name from forders where sent=false and email is not null and email>'
        + QuotedStr(''));
      SQL.Add('  and  age(shipdate)  between (10 * interval ' +
        QuotedStr('1 day') + ') and (90 * interval ' + QuotedStr('1 day') +
        ') order by shipdate');
      Active := true;
      Count := 0;
      failed := 0;
      First;
      Log('Found ' + IntToStr(RecordCount) + ' records to send', false, false,
        'SendRequests');
      if (RecordCount > 0) then
      begin
        DM.SMTP.Host := edSmtp.Text;
        DM.SMTP.Port := StrToInt(edPort.Text);
        DM.SMTP.Username := edUser.Text;
        Application.ProcessMessages;
        if (edPassword.Text > '') then
        begin
          DM.SMTP.Password := edPassword.Text;
          DM.SMTP.AuthType := satDefault;
          // SMTP.SocksInfo.Authentication := saUsernamePassword;
        end
        else
        begin
          DM.SMTP.AuthType := satNone;
        end;
        if (not DM.SMTP.Connected) then
        begin
          lbFGreen.Caption := 'Trying to connect to ' + DM.SMTP.Host + '...';
          Application.ProcessMessages;
          DM.SMTP.Connect;
        end;
        while (not DM.SMTP.Connected) do
        begin
          lbFGreen.Caption := 'Trying to connect to ' + DM.SMTP.Host + '...';
          Application.ProcessMessages;
        end;
        Log('Connected to SMTP server:' + edSmtp.Text + ':' + edPort.Text,
          false, false, 'SendRequests');
        while not Eof do
        begin
          order := Trim(Fields[0].AsString);
          title := Trim(Fields[1].AsString);
          email := Trim(Fields[2].AsString);
          ship := Trim(Fields[3].AsString);
          sname := Trim(Fields[4].AsString);
          if (Count = mPerHour) then
          begin
            DM.SMTP.Disconnect;
            TimerForFeedback.Enabled := false;
            TimerForFeedback.Enabled := true;
            Exit;
          end;
          inc(Count);
          if (EmergencyStop) then
            Exit;
          sent := sendmail(order, title, email, ship, sname);
          if (sent) then
            DM.RunSql('update forders set sent=true, sentdate=' +
              QuotedStr(DateTimeToStr(Now)) + ' where orderid=' +
              QuotedStr(order))
          else
          begin
            inc(failed);
          end;
          lbFRed.Caption := 'Send ' + IntToStr(RecNo - failed) + ' of ' +
            IntToStr(RecordCount) + ' emails. Failed = ' + IntToStr(failed);
          Log('Send ' + IntToStr(RecNo - failed) + ' of ' +
            IntToStr(RecordCount) + ' emails. Failed = ' + IntToStr(failed),
            false, false, 'SendRequests');
          Next;
        end;
      end
      else
      begin
        Log('All requests were sent... Application exit.+++++++++++++++++++++++',
          false, false, 'SendRequests');
        // Application.Terminate;
        Exit;
      end;
    end;
  finally
    DM.SMTP.Disconnect;
    q.Free;
  end;
end;

procedure TfmInventory.SMTPFailedRecipient(Sender: TObject;
  const AAddress, ACode, AText: string; var VContinue: Boolean);
begin
  Log('Failed recipient. Address=' + AAddress + ' code=' + ACode + ' text=' +
    AText, false, false, 'SendRequests');
end;

function TfmInventory.sendmail(order, title, email, ship,
  sname: string): Boolean;
var
  mailBody: TStringList;
  PostMessage: TIdMessage;
begin
  // Result := false;
  mailBody := TStringList.Create;
  PostMessage := TIdMessage.Create(nil);
  try
    PostMessage.ContentType := 'text/html';
    PostMessage.Organization := 'LilGift';
    mailBody.Add
      ('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">');
    mailBody.Add('<html xmlns="http://www.w3.org/1999/xhtml">');
    // mailBody.Add('<html>');
    // mailBody.Add('  <head>');
    // mailBody.Add('    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />');
    // mailBody.Add('    <title></title>');
    // mailBody.Add('  </head>');
    mailBody.Add
      ('  <body>     <p><span style="font-size: 12pt;">Thank you for your recent purchase of our &quot;<strong>'
      + title + '</strong>&quot; from our store LilGift on Amazon.<br> ');
    mailBody.Add
      ('According to our records, your item should have arrived by now.<br> If it hasn&#39;t, or you were unsatisfied with your purchase in any way, please');
    // mailBody.Add('<a href="mailto:alon@lilgift.com?subject=Customer Service:' + order + ',' + title + '">contact us</a>');
    mailBody.Add
      ('<a href="http://www.amazon.com/gp/help/contact-seller/contact-seller.html?ie=UTF8&marketplaceID=ATVPDKIKX0DER&orderID='
      + order + '&sellerID=AYK2IYC3WT9F3">contact us</a>');
    mailBody.Add
      (' and we will do our best to remedy the situation. We always strive to provide our customers with the best service possible.</span></p>');
    mailBody.Add
      (' <p><span style="font-size: 12pt;">If you are satisfied with your order; we ask that you please leave feedback.<br> For your convenience, you may click <a href="http://www.amazon.com/gp/feedback/leave-customer-feedback.html/?&amp;.rating=5&amp;order='
      + order + '">this link</a> to go directly to the appropriate form on Amazon.com, or you may use the form provided below.');
    mailBody.Add
      (' <br>Please remember that feedback is permanent. If you have any doubts about the transaction, please ');
    // mailBody.Add('<a href="mailto:alon@lilgift.com?subject=Customer Service:' + order + ',' + title + '">contact us</a> ');
    mailBody.Add
      ('<a href="http://www.amazon.com/gp/help/contact-seller/contact-seller.html?ie=UTF8&marketplaceID=ATVPDKIKX0DER&orderID='
      + order + '&sellerID=AYK2IYC3WT9F3">contact us</a>');
    mailBody.Add(' before you leave your feedback.</span></p>');
    mailBody.Add
      ('      <form action="https://www.amazon.com/gp/feedback/leave-customer-feedback.html" method="get">');
    mailBody.Add('        <input name="order" type="hidden" value="' + order
      + '" />');
    mailBody.Add
      ('        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0" align="center">');
    mailBody.Add('          <tbody>');
    mailBody.Add('            <tr>');
    mailBody.Add('              <td valign="top">');
    mailBody.Add
      ('                <table class="small" style="width: 100%;" border="0" cellspacing="3" cellpadding="4">');
    mailBody.Add('                  <tbody>');
    mailBody.Add('                    <tr>');
    mailBody.Add
      ('                      <td width="33%" align="right" valign="top"><strong>Rating:</strong></td>');
    mailBody.Add
      ('                      <td width="66%"><input checked="checked" name=".rating" type="radio" value="5" />5 (Excellent)<br />');
    mailBody.Add
      ('                      <input name=".rating" type="radio" value="4" />4 (Good)<br />');
    mailBody.Add
      ('                      <input name=".rating" type="radio" value="3" />3 (Fair)<br />');
    mailBody.Add
      ('                      <input name=".rating" type="radio" value="2" />2 (Poor)<br />');
    mailBody.Add
      ('                      <input name=".rating" type="radio" value="1" />1 (Awful)<br />');
    mailBody.Add('                      </td>');
    mailBody.Add('                    </tr>');
    mailBody.Add('                    <tr>');
    mailBody.Add
      ('                      <td width="33%" align="right" valign="top"><strong>Comments:</strong></td>');
    mailBody.Add
      ('                      <td width="66%"><input maxlength="400" name=".comment" size="50" type="text" /><br />');
    mailBody.Add
      ('                       <span class="tiny">Max. 200 characters<br />');
    mailBody.Add
      ('                      </span> <input type="submit" value="Submit" /></td>');
    mailBody.Add('                    </tr>');
    mailBody.Add('                  </tbody>');
    mailBody.Add('                </table>');
    mailBody.Add('              </td>');
    mailBody.Add('            </tr>');
    mailBody.Add('          </tbody>');
    mailBody.Add('        </table>');
    mailBody.Add('      </form>');
    mailBody.Add('      <table border="0" cellspacing="0" cellpadding="0">');
    mailBody.Add('        <tbody>');
    mailBody.Add('          <tr>');
    mailBody.Add
      ('            <td colspan="3">Here is your order information for reference:</td>');
    mailBody.Add('          </tr>');
    mailBody.Add('          <tr>');
    mailBody.Add('            <td>&#160;</td>');
    mailBody.Add('            <td valign="top">');
    mailBody.Add('              <div>');
    mailBody.Add('                <strong>Item:&#160;</strong>');
    mailBody.Add('              </div>');
    mailBody.Add('            </td>');
    mailBody.Add('            <td>' + title + '</td>');
    mailBody.Add('          </tr>');
    mailBody.Add('          <tr>');
    mailBody.Add('            <td width="20">&#160;</td>');
    mailBody.Add('            <td valign="top">');
    mailBody.Add('              <div>');
    mailBody.Add('                <strong>Shipping:&#160;</strong>');
    mailBody.Add('              </div>');
    mailBody.Add('            </td>');
    mailBody.Add('            <td>' + ship + '</td>');
    mailBody.Add('          </tr>');
    mailBody.Add('        </tbody>');
    mailBody.Add('      </table>');
    mailBody.Add
      ('      <p><span style="font-size: 12pt;">Thank you very much for your time. We greatly value your feedback.</span></p>');
    mailBody.Add('    </div>');
    mailBody.Add('  </body>');
    mailBody.Add('</html>');
    // mailBody.SaveToFile('tmp.htm');
    // SMTP.PostMessage.FromAddress := '"Alan G." <alon@lilgift.com>';//'shim@miraduga.com';
    PostMessage.From.Name := edFromName.Text;
    PostMessage.From.Address := edFromMail.Text;
    PostMessage.ReplyTo.EMailAddresses := edFromMail.Text;
    PostMessage.Recipients.EMailAddresses := '"' + sname + '" <' + email + '>';
    // 'klubatok@gmail.com';
    // PostMessage.Recipients.EMailAddresses := 'klubatok@gmail.com';
    PostMessage.BccList.Clear;
    Application.ProcessMessages;
    if (edCopyTo.Text > '') then
      PostMessage.BccList.EMailAddresses := edCopyTo.Text;
    // SMTP.PostMessage.ToBlindCarbonCopy.Add('arik_ge@netvision.net.il');
    PostMessage.Body := mailBody;
    // SMTP.PostMessage.Attachments.Add('tmp.htm');
    PostMessage.Subject := 'Regarding your purchase of ' + title + '';
    lbFGreen.Caption := 'Sends mail to <' +
      PostMessage.Recipients.EMailAddresses + '>';
    Application.ProcessMessages;
    // if (not SMTP.Connected) then
    // SMTP.Connect;
    try
      DM.SMTP.Send(PostMessage);
      Log('Sends mail to <' + PostMessage.Recipients.EMailAddresses + '>' +
        ' order #=' + order + ' name=' + sname, false, false, 'SendRequests');
      lbOrderNo.Caption := order;
      lbLastSendDate.Caption := DateTimeToStr(Now);
      lbSentTo.Caption := sname;
    except
      Log('Failed to send mail to <' + PostMessage.Recipients.EMailAddresses +
        '> ' + ' order #=' + order + ' name=' + sname, false, false,
        'SendRequests');
      lbFRed.Caption := 'Failed to send mail to <' +
        PostMessage.Recipients.EMailAddresses + '>';
      Result := false;
      Exit;
    end;
  finally
    mailBody.Free;
    PostMessage.Free;
  end;
  Result := true;
end;

// ------------  Reports   -----------------------------
procedure TfmInventory.btnMonthRepClick(Sender: TObject);
var
  lbTitle: TfrxMemoView;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnMonthRepClick');
  with DM do
  begin
    lbTitle := DM.frxRep.FindObject('lbTitle') as TfrxMemoView;
    lbTitle.Text := 'Last month orders';
    qRep.Active := false;
    qRep.SQL.Clear;
    qRep.SQL.Add('select * from ai_items where lastorderdate >  :DateTo');
    qRep.ParamByName('DateTo').AsDate := IncDay(Now, -30);
    qRep.Active := true;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxRep.ShowReport;
  end;
end;

procedure TfmInventory.btnDayRepClick(Sender: TObject);
var
  lbTitle: TfrxMemoView;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnDayRepClick');
  with DM do
  begin
    lbTitle := DM.frxRep.FindObject('lbTitle') as TfrxMemoView;
    lbTitle.Text := 'Last day orders';
    qRep.Active := false;
    qRep.SQL.Clear;
    qRep.SQL.Add('select * from ai_items where lastorderdate >  :DateTo');
    qRep.ParamByName('DateTo').AsDate := IncDay(Now, -1);
    // ShowMessage(qRep.SQL.Text);
    qRep.Active := true;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxRep.ShowReport;
  end;
end;

procedure TfmInventory.btnWeekRepClick(Sender: TObject);
var
  lbTitle: TfrxMemoView;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnWeekRepClick');
  with DM do
  begin
    lbTitle := DM.frxRep.FindObject('lbTitle') as TfrxMemoView;
    lbTitle.Text := 'Last week orders';
    qRep.Active := false;
    qRep.SQL.Clear;
    qRep.SQL.Add('select * from ai_items where lastorderdate > :DateTo');
    qRep.ParamByName('DateTo').AsDate := IncDay(Now, -7);
    qRep.Active := true;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxRep.ShowReport;
  end;
end;

procedure TfmInventory.btnUpdateItemsSoldMonthlyClick(Sender: TObject);
var
  Month, Year: Integer;
  date: TDate;
  SQL: String;
begin
  if (Sender <> nil) then
  begin
    Month := StrToInt(edMonth.Text);
    Year := StrToInt(edYear.Text);
  end
  else
  begin
    date := IncMonth(Now, -1);
    Month := MonthOf(date);
    Year := YearOf(date);
  end;
  DM.RunSql('delete from items_sold_monthly where year = ' + IntToStr(Year) +
    ' and month =' + IntToStr(Month));
  SQL := 'insert into items_sold_monthly ' +
    'select upper(vendor), sku, extract(year from orderdate),extract(month from orderdate) ,sum(qty) from profitreport '
    + 'where vendor is not null and extract(year from orderdate) = ' +
    IntToStr(Year) + ' and extract(month from orderdate) = ' + IntToStr(Month) +
    ' group by 1,2,3,4';
  DM.RunSql(SQL);
  if (Sender <> nil) then
    ShowMessage('Done');
end;

procedure TfmInventory.btnUpdOrdQtyClick(Sender: TObject);
begin
  DM.UpdateQtyOrdByCaseQty();
end;

procedure TfmInventory.btnUpdVndCostsClick(Sender: TObject);
begin
  Log('Started run update vendors in ProfitReport table');
  RunExternalSql
    ('update profitreport pr set vendor=(select vendor from ai_items i where i.sku=pr.sku and vendor>'''') where vendor='''' or vendor is null',
    DM.AlonDb.Params.Database, 'c:\Temp\UpdVendorInProfit.bat');
  Log('Finished run update vendors in ProfitReport table');
  Log('Started run update costs in ProfitReport table');
  RunExternalSql
    ('update profitreport pr set ainvcost= sub.mycost from  ai_items as sub where mycost <> ainvcost and sub.sku=pr.sku and mycost > 0',
    DM.AlonDb.Params.Database, 'c:\Temp\UpdCostInProfit.bat');
  Log('Finished run update costs in ProfitReport table');
  // ShowMessage('Finished run update vendors and costs in ProfitReport table');
end;

procedure TfmInventory.btnUpItemsProfitClick(Sender: TObject);
begin
  DM.insertUpdateItemsProfit;
  if (Sender <> nil) then
    ShowMessage('Done');
end;


// -------------------------- Reports ------------------------------------

procedure TfmInventory.btnPrintLinesClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnPrintLinesClick');
  with DM do
  begin
    qRep.Active := false;
    qRep.SQL.Clear;
    qRep.SQL.Add('select Sku,FfSku,QtyInv,QtyMin,QtyOrd,LastOrderDate');
    qRep.SQL.Add('from  ai_items where qtyinv=0 and isActive=true');
    qRep.SQL.Add('order by QtyMin desc limit 30 ');
    // qRep.SQL.Add('LIMIT 0, 20');
    qRep.Active := true;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxPrintLines.ShowReport;
  end;
end;

procedure TfmInventory.btnProfitReportClick(Sender: TObject);
var
  OrderBy, groupBy, sel: string;
  lbPerItem, lbSku: TfrxMemoView;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnProfitReportClick');
  with DM do
  begin
    lbPerItem := DM.frxProfitReport.FindObject('lbPerItem') as TfrxMemoView;
    lbSku := DM.frxProfitReport.FindObject('lbSku') as TfrxMemoView;
    if (cbUseRange.Checked) then
    begin
      edSku.Text := ReplaceStr(memRange.Lines.Text, #$A, '');
      edSku.Text := ReplaceStr(edSku.Text, #$D, '');
    end;
    OrderBy := cbOrderBy.Items.Strings[cbOrderBy.ItemIndex];
    groupBy := ' group by SKU';
    lbPerItem.Text := 'Per item';
    lbSku.Text := 'SKU';
    sel := 'SKU';
    if ((OrderBy = 'SKU') or (cbOrderBy.ItemIndex < 0)) then
      OrderBy := ' order by SKU';
    if (OrderBy = 'Item Profit') then
      OrderBy := ' order by itemprofit';
    if (OrderBy = 'Total Profit') then
      OrderBy := ' order by profit';
    if (OrderBy = 'Percent Profit') then
      OrderBy := ' order by percentprofit';
    if (OrderBy = 'Total Qty sold') then
      OrderBy := ' order by qtyS ';
    if (OrderBy = 'Vendor') then
    begin
      OrderBy := ' order by vendor';
      groupBy := ' group  by vendor';
      sel := 'vendor as sku';
      lbPerItem.Text := 'Per vendor';
      lbSku.Text := 'Vendor';
    end;
    if (cbDesc.Checked) then
      OrderBy := OrderBy + ' desc';

    with qProfitReport do
    begin
      Active := false;
      SQL.Clear;
      SQL.Add('select ' + sel +
        ', (sum(principal) / sum(qty)) principal,(sum(ainvcost*qty) / sum(qty)) ainvcost1, ');
      SQL.Add('(sum(FBAPerUnitFulfillmentFee) + sum(FBAWeightBasedFee) + ');
      SQL.Add('sum(FBAPerOrderFulfillmentFee) + sum(Commission))  TotalFees, ');
      SQL.Add('sum(qty) qtyS, sum(profit) profit, sum(profit) / sum(qty) itemProfit, ');
      SQL.Add(' (((sum(profit) / sum(qty) ) / ((sum(ainvcost) / sum(qty))) / sum(qty)) * 100) percentProfit, sum(Principal) sumPrincipal ');
      SQL.Add(', ((sum(ainvcost*qty) / sum(qty)) * sum(qty)) totalPrincipalSold ');
      SQL.Add('from  profitreport ');
      SQL.Add(' where (OrderDate between :DateFrom and :DateTo)');
      if (Trim(edSku.Text) > '') then
        // SQL.Add(' and upper(sku) like' + QuotedStr('%' + UpperCase(Trim(edSku.Text)) + '%'));
        SQL.Add(retRangeStringConditions('sku', edSku.Text));
      SQL.Add(' and ainvcost > 0 and principal>0');
      if (Trim(edVendors.Text) > '') then
      begin
        SQL.Add(' and upper(vendor) in (''' +
          ReplaceStr(Uppercase(edVendors.Text), ',', ''',''') + ''')');
      end;
      if (cbUseRange.Checked) then
        edSku.Text := '';
      SQL.Add(groupBy);
      SQL.Add(OrderBy);
      // SQL.Add('');
      // SQL.Add('');
      ParamByName('DateFrom').AsDate := edDateFrom.date;
      ParamByName('DateTo').AsDate := IncDay(edDateTo.date, 1);
      // ShowMessage(SQL.Text);
      // memo1.Lines.Text := SQL.Text;
      Active := true;
    end;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxProfitReport.ShowReport();
  end;
end;

procedure TfmInventory.btnTwoCompareProfitClick(Sender: TObject);
var
  months: DBUnit.TVendorArray;
  q: TFdQuery;
  countVendors, i, vPlace: Integer;
  yearMonth, curVendor: string;
  tVend: DBUnit.TVendorArray;
  profit: Double;
  dateFrom, dateTo: TDate;
  lbThisYear, lbPreviousYear: TfrxMemoView;

  function getPlaceInArray(arrPar: DBUnit.TVendorArray; StrToFind: string;
    len: Integer): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to len - 1 do
    begin
      if (Trim(arrPar[i]) = Trim(StrToFind)) then
      begin
        Result := i;
        break;
      end;
    end;
  end;

begin
  addActivity(DM.AlonDb, 'TfmInventory.btnTwoCompareProfitClick');
  with DM do
  begin
    // lbVendor := DM.frxTwoCompareProfit.FindObject('lbVendor') as TfrxMemoView;
    lbThisYear := DM.frxTwoCompareProfit.FindObject('lbThisYear')
      as TfrxMemoView;
    lbPreviousYear := DM.frxTwoCompareProfit.FindObject('lbPreviousYear')
      as TfrxMemoView;
    lbThisYear.Text := '';
    lbPreviousYear.Text := '';
    // lbThisYearProfit.Text := '';
    // lbPreviousYearProfit.Text := '';
    countVendors := DM.getProfitVendorsCount(edCp2Vendors.Text,
      edDateFrom3.date, IncDay(edDateTo3.date, 1));
    if (countVendors = 0) then
    begin
      MessageBox(0, 'Not found data for this period', '',
        MB_ICONEXCLAMATION or MB_OK);
      Exit;
    end;
    SetLength(cpVendors, countVendors);
    SetLength(tVend, countVendors);
    SetLength(months, 2);
    SetLength(cpMonth1, countVendors);
    SetLength(cpMonth2, countVendors);
    frxDsTwoCompareProfit.RangeEndCount := countVendors;
    tVend := DM.getVendorsForProfitReport(edCp2Vendors.Text, tVend,
      edDateFrom3.date, IncDay(edDateTo3.date, 1));

    for i := 0 to countVendors - 1 do
      cpVendors[i] := tVend[i];
    q := TFdQuery.Create(nil);
    dateFrom := edDateFrom3.date;
    dateTo := IncDay(edDateTo3.date, 1);
    try
      with q do
      begin
        Connection := DM.AlonDb;
        Active := false;
        SQL.Clear;
        SQL.Add('select vendor,sum(profit) as totalprofit, extract(year from orderdate) as year,extract(month from orderdate) as month from  profitreport');
        SQL.Add(' where (orderdate between :DateFrom and :DateTo)');
        if ((Trim(edCp2Vendors.Text) > '')) then
        begin
          SQL.Add(' and upper(vendor) in (''' +
            ReplaceStr(Uppercase(edCp2Vendors.Text), ',', ''',''') + ''')');
        end
        else
          SQL.Add(' and vendor is not null');
        SQL.Add(' group  by vendor, year, month');
        SQL.Add(' order  by vendor, year, month');
        ParamByName('DateFrom').AsDate := dateFrom;
        ParamByName('DateTo').AsDate := dateTo;
        // ShowMessage(SQL.Text);
        Active := true;
        First;
        while not Eof do
        begin
          curVendor := Fields[0].AsString;
          profit := Fields[1].AsFloat;
          yearMonth := Fields[2].AsString + '/' + Fields[3].AsString;
          lbThisYear.Text := yearMonth;
          vPlace := getPlaceInArray(tVend, curVendor, countVendors);
          // ShowMessage(curVendor + ' ' + FloatToStr(profit) + ' ' + yearMonth + ' hp=' + IntToStr(hPlace) + ' vp=' + IntToStr(vPlace));
          cpMonth1[vPlace] := profit;
          Next;
        end;
        // The second iteration for previous Year

        dateFrom := IncYear(edDateFrom3.date, -1);
        dateTo := IncYear(IncDay(edDateTo3.date, 1), -1);
        Active := false;
        SQL.Clear;
        SQL.Add('select vendor,sum(profit) as totalprofit, extract(year from orderdate) as year,extract(month from orderdate) as month from  profitreport');
        SQL.Add(' where (orderdate between :DateFrom and :DateTo)');
        if ((Trim(edCp2Vendors.Text) > '')) then
        begin
          SQL.Add(' and upper(vendor) in (''' +
            ReplaceStr(Uppercase(edCp2Vendors.Text), ',', ''',''') + ''')');
        end
        else
          SQL.Add(' and vendor is not null');
        SQL.Add(' group  by vendor, year, month');
        SQL.Add(' order  by vendor, year, month');
        ParamByName('DateFrom').AsDate := dateFrom;
        ParamByName('DateTo').AsDate := dateTo;
        // ShowMessage(SQL.Text);
        Active := true;
        First;
        while not Eof do
        begin
          curVendor := Fields[0].AsString;
          profit := Fields[1].AsFloat;
          yearMonth := Fields[2].AsString + '/' + Fields[3].AsString;
          lbPreviousYear.Text := yearMonth;
          vPlace := getPlaceInArray(tVend, curVendor, countVendors);
          // ShowMessage(curVendor + ' ' + FloatToStr(profit) + ' ' + yearMonth + ' hp=' + IntToStr(hPlace) + ' vp=' + IntToStr(vPlace));
          cpMonth2[vPlace] := profit;
          Next;
        end;
      end;
    finally
      q.Free;
    end;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxTwoCompareProfit.ShowReport();
    // ppTwoCompareProfit.Print;
  end;
end;

procedure TfmInventory.btnCompareProfitReportClick(Sender: TObject);
var
  // months: array[1..12] of string;
  months: DBUnit.TVendorArray;
  q: TFdQuery;
  countMonths, monthsDiff, countVendors, i, vPlace, hPlace: Integer;
  yearMonth, curVendor: string;
  tVend: DBUnit.TVendorArray;
  profit: Double;
  lbField1, lbField2, lbField3, lbField4, lbField5, lbField6, lbField7,
    lbField8, lbField9, lbField10, lbField11, lbField12: TfrxMemoView;

  function getPlaceInArray(arrPar: DBUnit.TVendorArray; StrToFind: string;
    len: Integer): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to len - 1 do
    begin
      if (Trim(arrPar[i]) = Trim(StrToFind)) then
      begin
        Result := i;
        break;
      end;
    end;
  end;

begin
  addActivity(DM.AlonDb, 'TfmInventory.btnCompareProfitReportClick');
  monthsDiff := MonthsBetween(edDateFrom2.date, IncDay(edDateTo2.date, 1));
  if (monthsDiff > 12) then
  begin
    ShowMessage('Please choose period less or equal one year');
    Exit;
  end;
  with DM do
  begin
    lbField1 := DM.frxCompareProfitReport.FindObject('lbField1')
      as TfrxMemoView;
    lbField2 := DM.frxCompareProfitReport.FindObject('lbField2')
      as TfrxMemoView;
    lbField3 := DM.frxCompareProfitReport.FindObject('lbField3')
      as TfrxMemoView;
    lbField4 := DM.frxCompareProfitReport.FindObject('lbField4')
      as TfrxMemoView;
    lbField5 := DM.frxCompareProfitReport.FindObject('lbField5')
      as TfrxMemoView;
    lbField6 := DM.frxCompareProfitReport.FindObject('lbField6')
      as TfrxMemoView;
    lbField7 := DM.frxCompareProfitReport.FindObject('lbField7')
      as TfrxMemoView;
    lbField8 := DM.frxCompareProfitReport.FindObject('lbField8')
      as TfrxMemoView;
    lbField9 := DM.frxCompareProfitReport.FindObject('lbField9')
      as TfrxMemoView;
    lbField10 := DM.frxCompareProfitReport.FindObject('lbField10')
      as TfrxMemoView;
    lbField11 := DM.frxCompareProfitReport.FindObject('lbField11')
      as TfrxMemoView;
    lbField12 := DM.frxCompareProfitReport.FindObject('lbField12')
      as TfrxMemoView;
    lbField1.Text := '';
    lbField2.Text := '';
    lbField3.Text := '';
    lbField4.Text := '';
    lbField5.Text := '';
    lbField6.Text := '';
    lbField7.Text := '';
    lbField8.Text := '';
    lbField9.Text := '';
    lbField10.Text := '';
    lbField11.Text := '';
    lbField12.Text := '';
    countVendors := DM.getProfitVendorsCount(edCpVendors.Text, edDateFrom2.date,
      IncDay(edDateTo2.date, 1));
    SetLength(cpVendors, countVendors);
    SetLength(tVend, countVendors);
    SetLength(months, 12);
    SetLength(cpMonth1, 0);
    SetLength(cpMonth2, 0);
    SetLength(cpMonth3, 0);
    SetLength(cpMonth4, 0);
    SetLength(cpMonth5, 0);
    SetLength(cpMonth6, 0);
    SetLength(cpMonth7, 0);
    SetLength(cpMonth8, 0);
    SetLength(cpMonth9, 0);
    SetLength(cpMonth10, 0);
    SetLength(cpMonth11, 0);
    SetLength(cpMonth12, 0);
    SetLength(cpMonth1, countVendors);
    SetLength(cpMonth2, countVendors);
    SetLength(cpMonth3, countVendors);
    SetLength(cpMonth4, countVendors);
    SetLength(cpMonth5, countVendors);
    SetLength(cpMonth6, countVendors);
    SetLength(cpMonth7, countVendors);
    SetLength(cpMonth8, countVendors);
    SetLength(cpMonth9, countVendors);
    SetLength(cpMonth10, countVendors);
    SetLength(cpMonth11, countVendors);
    SetLength(cpMonth12, countVendors);
    frxDsCompareProfitReport.RangeEndCount := countVendors;
    tVend := DM.getVendorsForProfitReport(edCpVendors.Text, tVend,
      edDateFrom2.date, IncDay(edDateTo2.date, 1));
    for i := 0 to countVendors - 1 do
      cpVendors[i] := tVend[i];
    q := TFdQuery.Create(nil);
    try
      try
        with q do
        begin
          Connection := DM.AlonDb;
          Active := false;
          SQL.Clear;
          SQL.Add('select  extract(year from orderdate) as year,extract(month from orderdate) as month from  profitreport');
          SQL.Add(' where (orderdate between :DateFrom and :DateTo)');
          if ((Trim(edCpVendors.Text) > '')) then
          begin
            SQL.Add(' and upper(vendor) in (''' +
              ReplaceStr(Uppercase(edCpVendors.Text), ',', ''',''') + ''')');
          end;
          SQL.Add(' group  by year, month');
          SQL.Add(' order  by year, month');
          ParamByName('DateFrom').AsDate := edDateFrom2.date;
          ParamByName('DateTo').AsDate := IncDay(edDateTo2.date, 1);
          // ShowMessage(SQL.Text);
          Active := true;
          First;
          countMonths := 0;
          while not Eof do
          begin
            yearMonth := Fields[0].AsString + '/' + Fields[1].AsString;
            months[countMonths] := yearMonth;
            case countMonths of
              0:
                lbField1.Text := yearMonth;
              1:
                lbField2.Text := yearMonth;
              2:
                lbField3.Text := yearMonth;
              3:
                lbField4.Text := yearMonth;
              4:
                lbField5.Text := yearMonth;
              5:
                lbField6.Text := yearMonth;
              6:
                lbField7.Text := yearMonth;
              7:
                lbField8.Text := yearMonth;
              8:
                lbField9.Text := yearMonth;
              9:
                lbField10.Text := yearMonth;
              10:
                lbField11.Text := yearMonth;
              11:
                lbField12.Text := yearMonth;
            end;
            inc(countMonths);
            Next;
          end;
          Active := false;
          SQL.Clear;
          SQL.Add('select vendor,sum(profit) as totalprofit, extract(year from orderdate) as year,extract(month from orderdate) as month from  profitreport');
          SQL.Add(' where (orderdate between :DateFrom and :DateTo)');
          if ((Trim(edCpVendors.Text) > '')) then
          begin
            SQL.Add(' and upper(vendor) in (''' +
              ReplaceStr(Uppercase(edCpVendors.Text), ',', ''',''') + ''')');
          end
          else
            SQL.Add(' and vendor is not null');
          SQL.Add(' group  by vendor, year, month');
          SQL.Add(' order  by vendor, year, month');
          ParamByName('DateFrom').AsDate := edDateFrom2.date;
          ParamByName('DateTo').AsDate := IncDay(edDateTo2.date, 1);
          // ShowMessage(SQL.Text);
          Active := true;
          First;
          while not Eof do
          begin
            curVendor := Fields[0].AsString;
            profit := Fields[1].AsFloat;
            yearMonth := Fields[2].AsString + '/' + Fields[3].AsString;
            vPlace := getPlaceInArray(tVend, curVendor, countVendors);
            hPlace := getPlaceInArray(months, yearMonth, 12);
            // ShowMessage(curVendor + ' ' + FloatToStr(profit) + ' ' + yearMonth + ' hp=' + IntToStr(hPlace) + ' vp=' + IntToStr(vPlace));
            case hPlace of
              0:
                cpMonth1[vPlace] := profit;
              1:
                cpMonth2[vPlace] := profit;
              2:
                cpMonth3[vPlace] := profit;
              3:
                cpMonth4[vPlace] := profit;
              4:
                cpMonth5[vPlace] := profit;
              5:
                cpMonth6[vPlace] := profit;
              6:
                cpMonth7[vPlace] := profit;
              7:
                cpMonth8[vPlace] := profit;
              8:
                cpMonth9[vPlace] := profit;
              9:
                cpMonth10[vPlace] := profit;
              10:
                cpMonth11[vPlace] := profit;
              11:
                cpMonth12[vPlace] := profit;
            end;
            Next;
          end;
        end;
      except
        on e: SysUtils.Exception do
        begin
          Log(e.Message, true);
        end;
      end;
    finally
      q.Free;
    end;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxCompareProfitReport.ShowReport();
  end;
end;

procedure TfmInventory.btnCloseMemoClick(Sender: TObject);
begin
  pnRange.Visible := false;
end;

procedure TfmInventory.BitBtn1Click(Sender: TObject);
var
  PostMessage: TIdMessage;
begin
  DM.tbSelfInfo.Active := true;
  DM.tbSelfInfo.Filter := 'type=' + QuotedStr('1');
  DM.tbSelfInfo.Filtered := true;
  SMTP.Host := DM.tbSelfInfosmtp_server.Value;
  SMTP.Port := DM.tbSelfInfosmtp_port.Value; // 80, 3535, 25, 465 (SSL)
  SMTP.Username := DM.tbSelfInfosmtp_user.Value;
  SMTP.Password := DM.tbSelfInfosmtp_password.Value;

  try
    begin
      SMTP.Connect;
      PostMessage := TIdMessage.Create(nil);
    PostMessage.Organization := DM.tbSelfInfocompany.AsString;
    PostMessage.From.Name := DM.tbSelfInfomyname.Value;
    PostMessage.From.Address := DM.tbSelfInfoemail.Value;
    PostMessage.ReplyTo.EMailAddresses := DM.tbSelfInfoemail.Value;
    PostMessage.Recipients.EMailAddresses := 'frederic@barefootdreams.com';
      SMTP.Verify('frederic@barefootdreams.com');
      ShowMessage('Connect successfull');
    end;
  except
    on e: SysUtils.Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;

end;

procedure TfmInventory.btn5000CostClick(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmInventory.btn5000CostClick');
  with DM do
  begin
    qRep5000.Active := false;
    qRep5000.Active := true;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frx5000.ShowReport();
  end;
end;

procedure TfmInventory.btnPeriodCompareReportClick(Sender: TObject);
var
  lbFirstDateRange, lbSecDateRange: TfrxMemoView;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnPeriodCompareReportClick');
  with DM do
  begin
    lbFirstDateRange := DM.frxCompareItemProfitByDates.FindObject
      ('lbFirstDateRange') as TfrxMemoView;
    lbSecDateRange := DM.frxCompareItemProfitByDates.FindObject
      ('lbSecDateRange') as TfrxMemoView;
    lbFirstDateRange.Text := DateToStr(edCurDatefrom.date) + '-' +
      DateToStr(edCurDateTo.date);
    lbSecDateRange.Text := DateToStr(edPrevDateFrom.date) + '-' +
      DateToStr(edPrevDateTo.date);
    try
      with qCompByDates do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('select p1.sku, sum(p1.qty) as sales1, sum(p2.qty) as sales2 ');
        SQL.Add('from profitreport p1, profitreport p2');
        SQL.Add('where p2.sku=p1.sku ');
        SQL.Add(' and (p1.OrderDate between :DateFrom1 and :DateTo1)');
        SQL.Add(' and (p2.OrderDate between :DateFrom2 and :DateTo2)');
        if (Trim(edSku3.Text) > '') then
          SQL.Add(retRangeStringConditions('p1.sku', edSku3.Text));
        SQL.Add('group by p1.sku');
        // SQL.Add('');
        ParamByName('DateFrom1').AsDate := edCurDatefrom.date;
        ParamByName('DateTo1').AsDate := IncDay(edCurDateTo.date, 1);
        ParamByName('DateFrom2').AsDate := edPrevDateFrom.date;
        ParamByName('DateTo2').AsDate := IncDay(edPrevDateTo.date, 1);
        // ShowMessage(SQL.Text);
        // memo1.Lines.Text := SQL.Text;
        Active := true;
      end;
    finally
    end;
    frxPDFExport1.FileName := 'report.pdf';
    frxPDFExport1.ShowDialog := true;
    frxCompareItemProfitByDates.ShowReport();
  end;
end;

procedure TfmInventory.btnPoReportClick(Sender: TObject);
var
  groupBy, vendor, select: string;
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnPoReportClick');
  groupBy := cbOrderBy1.Items.Strings[cbOrderBy1.ItemIndex];

  if (cbOrderBy1.ItemIndex < 0) then
    groupBy := 'Vendor';
  select := groupBy;
  if (groupBy = 'SKU') then
    select := ''''' as Vendor,SKU ';
  if (groupBy = 'Vendor') then
    select := 'Vendor, '''' as SKU';
  vendor := Uppercase(Trim(cbPoReportVendors.Items.Strings
    [cbPoReportVendors.ItemIndex]));

  with DM.qPoReport do
  begin
    Active := false;
    SQL.Clear;
    SQL.Add('select ' + select + ', sum(qty * price) as cost  ');
    SQL.Add('from po po, polines pl ');
    SQL.Add(' where (OrderDate between :DateFrom and :DateTo)');
    if (vendor > '') and (vendor <> 'ALL') then
      SQL.Add(' and upper(vendor) = ' + QuotedStr(vendor) + ' ');
    if (Trim(edSku1.Text) > '') then
      SQL.Add(retRangeStringConditions('sku', edSku1.Text));
    // SQL.Add(' and upper(sku) like ''%' + UpperCase(Trim(edSku1.Text)) + '%''');
    SQL.Add(' and pl.po=po.po');
    SQL.Add(' group by ' + groupBy);
    SQL.Add(' order by ' + groupBy);
    // ShowMessage(SQL.Text);
    // SQL.Add('');
    // SQL.Add('');
    ParamByName('DateFrom').AsDate := edDateFrom1.date;
    ParamByName('DateTo').AsDate := IncDay(edDateTo1.date, 1);
    Active := true;
  end;
  DM.frxPDFExport1.FileName := 'report.pdf';
  DM.frxPDFExport1.ShowDialog := true;
  DM.frxPoReport.ShowReport;
end;

procedure TfmInventory.btnSoldItemsReportClick(Sender: TObject);
var
  vendor, select, psik, koteret, FileName, mlai: string;
  i, curMonth, monthCount, curYear, startYear, endYear, startMonth,
    endMonth: Integer;
  query: TFdQuery;
  StrLst: TStringList;
  curDate: TDate;
const
  monthNames: array [1 .. 12] of string = ('January', 'February', 'March',
    'April', 'May', 'June', 'July', 'August', 'September', 'October',
    'November', 'December');
begin
  addActivity(DM.AlonDb, 'TfmInventory.btnSoldItemsReportClick');
  vendor := Uppercase(Trim(cbSIRepVendors.Items.Strings
    [cbSIRepVendors.ItemIndex]));
  if ((vendor = '') or (vendor = 'ALL')) then
    raise Exception.Create('Please choose vendor');

  startYear := YearOf(edSIRepDateFrom.date);
  endYear := YearOf(edSIRepDateTo.date);
  startMonth := MonthOf(edSIRepDateFrom.date);
  endMonth := MonthOf(edSIRepDateTo.date);
  if (startYear > endYear) then
    raise Exception.Create('Wrong dates, start after end');
  if ((startYear = endYear) and ((startMonth > endMonth) or
    (startMonth = endMonth))) then
    raise Exception.Create('Wrong dates, check months');

  monthCount := MonthsBetween(edSIRepDateFrom.date, edSIRepDateTo.date) + 2;
  select := 'select distinct sku, ';
  curDate := edSIRepDateFrom.date;
  psik := ', ';
  koteret := 'sku';
  for i := 1 to monthCount do
  begin
    if (i = monthCount) then
      psik := ' ';
    curMonth := MonthOf(curDate);
    curYear := YearOf(curDate);
    select := select + #13 +
      ' (select qty from items_sold_monthly pr where pr.sku=prm.sku and pr.vendor = prm.vendor and month = '
      + IntToStr(curMonth) + ' and year = ' + IntToStr(curYear) + ') as ' +
      monthNames[curMonth] + psik;
    koteret := koteret + #9 + monthNames[curMonth] + ' ' + IntToStr(curYear);
    curDate := IncMonth(curDate);
  end;
  select := select + #13 + ' from items_sold_monthly prm where upper(vendor) = '
    + QuotedStr(Uppercase(vendor)) + ' and ((year = ' + IntToStr(startYear) +
    ' and month >= ' + IntToStr(startMonth) + ') or ' + '(year = ' +
    IntToStr(endYear) + ' and month <= ' + IntToStr(endMonth) + '))';
  query := TFdQuery.Create(nil);
  StrLst := TStringList.Create;
  StrLst.Add(select);
  StrLst.SaveToFile('select.sel');
  StrLst.Clear;
  koteret := koteret + #9 + 'Qty of stock';
  StrLst.Add(koteret);
  psik := #9;
  try
    try
      with query do
      begin
        Command.CommandKind := skSelect;
        Connection := DM.AlonDb;
        Active := false;
        SQL.Clear;
        SQL.Add(select);
        Application.ProcessMessages;
        Active := true;
        Application.ProcessMessages;
        First;
        select := '';
        while not Eof do
        begin
          for i := 0 to monthCount do
          begin
            select := select + Fields[i].AsString + psik;
          end;
          mlai := retStrFieldValue(DM.AlonDb,
            'select qtyinv from ai_items where sku=' +
            QuotedStr(Fields[0].AsString));
          select := select + mlai;
          StrLst.Add(select);
          select := '';
          Next;
        end;
      end;
      FileName := 'SalesByVendor_' + Uppercase(vendor) + '_' +
        DateToFileName(edSIRepDateFrom.date, false) + '_' +
        DateToFileName(edSIRepDateTo.date, false) + '.xls';
      StrLst.SaveToFile(FileName);
      ShowMessage('Report saved. File name ' + #13 + FileName + '');
    except
      on e: SysUtils.Exception do
      begin
        Log(e.Message, true);
      end;
    end;
  finally
    query.Free;
    StrLst.Free;
  end;

end;

end.
