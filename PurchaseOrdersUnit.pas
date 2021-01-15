unit PurchaseOrdersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, System.UITypes,
  Dialogs, Menus, PMDBNavigator, Grids, DBGrids, ExtCtrls, StdCtrls, MyFunctions,
  JvDBControls, DB, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, SqlTimSt, JvExDBGrids, JvDBGrid;

type
  TfmPurchaseOrders = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    PMDBNavigator1: TPMDBNavigator;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    dbgPurchaseOrders: TjvDBGrid;
    N1: TMenuItem;
    ReceivePO1: TMenuItem;
    DeletePO1: TMenuItem;
    Panel1: TPanel;
    cbVendors: TComboBox;
    Label12: TLabel;
    ImageList1: TImageList;
    btnCreateBulkPO: TBitBtn;
    edSearch: TEdit;
    Label1: TLabel;
    ReceivewholePO1: TMenuItem;
    ReceiveselectedPO1: TMenuItem;
    btnCreateEmptyPO: TBitBtn;
    procedure dbgPurchaseOrdersDblClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ReceivePO1Click(Sender: TObject);
    procedure DeletePO1Click(Sender: TObject);
    procedure cbVendorsSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPurchaseOrdersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      var SortMarker: TSortMarker; IsDown: Boolean);
    procedure dbgPurchaseOrdersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure dbgPurchaseOrdersCellClick(Column: TColumn);
    procedure dbgPurchaseOrdersDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnCreateBulkPOClick(Sender: TObject);
    procedure edSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure buildFilter();
    procedure ReceivewholePO1Click(Sender: TObject);
    procedure ReceiveselectedPO1Click(Sender: TObject);
    procedure btnCreateEmptyPOClick(Sender: TObject);
  private
    ascDesc: string;
  public
    vendFilter, skuFilter: String;
  end;

var
  fmPurchaseOrders: TfmPurchaseOrders;

implementation

uses DBUnit, EditPoUnit, EditReceivePoUnit;

{$R *.dfm}

procedure TfmPurchaseOrders.btnCreateBulkPOClick(Sender: TObject);
var
  newPo, po, poBulk, mess: string;
  i, line: Integer;
  poList: TStringList;
  qPOLines: TFDQuery;
