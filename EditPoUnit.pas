unit EditPoUnit;

interface

uses Data.DB, OutlookXP, SysUtils, Forms, Dialogs, MyFunctions, Variants, System.UiTypes,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Windows,
  Vcl.Controls, Vcl.DBCtrls, Vcl.ExtCtrls, System.Classes, Graphics, JvDBControls, SqlTimSt, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExDBGrids, JvDBGrid;

type
  TfmPo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    edToVendor: TDBText;
    edPo: TDBText;
    Panel2: TPanel;
    btnSavePO: TBitBtn;
    Label17: TLabel;
    edTotAm: TDBText;
    Panel3: TPanel;
    dbgPurchaseOrders: TDBGrid;
    Label2: TLabel;
    edOrderDate: TDBText;
    edSentDate: TDBText;
    edReceivedDate: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    Deleteline1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    btnRefresh: TSpeedButton;
    btnCreateAmazonPlan: TBitBtn;
    cbAmazonPo: TComboBox;
    Label5: TLabel;
    Renumberlines1: TMenuItem;
    btnCreateShip: TBitBtn;
    cbLabelPrep: TComboBox;
    Label6: TLabel;
    btnArchive: TSpeedButton;
    btnPrintItemLabels: TBitBtn;
    btnCreateLinesFromExcel: TBitBtn;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Label7: TLabel;
    lbLinesCount: TLabel;
    btnSplit199: TBitBtn;
    Label9: TLabel;
    lbSelectedCount: TLabel;
    cbAttLabels: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    lbShipFrom: TLabel;
    lbShipTo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Deleteline1Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCreateAmazonPlanClick(Sender: TObject);
    procedure cbAmazonPoSelect(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Renumberlines1Click(Sender: TObject);
    procedure btnCreateShipClick(Sender: TObject);
    procedure sendMailPOToVendor(Sender: TObject);
    procedure btnArchiveClick(Sender: TObject);
    procedure dbgPurchaseOrdersGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPurchaseOrdersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      var SortMarker: TSortMarker; IsDown: Boolean);
    procedure dbgPurchaseOrdersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure btnPrintItemLabelsClick(Sender: TObject);
    procedure dbgPurchaseOrdersDblClick(Sender: TObject);
    procedure btnCreateLinesFromExcelClick(Sender: TObject);
    procedure dbgPurchaseOrdersKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSplit199Click(Sender: TObject);
    procedure edToVendorDblClick(Sender: TObject);
  private
    ascDesc, labelsFileName: string;
  public
    procedure DeleteErrorItemsFromPO(errorItems, po: string);
    procedure CreateAmazonShip(AmazonPo, po: string);
    procedure createAmazonPlan(po: String);
    function isSkuExists(TmpLst: TStringList; sku: String): Boolean;
    procedure printItemLabels(save: Boolean);

  end;

var
  fmPo: TfmPo;

implementation

uses DBUnit, EditVendorUnit, SendMailUnit, EditItemUnit, CreatePOLinesUnit;

{$R *.dfm}

procedure TfmPo.btnArchiveClick(Sender: TObject);
var
  htmlFilePath, po, amazonOrder: String;
begin
  with fmSendMail, DM do
  begin
    amazonOrder := cbAmazonPo.Items.Strings[cbAmazonPo.ItemIndex];
    if (Trim(amazonOrder) = 'ALL') then
    begin
      po := IntToStr(tbPoPo.Value);
    end
    else
    begin
      po := amazonOrder;
    end;
    tbMailArchive.Filter := 'doctype=' + QuotedStr('PO') + ' and orderno=' + QuotedStr(po) + ' and orderversion=1';
    tbMailArchive.Filtered := true;
    tbMailArchive.Active := true;
    if (tbMailArchiveorderno.Value <> po) then
      Exit;

    edSendTo.Text := tbMailArchivesentto.Value;
    edSubject.Text := tbMailArchivesubject.Value;
    edCC.Text := tbMailArchivecc.Value;
    mmNoteTo.Text := tbMailArchivenote.Value;
    htmlStr := TStringList.Create;
    htmlStr.Text := tbMailArchivebody.Value;
    attFileStr := TStringList.Create;
    attFileStr.Text := tbMailArchiveattached.Value;
    lbAttachedFile.Caption := tbMailArchiveattachedfilename.Value;
    attFileContent := tbMailArchiveattached.Value;
    attFile := GetEnvironmentVariable('TEMP') + '\' + lbAttachedFile.Caption;
    attFileStr.SaveToFile(attFile);
    orderNo := po;
    orderVer := 1;
    docType := 'PO';
    htmlFilePath := GetEnvironmentVariable('TEMP') + '\' + 'PO' + po + 'tmp.html';
    htmlStr.SaveToFile(htmlFilePath);
    WebBrowser1.Navigate(htmlFilePath);
    ShowModal;
    tbMailArchive.Filter := '';
    tbMailArchive.Filtered := false;
    btnSendMail.Enabled := true;
  end;
end;

procedure TfmPo.btnCreateAmazonPlanClick(Sender: TObject);
var
  po: string;
  i : integer;
begin
  // addActivity(DM.AlonDb, 'btnCreateAmazonPlanClick');
  po := DM.tbPoPo.AsString;
  addActivity(DM.AlonDb, 'TfmPurchaseOrders.checkPrepAndLabelOwner po=' + po);
  DM.checkPrepAndLabelOwner(po);
  DM.checkItemDimensions(po);
for i := 1 to 2 do
    begin
    sleep(1000);
    application.processmessages;
    end;
  createAmazonPlan(po);
  with DM do
  begin
    tbPo.Edit;
    tbPOSentDate.Value := DateTimeToSQLTimeStamp(Now);
    tbPo.Post;
  end;
end;

procedure TfmPo.btnCreateLinesFromExcelClick(Sender: TObject);
begin
  fmCreatePoLines.po := DM.tbPoPo.AsInteger;
  fmCreatePoLines.ShowModal;
  // if (fmCreatePoLines.ModalResult = mrOK) then
  btnRefreshClick(nil);
end;

function TfmPo.isSkuExists(TmpLst: TStringList; sku: String): Boolean;
var
  i: Integer;
  tmpSku: String;
begin
  Result := false;
  if (TmpLst.Count > 0) then
    for i := 0 to TmpLst.Count - 1 do
    begin
      tmpSku := Trim(ExtractDelimited(1, TmpLst[i], [#9]));
      if (sku = tmpSku) then
        Result := true;
    end;
end;

procedure TfmPo.createAmazonPlan(po: String);
var
  TmpLst: TStringList;
  Path, tab, javaRun, args, mess: String;
  fileName, tmpFilter: String;
  showVendor, tmpFiltered, bulkOrder: Boolean;
  unitsPerCase, cases, i, qtyByCase: Integer;
  sku, warehouse, amazonOrder, qty, labelprep, errItems: string;
  prepowner, labelowner,height, weight, item_length,width, errStr : string;
  vAddress, vCity, vCountry, vZip, vState,vPhone: String;
  qPOLines: TFDQuery;
  Delim: Char;
begin
  addActivity(DM.AlonDb, 'TfmPo.createAmazonPlan po=' + po);
  // bulkOrder := false;
  // if (WordCount(po, [',']) > 1) then
  // bulkOrder := true;

  showVendor := true;
  tab := #09;
  Delim := #9;
  Path := ExtractFilePath(ParamStr(0));
  TmpLst := TStringList.Create;
  qPOLines := TFDQuery.Create(nil);
  Screen.Cursor := crSQLWait;
  with DM do
    try
      bulkOrder := tbPobulkpo.Value;
      if (not bulkOrder) then
      begin
        tmpFilter := tbPo.Filter;
        tmpFiltered := tbPo.Filtered;
        tbPo.Filter := 'po=' + po;
        tbPo.Filtered := true;
        tbPo.Active := true;
        tbVendors.Active := true;
        tbVendors.Filter := 'vendorname=' + QuotedStr(tbPOVendor.AsString);
        tbVendors.Filtered := true;
        if (Trim(tbVendorsAddress.AsString) = '') then
        begin
          mess := 'Vendor''s address is missed' + #10;
        end
        else
          vAddress := Trim(tbVendorsAddress.AsString);
        if (Trim(tbVendorsCity.AsString) = '') then
        begin
          mess := mess + 'Vendor''s city is missed' + #10;
        end
        else
          vCity := Trim(tbVendorsCity.AsString);
        if (Trim(tbVendorsCountry.AsString) = '') or (Length(Trim(tbVendorsCountry.AsString)) > 2) then
        begin
          mess := mess + 'Vendor''s country is missed or wrong' + #10;
        end
        else
          vCountry := Trim(tbVendorsCountry.AsString);
        if (Trim(tbVendorsState.AsString) = '') then
        begin
          mess := mess + 'Vendor''s state is missed' + #10;
        end
        else
          vState := Trim(tbVendorsState.AsString);
        if (Trim(tbVendorsZip.AsString) = '') then
        begin
          mess := mess + 'Vendor''s ZIP is missed';
        end
        else
          vZip := Trim(tbVendorsZip.AsString);
          vPhone := Trim(tbVendorsphone.AsString);
        if (mess > '') then
        begin
          showMessage(mess);
          Exit;
        end;
        tbVendors.Filtered := false;
        tbPo.Filter := tmpFilter;
        tbPo.Filtered := tmpFiltered;
      end
      else
      begin
        // vAddress := '106 Prospect St.';
        // vCity := 'Paramus';
        // vCountry := 'US';
        // vZip := '07652';
        // vState := 'NJ';
        vAddress := tbSelfInfoaddress.Value;
        vCity := tbSelfInfocity.Value;
        vCountry := tbSelfInfocountry.Value;
        vZip := tbSelfInfozip.Value;
        vState := tbSelfInfostate.Value;
      end;
      showVendor := false;
      RunSql('update polines set whname=' + QuotedStr('') + ' where po in (' + po + ')');
      qPOLines.Connection := AlonDb;
      qPOLines.SQL.Add('select * from polines where po in (' + po + ') order by line');
      qPOLines.Active := true;
      qPOLines.First;
      TmpLst.Clear;
      while not qPOLines.Eof do
      begin
        if (not isSkuExists(TmpLst, qPOLines.FieldByName('SKU').AsString)) then
        begin
          unitsPerCase := DM.getCaseQty(qPOLines.FieldByName('SKU').AsString);
          if (unitsPerCase = 0) then
            unitsPerCase := 1;
          cases := qPOLines.FieldByName('Qty').AsInteger div unitsPerCase;
          qtyByCase := DM.CalcQtyByCase(qPOLines.FieldByName('Qty').AsInteger, unitsPerCase);
          prepowner := DM.getDetailsFromItems(qPOLines.FieldByName('SKU').AsString, 'prepowner');
          labelowner := DM.getDetailsFromItems(qPOLines.FieldByName('SKU').AsString, 'labelowner');
          height := DM.getDetailsFromItems(qPOLines.FieldByName('SKU').AsString, 'height');
          width := DM.getDetailsFromItems(qPOLines.FieldByName('SKU').AsString, 'width');
          item_length := DM.getDetailsFromItems(qPOLines.FieldByName('SKU').AsString, 'length');
          weight := DM.getDetailsFromItems(qPOLines.FieldByName('SKU').AsString, 'packweight');
          if (height = '') or (width = '') or (item_length = '') then
            errStr := errStr + qPOLines.FieldByName('SKU').AsString +',';
          TmpLst.Add(qPOLines.FieldByName('SKU').AsString + tab + IntToStr(unitsPerCase) + tab + IntToStr(cases) + tab +
            IntToStr(qtyByCase) + tab + prepowner + tab + labelowner
            + tab + height+ tab + width+ tab + item_length+ tab + weight);
        end;
        qPOLines.Next;
      end;

      if errStr > '' then
        begin
          errStr := 'No sizes in items : ' + errStr + #10+ 'Try to split one more time' + #10 ;
          showMessage(errStr);
          exit;
        end;

      if (not DirectoryExists(Path + 'PO\')) then
        CreateDir(Path + 'PO\');
      fileName := Path + 'PO\PO_ForAmazon_' + ReplaceStr(po, ',', '_') + '.txt';
      TmpLst.SaveToFile(fileName);

      // showMessage('Created file ' + fileName);
      javaRun := 'java -jar AmazonAinv.jar com.ainv.projects.Starter runModule=CreateInboundShipments ';
      args := 'adr1=' + ReplaceStr(vAddress, ' ', '@') + ' city=' + ReplaceStr(vCity, ' ', '@') + ' country=' +
        ReplaceStr(vCountry, ' ', '@') + ' action=plan' + ' state=' + vState + ' zip=' + vZip + ' labPrep=' +
        cbLabelPrep.Text +' phone=' + vPhone + ' logdir=' + ExtractFilePath(ParamStr(0)) + '\ fileName=' + fileName;
      if (FileExists(fileName + '.error')) then
        DeleteFile(PWideChar(fileName + '.error'));
      if (FileExists(fileName + '.answer')) then
        DeleteFile(PWideChar(fileName + '.answer'));

      // showMessage(args);
      ExeAndWait(javaRun + args);

      if (FileExists(fileName + '.error')) then
      begin
        TmpLst.LoadFromFile(fileName + '.error');
        sku := '';
        for i := 0 to TmpLst.Count - 1 do
        begin
          sku := sku + #13#10 + TmpLst[i];
        end;
        sku := ReplaceStr(sku, 'sku=', #13#10 + 'sku=');
        mess := sku + #13#10 + { #13#10 + 'Info about this error saved into :' + fileName + '.error' + }
          #13#10 + 'If you want to remove error items from this PO and set them inactive - click OK.';
        if (MessageBox(0, PWideChar(mess), 'Error items', MB_ICONWARNING or MB_OKCANCEL or MB_APPLMODAL) in [idOk]) then
        begin
          TmpLst.Clear;
          TmpLst.SetText(PWideChar(sku));
          errItems := '';
          for i := 0 to TmpLst.Count - 1 do
          begin
            if (Pos('sku=', TmpLst[i]) > 0) then
            begin
              mess := ExtractDelimited(1, TmpLst[i], [',']);
              mess := ExtractDelimited(2, mess, ['=']);
              if (errItems = '') then
                errItems := QuotedStr(mess)
              else
                errItems := errItems + ', ' + QuotedStr(mess);
            end;
          end;
          if (Trim(errItems) <> '') then
            DeleteErrorItemsFromPO(errItems, po);
        end;
        // ShowMessage(mess);
        Exit;
      end;

      if (FileExists(fileName + '.answer')) then
      begin
        TmpLst.LoadFromFile(fileName + '.answer');
        for i := 0 to TmpLst.Count - 1 do
        begin
          // PO, sku, warehouse, amazonOrder, qty
          amazonOrder := Trim(ExtractDelimited(1, TmpLst[i], [Delim]));
          warehouse := Trim(ExtractDelimited(2, TmpLst[i], [Delim]));
          sku := Trim(ExtractDelimited(3, TmpLst[i], [Delim]));
          qty := Trim(ExtractDelimited(4, TmpLst[i], [Delim]));
          labelprep := Trim(ExtractDelimited(5, TmpLst[i], [Delim]));
          DM.InsertOrUpdatePOLines(po, sku, warehouse, amazonOrder, qty, labelprep)
        end;
      end;
      if (FileExists(fileName + '.wh')) then
      begin
        TmpLst.LoadFromFile(fileName + '.wh');
        for i := 0 to TmpLst.Count - 1 do
        begin
          // warehouse, name, Line2, line3
          warehouse := Trim(ExtractDelimited(1, TmpLst[i], [Delim]));
          sku := Trim(ExtractDelimited(2, TmpLst[i], [Delim]));
          amazonOrder := Trim(ExtractDelimited(3, TmpLst[i], [Delim]));
          qty := Trim(ExtractDelimited(4, TmpLst[i], [Delim]));
          DM.InsertWarehouse(warehouse, sku, amazonOrder, qty);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      TmpLst.Free;
      btnRefreshClick(nil);
      cbAmazonPo.Items := DM.fillCombo('polines', 'amazonpo', ' where po =' + po + ' group by amazonpo', true);
      cbAmazonPo.ItemIndex := 0;
      if (showVendor) then
      begin
        fmEditVendor.ShowModal;
      end;
      qPOLines.Free;
      DM.CheckPoLinesDuplicates;
    end;
end;

procedure TfmPo.btnCreateShipClick(Sender: TObject);
var
  TmpLst: TStringList;
  i: Integer;
  args, po, javaRun, fileName, sku, Path: string;
  amazonOrder, warehouse, qty, labelprep: string;
  Delim: Char;
begin
  try
    Path := ExtractFilePath(ParamStr(0));
    TmpLst := TStringList.Create;
    Screen.Cursor := crSQLWait;
    po := DM.tbPoPo.AsString;
    Delim := #9;
    fileName := Path + 'PO\PO_ForAmazon_' + ReplaceStr(po, ',', '_') + '.txt';
    if (not FileExists(fileName + '.confirm')) then
    begin
      showMessage('File for shipment confirm not exists. '+#10#13+' FileName = ' + fileName + '.confirm');
      Exit;
    end;
    javaRun := 'java -jar AmazonAinv.jar com.ainv.projects.Starter runModule=CreateInboundShipments ';
    args := ' action=confirm' + ' logdir=' + ExtractFilePath(ParamStr(0)) + '\ fileName=' + fileName + '.confirm';
    // showMessage(args);
    ExeAndWait(javaRun + args);

  finally
    Screen.Cursor := crDefault;
    TmpLst.Free;
    btnRefreshClick(nil);
    cbAmazonPo.Items := DM.fillCombo('polines', 'amazonpo', ' where po =' + po + ' group by amazonpo', true);
    cbAmazonPo.ItemIndex := 0;
  end;
end;

procedure TfmPo.btnPrintItemLabelsClick(Sender: TObject);
begin
  printItemLabels(false);
end;

procedure TfmPo.printItemLabels(save: Boolean);
var
  Path, fileName: String;
begin
  Path := ExtractFilePath(ParamStr(0));
  if (not DirectoryExists(Path + 'PO\')) then
    CreateDir(Path + 'PO\');
  with DM do
  begin
    qItemLabels.Active := false;
    qItemLabels.SQL.Clear;
    qItemLabels.SQL.Add('select a.sku,a.fnsku,a.title , generate_series(1,qty) from polines p, ai_items a ');
    qItemLabels.SQL.Add('where po=:parPo and a.sku=p.sku ');
    if (UpperCase(cbAmazonPo.Text) <> 'ALL') then
    begin
      qItemLabels.SQL.Add(' and amazonpo=:parAmazonPo');
      qItemLabels.ParamByName('parAmazonPo').Value := cbAmazonPo.Text;
      fileName := tbPoPo.AsString + '_' + cbAmazonPo.Text + '_labels.pdf';
    end
    else
      fileName := 'PO\' + tbPoPo.AsString + '_labels.pdf';
    qItemLabels.SQL.Add(' order by p.line');
    fileName := Path + fileName;
    qItemLabels.ParamByName('parPo').Value := tbPoPo.Value;
    qItemLabels.Active := true;
    frxPDFExport1.fileName := fileName;
    frxPDFExport1.Background := true;
    frxPDFExport1.ShowDialog := false;
    if (save) then
    begin
      labelsFileName := fileName;
      frxPrintItemLabels.PrepareReport();
      frxPrintItemLabels.Export(frxPDFExport1);
    end
    else
      frxPrintItemLabels.ShowReport();
  end;
end;

procedure TfmPo.CreateAmazonShip(AmazonPo, po: string);
var
  TmpLst: TStringList;
  tmpFilter: String;
  tmpFiltered, bulkOrder: Boolean;
  fileName, Path, tab, javaRun, args, needCase: string;
  unitsPerCase, cases, i: Integer;
  sku, amazonOrder: string;
  vAddress, vCity, vCountry, vZip, vState: String;
  qPOLines: TFDQuery;
begin
  addActivity(DM.AlonDb, 'CreateAmazonShip po=' + po + ' amazonPo = ' + AmazonPo);
  tab := #09;
  Path := ExtractFilePath(ParamStr(0));
  // bulkOrder := false;
  // if (WordCount(po, [',']) > 1) then
  // bulkOrder := true;

  qPOLines := TFDQuery.Create(nil);
  TmpLst := TStringList.Create;
  with DM do
    try
      Screen.Cursor := crSQLWait;
      bulkOrder := tbPobulkpo.Value;
      if (not bulkOrder) then
      begin
        tmpFilter := tbPo.Filter;
        tmpFiltered := tbPo.Filtered;
        tbPo.Filter := 'po=' + po;
        tbPo.Filtered := true;
        tbPo.Active := true;
        tbVendors.Active := true;
        tbVendors.Filter := 'vendorname=' + QuotedStr(tbPOVendor.AsString);
        tbVendors.Filtered := true;
        vAddress := Trim(tbVendorsAddress.AsString);
        vCity := Trim(tbVendorsCity.AsString);
        vCountry := Trim(tbVendorsCountry.AsString);
        vState := Trim(tbVendorsState.AsString);
        vZip := Trim(tbVendorsZip.AsString);
        tbVendors.Filtered := false;
        tbPo.Filter := tmpFilter;
        tbPo.Filtered := tmpFiltered;
      end
      else
      begin
        vAddress := tbSelfInfoaddress.Value;
        vCity := tbSelfInfocity.Value;
        vCountry := tbSelfInfocountry.Value;
        vZip := tbSelfInfozip.Value;
        vState := tbSelfInfostate.Value;
      end;
      qPOLines.Connection := AlonDb;
      qPOLines.SQL.Add('select * from polines where po in (' + po + ') and amazonpo = ' + QuotedStr(AmazonPo) +
        ' order by line');
      qPOLines.Active := true;
      qPOLines.First;
      while not qPOLines.Eof do
      begin
        if (not isSkuExists(TmpLst, qPOLines.FieldByName('SKU').AsString)) then
        begin
          unitsPerCase := DM.getCaseQty(qPOLines.FieldByName('SKU').AsString);
          if (unitsPerCase = 0) then
            unitsPerCase := 1;
          if (DM.getNeedCase(qPOLines.FieldByName('SKU').AsString)) then
            needCase := '1'
          else
            needCase := '0';
          cases := qPOLines.FieldByName('Qty').AsInteger div unitsPerCase;
          TmpLst.Add(qPOLines.FieldByName('SKU').AsString + tab + IntToStr(unitsPerCase) + tab + IntToStr(cases) + tab +
            qPOLines.FieldByName('Qty').AsString + tab + needCase);
        end;
        qPOLines.Next;
      end;
      if (not DirectoryExists(Path + 'PO\')) then
        CreateDir(Path + 'PO\');
      fileName := Path + 'PO\Ship_' + ReplaceStr(po, ',', '_') + '_' + AmazonPo + '.txt';
      TmpLst.SaveToFile(fileName);
      javaRun := 'java -jar AmazonAinv.jar com.ainv.projects.Starter runModule=CreateInboundShipments ';
      args := 'adr1=' + ReplaceStr(vAddress, ' ', '@') + ' city=' + ReplaceStr(vCity, ' ', '@') + ' dfc=' +
        qPOLines.FieldByName('WhName').AsString + ' country=' + vCountry + ' action=ship' + ' shipId=' + AmazonPo +
        ' state=' + vState + ' zip=' + vZip + ' labPrep=' + cbLabelPrep.Text + ' logdir=' + ExtractFilePath(ParamStr(0))
        + '\\ fileName=' + fileName;
      if (FileExists(fileName + '.error')) then
        DeleteFile(PWideChar(fileName + '.error'));
      if (FileExists(fileName + '.answer')) then
        DeleteFile(PWideChar(fileName + '.answer'));

      ExeAndWait(javaRun + args);

      if (FileExists(fileName + '.error')) then
      begin
        TmpLst.LoadFromFile(fileName + '.error');
        sku := '';
        for i := 0 to TmpLst.Count - 1 do
        begin
          sku := sku + #13#10 + TmpLst[i];
        end;
        sku := ReplaceStr(sku, 'sku=', #13#10 + 'sku=');
        showMessage(sku);
        Exit;
      end;
      if (FileExists(fileName + '.answer')) then
      begin
        TmpLst.LoadFromFile(fileName + '.answer');
        amazonOrder := TmpLst[0];
        qPOLines.First;
        while not qPOLines.Eof do
        begin
          DM.RunSql('update polines set shipid=' + QuotedStr(amazonOrder) + ', amazonpo=' + QuotedStr(amazonOrder) +
            ' where po in (' + po + ') and line=' + qPOLines.FieldByName('Line').AsString);
          qPOLines.Next;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      TmpLst.Free;
      qPOLines.Free;
    end;
end;

procedure TfmPo.dbgPurchaseOrdersDblClick(Sender: TObject);
var
  FieldName, fieldValueStr, Filter: String;
  Filtered: Boolean;
begin
  FieldName := UpperCase(TjvDBGrid(Sender).Columns.Items[TjvDBGrid(Sender).col - 1].FieldName);
  if ((FieldName = 'SKU') or (FieldName = 'MYSKU')) then
  begin
    fieldValueStr := TjvDBGrid(Sender).Columns.Items[TjvDBGrid(Sender).col - 1].Field.AsString;
    if (fieldValueStr > '') then
    begin
      DM.dsItems.DataSet := DM.tbSearchItems;
      DM.dsItems.DataSet.Filter := 'sku=' + QuotedStr(fieldValueStr);
      DM.dsItems.DataSet.Filtered := true;
      DM.dsItems.DataSet.Active := true;
      fmEditItem.ShowModal;
      DM.dsItems.DataSet.Filtered := false;
      DM.dsItems.DataSet := DM.tbItems;
    end;
    DM.RefreshQuery(DM.tbPOLines);
  end;

end;

procedure TfmPo.dbgPurchaseOrdersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
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

procedure TfmPo.dbgPurchaseOrdersGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (Field.FieldName = 'profitDol') then
    if (Field.Value <= 0) then
    begin
      AFont.Color := clRed;
    end
    else
    begin
      AFont.Color := clNavy;
    end;
  if (Field.FieldName = 'profitPer') then
    if (Field.Value <= 0) then
    begin
      AFont.Color := clRed;
    end
    else
    begin
      AFont.Color := clOlive;
    end;
end;

procedure TfmPo.dbgPurchaseOrdersKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Key := VK_TAB;

end;

procedure TfmPo.dbgPurchaseOrdersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
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

procedure TfmPo.sendMailPOToVendor(Sender: TObject);
var
  TmpLst, xlsLst, templateHtml: TStringList;
  fileName, Path, vendormail, vendorname, po, tab, street, sku: string;
  address1, city, State, zip, shipToAddress, xlsFileName, attached: string;
  tempHtml, htmlToLoop, itemsLine, tmpItemsLine, htmlAfterLoop, amazonOrder, wh: string;
  ind1, ind2, caseQty, qty, cases: Integer;
  total: Double;
  bulk: Boolean;
begin
  po := DM.tbPoPo.AsString;
  bulk := DM.tbPobulkpo.Value;
  // DM.RenumberPurchaseOrderLines(po);
  btnRefreshClick(nil);
  tab := #09;
  Path := ExtractFilePath(ParamStr(0));
  DM.tbPo.Refresh;
  if (DM.tbPOVendor.AsString = '') then
  begin
    MessageDlg('Please define vendor!', mtWarning, [mbOK], 0);
    Exit;
  end;
  amazonOrder := cbAmazonPo.Items.Strings[cbAmazonPo.ItemIndex]; // DM.tbPOLinesamazonpo.AsString;
  if (Trim(amazonOrder) = 'ALL') then
  begin
    amazonOrder := po;
    wh := 'LilGift';
    DM.tbPOLines.Filtered := false;
    DM.tbPOLines.Filter := 'shipid=' + QuotedStr('') + 'or shipid is null';
    DM.tbPOLines.Filtered := true;
  end
  else
  begin
    wh := DM.tbPOLinesWhName.AsString;
    // if ((DM.tbPOLineslabelprep.AsString = 'SELLER_LABEL') or (DM.tbPOLineslabelprep.AsString = '')) then
    // wh := 'LilGift';
  end;
  addActivity(DM.AlonDb, 'Save and send PO# ' + po);
  if (DM.tbPOLines.RecordCount < 1) then
  begin
    MessageDlg('Not found items to send to vendor', mtWarning, [mbOK], 0);
    addActivity(DM.AlonDb, 'Not found items to send PO# ' + po);
    DM.tbPOLines.Filter := '';
    DM.tbPOLines.Filtered := true;
    // Close;
    Exit;
  end;

  DM.tbWarehouses.Filter := 'whname=' + QuotedStr(wh);
  DM.tbWarehouses.Filtered := true;
  DM.tbWarehouses.Active := true;

  address1 := DM.tbWarehousesline1.AsString;
  city := DM.tbWarehousesline2.AsString;
  State := DM.tbWarehousesline3.AsString;
  zip := ExtractDelimited(3, DM.tbWarehousesline3.AsString, [',']);
  DM.RunSql('update po set totalprice=' + FloatToStr(DM.getTotalPO(StrToInt(po))) + ' where po=' + po);
  DM.RefreshQuery(DM.tbPo);
  if (not DirectoryExists(Path + 'PO\')) then
    CreateDir(Path + 'PO\');
  fileName := Path + 'PO\PurchaseOrder_LilGift_' + amazonOrder + '.html';
  xlsFileName := Path + 'PO\PurchaseOrder_LilGift_' + amazonOrder + '.xls';
  attached := 'PurchaseOrder_LilGift_' + amazonOrder + '.xls';
  templateHtml := TStringList.Create;
  TmpLst := TStringList.Create;
  xlsLst := TStringList.Create;
  templateHtml.LoadFromFile('POTemplate.html');
  tempHtml := templateHtml.Text;
  ind1 := 1;
  ind2 := Pos('#foreach', tempHtml) - 5;
  htmlToLoop := Copy(tempHtml, ind1, ind2);
  ind1 := Pos('#foreach', tempHtml) + 12;
  ind2 := (Pos('#foreach-end', tempHtml) - (ind1 + 6));
  itemsLine := Copy(tempHtml, ind1, ind2);
  ind1 := Pos('foreach-end', tempHtml) + 15;
  ind2 := (Length(tempHtml) - (ind1));
  htmlAfterLoop := Copy(tempHtml, ind1, ind2);

  DM.tbSelfInfo.Active := true;
  DM.tbSelfInfo.Filter := 'type=' + QuotedStr('1');
  DM.tbSelfInfo.Filtered := true;
  with DM do
    try
      // xlsLst.Add('ORDER' + tab + 'LNAME' + tab + 'PHONE' + tab + 'STREET' + tab + 'CITY' + tab + 'STATE' + tab + 'ZIP' + tab + 'ITEM NO' +
      // tab + 'DESCRIPTION' + tab + 'QTY' + tab + 'DATE' + tab + 'BAR CODE NEEDED' + tab + 'SHIP METHOD');
      if (bulk) then
      begin
        xlsLst.Add('Shipment ID' + tab + amazonOrder);
        xlsLst.Add('');
        xlsLst.Add('Merchant SKU' + tab + 'Title' + tab + 'ASIN' + tab + 'FNSKU' + tab + 'Units per Case' + tab +
          'Number of Cases' + tab + 'Shipped');
      end;
      tbVendors.Active := true;
      tbVendors.Filter := 'vendorname=' + QuotedStr(tbPOVendor.AsString);
      tbVendors.Filtered := true;

      shipToAddress := ReplaceStr(address1 + '<br>' + city + '<br>' + State, #13, '<br>');
      htmlToLoop := ReplaceStr(htmlToLoop, '$shipTo', shipToAddress);
      vendormail := tbVendorsEmail.AsString;
      vendorname := tbVendorsfullname.AsString;
      city := tbVendorsCity.AsString;
      State := tbVendorsState.AsString;
      zip := tbVendorsZip.AsString;
      street := tbVendorsAddress.AsString;
      address1 := street + '<br>' + city + ', ' + State + ' ' + zip;
      htmlToLoop := ReplaceStr(htmlToLoop, '$vendorTeur', vendorname + '<br>' + address1);
      htmlToLoop := ReplaceStr(htmlToLoop, '$date', DateToStr(Now));
      htmlToLoop := ReplaceStr(htmlToLoop, '$orderno', amazonOrder);

      htmlToLoop := ReplaceStr(htmlToLoop, '$terms', tbVendorsterms.AsString);
      htmlToLoop := ReplaceStr(htmlToLoop, '$shipDate', DateToStr(tbPoorderdate.AsDateTime));
      htmlToLoop := ReplaceStr(htmlToLoop, '$shipVia', tbVendorsshipvia.AsString);
      htmlToLoop := ReplaceStr(htmlToLoop, '$fob', tbVendorsfob.AsString);
      TmpLst.Add(htmlToLoop);
      tbPOLines.First;

      total := 0;
      while not tbPOLines.Eof do
      begin
        sku := tbPOLinesSKU.AsString;
        tmpItemsLine := itemsLine;
        tmpItemsLine := ReplaceStr(tmpItemsLine, '$item', getffSku(sku));
        tmpItemsLine := ReplaceStr(tmpItemsLine, '$desc', GetSkuDesc(sku));
        tmpItemsLine := ReplaceStr(tmpItemsLine, '$qty', tbPOLinesQty.AsString);
        tmpItemsLine := ReplaceStr(tmpItemsLine, '$rate', '$' + tbPoLinesprice.AsString);
        tmpItemsLine := ReplaceStr(tmpItemsLine, '$amount',
          '$' + FloatToStr(tbPOLinesQty.AsFloat * tbPoLinesprice.AsFloat));
        total := total + (tbPOLinesQty.AsFloat * tbPoLinesprice.AsFloat);
        if (bulk) then
        begin
          qty := tbPOLinesQty.AsInteger;
          caseQty := tbPOLinescaseQty.AsInteger;
          cases := qty div caseQty;
          xlsLst.Add(getffSku(sku) + tab + GetSkuDesc(sku) + tab + retStrFieldValue(DM.AlonDb,
            'select asin from ai_items where sku=' + QuotedStr(sku)) + tab + retStrFieldValue(DM.AlonDb,
            'select fnsku from ai_items where sku=' + QuotedStr(sku)) + tab + retStrFieldValue(DM.AlonDb,
            'select caseqty from ai_items where sku=' + QuotedStr(sku)) + tab + IntToStr(cases) + tab + IntToStr(qty));
        end
        else
        begin
          xlsLst.Add(amazonOrder + tab + po + tab + tbVendorsshipvia.AsString + tab + 'BillThirdParty' + tab +
            'BillThirdParty' + tab + '' + tab + '' + tab + '' + tab + '' + tab + '' + vendorname + tab + vendorname +
            tab + street + tab + '' + tab + city + tab + State + tab + zip + tab + tbVendorsCountry.AsString + tab + ''
            + tab + '' + tab + '' + tab + '' + tab + '' + tab + '' + tab + getffSku(tbPOLinesSKU.AsString) + tab +
            tbPOLinesQty.AsString + tab + '' + tab + '' + tab + '' + tab + '' + tab + '' + tab);
        end;
        TmpLst.Add(tmpItemsLine);
        tbPOLines.Next;
      end;
      if (cbAttLabels.State = cbChecked) then
      begin
        printItemLabels(true);
      end
      else
        labelsFileName := '';
      tbVendors.Filtered := false;
      htmlAfterLoop := ReplaceStr(htmlAfterLoop, '$total', '$' + FloatToStr(total));
      TmpLst.Add(htmlAfterLoop);
      xlsLst.SaveToFile(xlsFileName);
      TmpLst.SaveToFile(fileName);
      with fmSendMail do
      begin
        WebBrowser1.Navigate(fileName);
        attFile := xlsFileName;
        attFileContent := xlsLst.Text;
        pdfFilePath := labelsFileName;
        docType := 'PO';
        orderNo := amazonOrder;
        orderVer := 1;
        if (DelphiLoaded) then
          vendormail := 'shim@miraduga.com';
        // edCC.Text := 'Alon G <alon@lilgift.com>';
        // edSendTo.Text := vendorname + '<' + vendormail + '>';
        edSendTo.Text := vendormail;
        edSubject.Text := 'Purchase Order #' + amazonOrder;
        mmNoteTo.Text := '';
        lbAttachedFile.Caption := attached;
        htmlStr := TmpLst;
        ShowModal;
        if (ModalResult = mrOK) then
        begin
          tbPo.Edit;
          tbPOSentDate.Value := DateTimeToSQLTimeStamp(Now);
          tbPo.Post;
        end;
      end;
    finally
      TmpLst.Free;
    end;
  DM.tbWarehouses.Filter := '';
  DM.tbWarehouses.Filtered := false;
  Close;
end;

procedure TfmPo.btnSplit199Click(Sender: TObject);
var
  mess: String;
begin
  mess := DM.splitPo199(DM.tbPoPo.AsString);
  btnRefreshClick(nil);
  showMessage(mess);
end;

procedure TfmPo.cbAmazonPoSelect(Sender: TObject);
var
  AmazonPo, po: string;
  selectedCount: Integer;
begin
  btnArchive.Enabled := false;
  AmazonPo := cbAmazonPo.Items.Strings[cbAmazonPo.ItemIndex];
  po := DM.tbPOLinespo.AsString;
  with DM.tbPOLines do
  begin
    if (Trim(AmazonPo) = 'ALL') then
    begin
      Filtered := false;
      selectedCount := retIntFieldValue(DM.AlonDb, 'select count(*) from polines where po=' + po);
      lbSelectedCount.Caption := IntToStr(selectedCount);
      lbSelectedCount.Font.Color := clGreen;
      if (retStrFieldValue(DM.AlonDb, 'select orderno from mail_archive where orderno=' +
        QuotedStr(DM.tbPOLinespo.AsString)) = DM.tbPOLinespo.AsString) then
      begin
        btnArchive.Enabled := true;
      end;

    end
    else
    begin
      Filter := 'amazonpo=' + QuotedStr(AmazonPo);
      Filtered := true;
      selectedCount := retIntFieldValue(DM.AlonDb, 'select count(*) from polines where po=' + po + ' and amazonpo=' +
        QuotedStr(AmazonPo));
      lbSelectedCount.Caption := IntToStr(selectedCount);
      lbSelectedCount.Font.Color := clGreen;
      if (retStrFieldValue(DM.AlonDb, 'select orderno from mail_archive where orderno=' + QuotedStr(AmazonPo))
        = AmazonPo) then
      begin
        btnArchive.Enabled := true;
      end;
    end;
  end;
end;

procedure TfmPo.FormHide(Sender: TObject);
begin
  DM.tbPOLines.Filtered := false;
end;

procedure TfmPo.FormShow(Sender: TObject);
var
  AmazonPo, po: string;
  poCount: Integer;
begin
  btnArchive.Enabled := false;
  DM.tbSearchItems.Active := true;
  DM.tbSearchItems.Filtered := false;
  po := DM.tbPoPo.AsString;
  if (DM.DeleteDuplicatePOLines(po)) then
    btnRefreshClick(nil);
  DM.tbPOLines.Refresh;
  DM.RunSql('update po set totalprice=' + FloatToStr(DM.getTotalPO(StrToInt(po))) + ' where po=' + po);
  dbgPurchaseOrders.DataSource := DM.dsPOLines;
  poCount := retIntFieldValue(DM.AlonDb, 'select count(*) from polines where po=' + po);
  if (poCount > 200) then
  begin
    lbLinesCount.Caption := IntToStr(poCount);
    lbLinesCount.Font.Color := clRed;
    lbSelectedCount.Caption := IntToStr(poCount);
    lbSelectedCount.Font.Color := clRed;
    btnSplit199.Enabled := true;
    btnSplit199.Caption := 'Split PO';
  end
  else
  begin
    lbLinesCount.Caption := IntToStr(poCount);
    lbSelectedCount.Caption := IntToStr(poCount);
    lbLinesCount.Font.Color := clBlack;
    lbSelectedCount.Font.Color := clGreen;
    btnSplit199.Enabled := false;
    btnSplit199.Caption := '';
  end;
  AmazonPo := cbAmazonPo.Items.Strings[cbAmazonPo.ItemIndex];
  cbLabelPrep.Text := 'SELLER_LABEL';
  if (DM.tbPobulkpo.Value) then
  begin
    edToVendor.DataField := 'bulkorders';
    edToVendor.Font.Color := clWindowText;
  end
  else
  begin
    edToVendor.DataField := 'VendorName';
    edToVendor.Font.Color := clBlue;
    // cbLabelPrep.Text := 'AMAZON_LABEL_PREFERRED';
  end;

  cbAmazonPo.Items := DM.fillCombo('polines', 'amazonpo', ' where po =' + po + ' group by amazonpo', true);
  cbAmazonPo.ItemIndex := 0;
  if (Trim(AmazonPo) = 'ALL') or (Trim(AmazonPo) = '') then
  begin
    if (retStrFieldValue(DM.AlonDb, 'select orderno from mail_archive where orderno=' + QuotedStr(po))
      = DM.tbPOLinespo.AsString) then
    begin
      btnArchive.Enabled := true;
    end;

  end
  else
  begin
    if (retStrFieldValue(DM.AlonDb, 'select orderno from mail_archive where orderno=' + QuotedStr(AmazonPo)) = AmazonPo)
    then
    begin
      btnArchive.Enabled := true;
    end;
  end;
  cbAttLabels.State := cbUnchecked;
  labelsFileName := '';
  DM.RefreshQuery(DM.tbPo);
end;

procedure TfmPo.Renumberlines1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'Renumberlines1Click');
  btnRefreshClick(nil);
end;

procedure TfmPo.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmPo.Deleteline1Click(Sender: TObject);
begin
  dbgPurchaseOrders.DataSource.DataSet.Delete;
end;

procedure TfmPo.edToVendorDblClick(Sender: TObject);
begin
  if (edToVendor.Field.Value > '') and (edToVendor.DataField = 'VendorName') then
  begin
    DM.tbVendors.Active := true;
    DM.tbVendors.Filter := 'fullname=' + QuotedStr(edToVendor.Field.AsString);
    DM.tbVendors.Filtered := true;
    fmEditVendor.ShowModal;
    DM.tbVendors.Filtered := false;
  end;
end;

procedure TfmPo.btnRefreshClick(Sender: TObject);
var
  po: string;
  poCount, selCount: Integer;
begin
  po := dbgPurchaseOrders.DataSource.DataSet.FieldByName('PO').AsString;
  if (po > '') then
  begin
    DM.RenumberPurchaseOrderLines(po);
    DM.RunSql('update po set totalprice=' + FloatToStr(DM.getTotalPO(StrToInt(po))) + ' where po=' + po);
    poCount := retIntFieldValue(DM.AlonDb, 'select count(*) from polines where po=' + po);
    if (poCount > 200) then
    begin
      lbLinesCount.Caption := IntToStr(poCount);
      lbLinesCount.Font.Color := clRed;
      btnSplit199.Enabled := true;
      btnSplit199.Caption := 'Split PO';
    end
    else
    begin
      lbLinesCount.Caption := IntToStr(poCount);
      lbLinesCount.Font.Color := clBlack;
      btnSplit199.Enabled := false;
      btnSplit199.Caption := '';
    end;
  end;
  DM.RefreshQuery(DM.tbPo);
  DM.RefreshQuery(DM.tbPOLines);
end;

procedure TfmPo.DeleteErrorItemsFromPO(errorItems, po: string);
begin
  addActivity(DM.AlonDb, 'DeleteErrorItemsFromPO');
  // ShowMessage(errorItems);
  // po := dbgPurchaseOrders.DataSource.DataSet.FieldByName('PO').AsString;
  DM.RunSql('delete from polines where po in(' + po + ') and sku in (' + errorItems + ')');
  DM.RunSql('update ai_items set lastorderdate=null, isactive=false where sku in (' + errorItems + ')');
  if (WordCount(po, [',']) = 1) then
    DM.RenumberPurchaseOrderLines(po);
  btnRefreshClick(nil);
  // DM.RunSql('update po set totalprice=' + FloatToStr(DM.getTotalPO(StrToInt(po))) + ' where po=' + po);
  DM.tbPOLines.Refresh;
end;

end.