begin
  DM.checkQtyOrdByCaseQty();
  qPOLines := TFDQuery.Create(nil);
  poList := TStringList.Create;
  try
    poList := DM.getAddedPo;
    if (poList.Count = 0) then
    begin
      if (MessageDlg('Do you want to create a new empty bulk PO?', mtConfirmation, [mbOK, mbNo], 0) = mrNo) then
        exit;
      poList.Add('-1');
    end;
    for i := 0 to poList.Count - 1 do
    begin
      if (i = 0) then
        poBulk := poList[i]
      else
        poBulk := poBulk + ',' + poList[i];
    end;
    line := retIntFieldValue(DM.AlonDb, 'select count(*) from polines where po in (' + poBulk + ')');
    if (line > 200) then
    begin
      if (MessageDlg('Lines count of the choosed PO-s is ' + IntToStr(line) + #10 +
        'Amazon inbounds shippings allows to create shippings no more than 200 lines' + #10 +
        'Do you want anyway include these lines to one bulk PO?', mtConfirmation, [mbOK, mbNo], 0) = mrNo) then
        exit;
    end;
    with DM do
    begin
      line := 0;
      qPOLines.Connection := AlonDb;
      newPo := getSqlResult('select (max(po) + 1) from po');
      mess := RunSql('insert into po (po,orderdate,bulkpo,bulkorders,vendor) values (' + newPo + ',' +
        QuotedStr(FormatDateTime('mm/dd/yyyy tt', now)) + ', true,' + QuotedStr('Bulk order ' + poBulk) + ',' +
        QuotedStr('BULK') + ')');
      if (mess = '') then
      begin
        for i := 0 to poList.Count - 1 do
        begin
          po := poList[i];
          qPOLines.SQL.Clear;
          qPOLines.SQL.Add('select * from polines where po in (' + po + ') order by line');
          qPOLines.Active := true;
          qPOLines.First;
          while not qPOLines.Eof do
          begin
            Inc(line);
            RunSql('insert into polines (po,line,sku,price,amazonpo,whname,qty,labelprep) values (' + newPo + ',' +
              IntToStr(line) + ',' + QuotedStr(qPOLines.FieldByName('sku').AsString) + ',' +
              qPOLines.FieldByName('price').AsString + ',' + QuotedStr('') + ',' + QuotedStr('') + ',' +
              qPOLines.FieldByName('qty').AsString + ',' + QuotedStr('') + ')');
            qPOLines.Next;
          end;
        end;
        ShowMessage('Created a new bulk order #' + newPo);
      end
      else
      begin
        ShowMessage('Bulk PO did not created ' + #10 + mess);
      end;
      RunSql('update po set added = false');
      tbPo.Active := false;
      tbPo.Filter := '';
      tbPo.Filtered := false;
      tbPo.Active := true;
    end;
    dbgPurchaseOrders.SetFocus;
    PressKey(VK_RIGHT);
    // end
    // else
    // ShowMessage('Please select Purchase orders');
  finally
    poList.FreeInstance;
    qPOLines.Free;
  end;
end;

procedure TfmPurchaseOrders.btnCreateEmptyPOClick(Sender: TObject);
var
  vendor: string;
  po: Integer;
begin
  vendor := cbVendors.Items.Strings[cbVendors.ItemIndex];
  try
    with DM do
    begin
      po := StrToInt(getSqlResult('select (max(po) + 1) from po'));
      tbPo.Active := true;
      tbPo.Insert;
      tbPopo.Value := po;
      tbPovendor.Value := vendor;
      tbPoorderdate.Value := DateTimeToSQLTimeStamp(now);
      tbPo.Post;
    end;

    dbgPurchaseOrders.SetFocus;
    PressKey(VK_RIGHT);
  finally
  end;
end;

procedure TfmPurchaseOrders.cbVendorsSelect(Sender: TObject);
var
  vendor: string;
begin
  vendor := cbVendors.Items.Strings[cbVendors.ItemIndex];
  if (Trim(vendor) = 'ALL') then
  begin
    vendFilter := '';
    btnCreateEmptyPO.Enabled := false;
    btnCreateEmptyPO.Caption := 'Create empty order <Choose vendor>';
  end
  else
  begin
    vendFilter := 'vendor=' + QuotedStr(vendor);
    if (Trim(vendor) = '') then
    begin
      btnCreateEmptyPO.Enabled := false;
      btnCreateEmptyPO.Caption := 'Create empty order <Choose vendor>';
    end
    else
    begin
      btnCreateEmptyPO.Enabled := true;
      btnCreateEmptyPO.Caption := 'Create empty order for ' + Trim(vendor);
    end;
  end;
  buildFilter();

end;

procedure TfmPurchaseOrders.buildFilter();
var
  Filter: String;
begin
  Filter := '';
  if ((vendFilter <> '') and (skuFilter <> '')) then
    Filter := vendFilter + 'and (' + skuFilter + ')'
  else if ((vendFilter = '') and (skuFilter <> '')) then
    Filter := skuFilter
  else if ((vendFilter <> '') and (skuFilter = '')) then
    Filter := vendFilter;
  DM.tbPo.Filter := Filter;
  DM.tbPo.Filtered := true;
end;

procedure TfmPurchaseOrders.dbgPurchaseOrdersCellClick(Column: TColumn);
begin
  if (Column.FieldName = 'added') then
  begin
    Column.Grid.DataSource.DataSet.Edit;
    if (Uppercase(Column.Field.AsString) = 'FALSE') then
    begin
      Column.Field.AsString := 'True';
    end
    else
    begin
      Column.Field.AsString := 'False';
    end;
    Column.Grid.DataSource.DataSet.Post;
    PressKey(VK_DOWN);
    PressKey(VK_RIGHT);
    // setCountSelectedLines();
  end;
end;

procedure TfmPurchaseOrders.dbgPurchaseOrdersDblClick(Sender: TObject);
begin
  if (DM.tbPopo.Value > 0) then
  begin
    addActivity(DM.AlonDb, 'TfmPurchaseOrders.dbgPurchaseOrdersDblClick po=' + DM.tbPopo.AsString);
    DM.tbPOLines.Active := true;
    fmPo.ShowModal;
  end
  else
    ShowMessage('PO number not found');
end;

procedure TfmPurchaseOrders.dbgPurchaseOrdersDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  addedToPo: Boolean;
  bitmap: TBitmap;
  fixRect: TRect;
  bmpWidth: Integer;
  imgIndex: Integer;
begin
  fixRect := Rect;
  imgIndex := 0;
  if Column.FieldName = 'added' then
  begin
    if (Uppercase(Column.Field.AsString) = 'FALSE') then
      imgIndex := 0
    else if (Uppercase(Column.Field.AsString) = 'TRUE') then
    begin
      imgIndex := 1;
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
  with TjvDBGrid(Sender).Canvas do
  begin
    addedToPo := Column.Field.DataSet.FieldByName('added').AsBoolean;
    if (not(gdSelected in State)) then
    begin
      if (addedToPo) then
      begin
        Brush.Color := clAqua;
      end;
    end;
  end;
  TjvDBGrid(Sender).DefaultDrawColumnCell(fixRect, DataCol, Column, State);
end;

procedure TfmPurchaseOrders.dbgPurchaseOrdersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont;
  var Background: TColor; var SortMarker: TSortMarker; IsDown: Boolean);
var
  ordrFld: String;
begin
  ordrFld := Field.FieldName + ascDesc;
  if (ordrFld = 'VendorName' + ascDesc) then
    ordrFld := 'vendor' + ascDesc;
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

procedure TfmPurchaseOrders.dbgPurchaseOrdersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var
  ordrFld: String;
begin
  ordrFld := Field.FieldName;
  if (ordrFld = 'VendorName') then
    ordrFld := 'vendor';
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

procedure TfmPurchaseOrders.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmPurchaseOrders.FormShow(Sender: TObject);
begin
  cbVendors.Items := DM.fillCombo('vendors', 'vendorname', ' where isactive=true', true);
  cbVendors.ItemIndex := 0;
  edSearch.Text := '';
  btnCreateEmptyPO.Enabled := false;
  btnCreateEmptyPO.Caption := 'Create empty order <Choose vendor>';
  ascDesc := ':A';
  // DM.tbPo.Active := false;
  DM.tbPo.Active := true;
  DM.tbPo.Filter := '';
  DM.tbPo.Filtered := false;
  // DM.tbPo.Refresh;
  dbgPurchaseOrders.SetFocus;
  dbgPurchaseOrdersTitleBtnClick(dbgPurchaseOrders, 1, dbgPurchaseOrders.Columns.Items[1].Field);
  PressKey(VK_RIGHT);
end;

procedure TfmPurchaseOrders.ReceivePO1Click(Sender: TObject);
begin
  fmReceiver.ShowModal;
end;

procedure TfmPurchaseOrders.ReceiveselectedPO1Click(Sender: TObject);
begin
  addActivity(DM.AlonDb, 'TfmPurchaseOrders.ReceiveselectedPOrders');
  DM.UpdateMultiPOQtyReceived();
  dbgPurchaseOrders.SetFocus;
  DM.tbPo.Refresh;
  dbgPurchaseOrders.Refresh;
  PressKey(VK_RIGHT);
end;

procedure TfmPurchaseOrders.ReceivewholePO1Click(Sender: TObject);
var
  po: string;
begin
  po := dbgPurchaseOrders.DataSource.DataSet.FieldByName('PO').AsString;
  addActivity(DM.AlonDb, 'TfmPurchaseOrders.ReceivewholePO');
  DM.RunSql('update po set receiveddate=' + QuotedStr(DateTimeToStr(now)) + ' where PO=' + po);
  DM.UpdateQtyReceived(po, true);
  DM.tbPo.Active := false;
  DM.tbPo.Active := true;
  DM.RefreshQuery(DM.qAInv);
end;

procedure TfmPurchaseOrders.DeletePO1Click(Sender: TObject);
var
  po: string;
begin
  po := dbgPurchaseOrders.DataSource.DataSet.FieldByName('PO').AsString;
  DM.ResetPurchaseOrderLines(po);
  DM.RunSql('delete from polines where PO=' + po);
  DM.RunSql('delete from po where PO=' + po);
  DM.tbPo.Active := false;
  DM.tbPo.Active := true;
  DM.RefreshQuery(DM.qAInv);
end;

procedure TfmPurchaseOrders.edSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
  begin
    if ((Sender as TEdit).Text > '') then
    begin
      skuFilter := DM.BuildSearchFilter(Uppercase(Trim((Sender as TEdit).Text)), 'polines', 'shipid', 'sku', 'po');
    end
    else if ((Sender as TEdit).Text = '') then
    begin
      skuFilter := '';
    end;
    buildFilter;
  end;
end;

end.
