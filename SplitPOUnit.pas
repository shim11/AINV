unit SplitPOUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, OutlookXP, Menus,MyFunctions, Data.DB, Vcl.Graphics,SqlTimSt,
  JvDBControls;

type
  TfmSplitPO = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cbWarehouse: TComboBox;
    Label1: TLabel;
    lbPO: TLabel;
    btnSavePO: TButton;
    dbgUnsplittedItems: TjvDBGrid;
    Label2: TLabel;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Label3: TLabel;
    edAmazonPO: TEdit;
    procedure btnSavePOClick(Sender: TObject);
    procedure dbgUnsplittedItemsSelect(Sender: TObject; var Allow: Boolean);
    procedure MenuItem3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSplitPO: TfmSplitPO;

implementation

uses DBUnit;

{$R *.dfm}

procedure TfmSplitPO.btnSavePOClick(Sender: TObject);
var
  TmpLst: TStringList;
  tableWidth, fileName, Path, vendormail, vendorname, po, amazonPO, WhName: string;
  count: Integer;
  total: Double;
  Outlook1: TOutlookApplication;
begin
  Path := ExtractFilePath(ParamStr(0));
  po := dbgUnsplittedItems.DataSource.DataSet.FieldByName('po').AsString;
  amazonPO := edAmazonPO.Text;
  WhName := Trim(cbWarehouse.Items.Strings[cbWarehouse.ItemIndex]);
  tableWidth := '720';
  total := 0;
  TmpLst := TStringList.Create;
  Outlook1 := TOutlookApplication.Create(nil);
  with DM do
    try
      tbWarehouses.Active := true;
      tbWarehouses.Filter := 'whname=' + QuotedStr(WhName);
      tbWarehouses.Filtered := true;
      tbVendors.Active := true;
      tbVendors.Filter := 'vendorname=' + QuotedStr(tbPOVendor.AsString);
      tbVendors.Filtered := true;
      vendormail := tbVendorsEmail.AsString;
      vendorname := tbPOVendorName.AsString;
      TmpLst.Add('<html><head><title>Purchase Order</title><meta content="text/html"></head><body bgcolor="#ffffff"><h1 align="center"><font size="5">Purchase Order #');
      TmpLst.Add(amazonPO + '</font></h1><h2>');
      TmpLst.Add('<table style="WIDTH: ' + tableWidth + 'px; HEIGHT: 150px" border="0" cellspacing="0" cellpadding="3" width=' + tableWidth + ' align=center>');
      TmpLst.Add('<tr><td width="60%"><font size="3">' + DateToStr(Now) + '</font></td>');
      TmpLst.Add('<td width="15%"><font size="3"></font></td><td width="25%"><p><a href="mailto:alon@lilgift.com"><font size=3>alon@lilgift.com</font></a></p></td></tr>');
      TmpLst.Add('<tr><td><font size="3"><b>To:</b>' + tbPOVendorName.AsString + '</font></td>');
      TmpLst.Add('<td><font size="3"></font></td><td><p><span><font size="6" face="Arial"><b>Lilgift</b></font></span></p></td></tr>');
      TmpLst.Add('<tr><td><font size="3">' + tbVendorsAddress.AsString + '</font></td>');
      TmpLst.Add('<td><font size="3"></font></td><td><p><font size="3">' + tbWarehousesLine1.AsString + '</font></p></td></tr>');
      TmpLst.Add('<tr><td><font size="3">' + tbVendorsCity.AsString + ', ' + tbVendorsState.AsString + ' ' + tbVendorsZip.AsString + ' ' + tbVendorsCountry.AsString + '</font></td>');
      TmpLst.Add('<td><font size="3"></font></td><td><p><font size="3">' + tbWarehousesLine2.AsString + '</font></p></td></tr>');
      TmpLst.Add('<tr><td><font size="3"><b>Fax:</b>' + tbVendorsFax.AsString + '</font></td>');
      TmpLst.Add('<td><font size="3"></font></td><td><p><font size="3">' + tbWarehousesLine3.AsString + '</font></p></td></tr>');
      TmpLst.Add('<tr><td><font size="3">' + vendormail + '</font></td>');
      TmpLst.Add('<td><font size="3"></font></td><td><p><font size="3">' + tbWarehousesLine4.AsString + '</font></p></td></tr>');
      TmpLst.Add('</table><br>' {<hr width="' + tableWidth + '">});

      TmpLst.Add('<p align="center"><table style="WIDTH: ' + tableWidth + 'px; HEIGHT: 150px" border="1" cellspacing="1" cellpadding="3" width=' + tableWidth + ' align=center><tbody><tr>');
      TmpLst.Add('<td width="2%"><p align="center"><font size="3">#</font></p></td><td width="25%"><p align="center"><font size="3">Part No</font></p></td><td width="35%"><p align="center"><font size="3">Description</font></p></td>');
      TmpLst.Add('<td><p align="center"><font size="3">Shipping date</font></p></td><td><p align="center"><font size="3">Quantity</font></p></td>');
      TmpLst.Add('<td><p align="center"><font size="3">Unit price</font></p></td><td width="5%"><p align="center"><font size="3">Line total</font></p></td></tr>');
      tbVendors.Filtered := false;
      //    tbVendors.Active := false;
      with tbUnsplittedItems do
      begin
        Active := false;
        Filtered := false;
        Filter := 'amazonpo=' + QuotedStr(AmazonPO);
        Filtered := true;
        Active := true;
        First;
        count := 1;
        while not Eof do
        begin
          TmpLst.Add('<tr><td><p align="center"><font size="3">');
          TmpLst.Add(IntToStr(count));
          Inc(count);
          TmpLst.Add('</font></p></td><td><p align="center"><font size="3">');
          TmpLst.Add(getffSku(tbUnsplittedItemsSKU.AsString));
          TmpLst.Add('</font></p></td><td><p align="center"><font size="3">');
          TmpLst.Add(GetSkuDesc(tbUnsplittedItemsSKU.AsString));
          TmpLst.Add('</font></p></td><td><p align="center"><font size="3">');
          TmpLst.Add(DateToStr(Now));
          TmpLst.Add('</font></p></td><td><p align="center"><font size="3">');
          TmpLst.Add(tbUnsplittedItemsQty.AsString);
          TmpLst.Add('</font></p></td><td><p align="center"><font size="3">');
          TmpLst.Add(FloatToStrF(tbUnsplittedItemsPrice.AsFloat, ffNumber, 6, 2));
          TmpLst.Add('</font></p></td><td><p align="center"><font size="3">');
          total := total + tbUnsplittedItemsPrice.AsFloat * tbUnsplittedItemsQty.AsInteger;
          TmpLst.Add(FloatToStrF(tbUnsplittedItemsPrice.AsFloat * tbUnsplittedItemsQty.AsInteger, ffNumber, 6, 2));
          TmpLst.Add('</font></p></td></tr>');
          Next;
        end;
        Filtered := false;
        Filter := 'whname=' + QuotedStr('');
        Filtered := true;
      end;
      TmpLst.Add('</tbody></table></p><br><table style="WIDTH: ' + tableWidth + 'px; HEIGHT: 40px" border="0" cellspacing="0" cellpadding="3" width=' + tableWidth + ' align=center>');
      TmpLst.Add('<tbody><tr><td><font size="3">Total amount:$</font><b>');
      TmpLst.Add(FloatToStrF(total, ffNumber, 6, 2));
      TmpLst.Add('</b></td></tr></tbody></table><p align="center"><font size="3">Sincerely,</font></p><p align="center"><font size="3">Alon Gesthalter</font></p></body></html>');
      TmpLst.Add('');
      if (not DirectoryExists(Path + 'PO\')) then
        CreateDir(Path + 'PO\');
      fileName := Path + 'PO\PurchaseOrder_LilGift_' + amazonPo + '.doc';
      TmpLst.SaveToFile(fileName);
      with Outlook1.CreateItem(olMailItem) as _MailItem do
      begin
        To_ := vendorname + '<' + vendormail + '>';
        Subject := 'Purchase Order #' + amazonPo;
        HTMLBody := TmpLst.Text;
        Display(EmptyParam);
      end;
      tbPo.Edit;
      tbPOSentDate.Value := DateTimeToSQLTimeStamp(Now);
      tbPo.Post;
    finally
      Outlook1.Disconnect;
      TmpLst.Free;
    end;
  Close;
end;

procedure TfmSplitPO.dbgUnsplittedItemsSelect(Sender: TObject;
  var Allow: Boolean);
var
  sel: boolean;
  line, po: string;
  Sql: string;
begin
  line := dbgUnsplittedItems.DataSource.DataSet.FieldByName('line').AsString;
  po := dbgUnsplittedItems.DataSource.DataSet.FieldByName('po').AsString;
  sel := DM.GetChecked(po, line);
  if (not sel and ((Trim(edAmazonPO.Text) = '') or (Trim(cbWarehouse.Items.Strings[cbWarehouse.ItemIndex]) = ''))) then
  begin
    ShowMessage('Please enter value into <AmazomPO#> and choose Warehouse#');
    Allow := false;
    Exit;
  end;

  if (sel = false) then
  begin
    Sql := 'update polines set amazonpo=' + QuotedStr(edAmazonPO.Text) +
      ', whname=' + QuotedStr(Trim(cbWarehouse.Items.Strings[cbWarehouse.ItemIndex])) +
      ', checked=true where po=' + DM.tbUnsplittedItemsPO.AsString + ' and line=' + DM.tbUnsplittedItemsLine.AsString;
    //    Allow := true;
  end
  else
  begin
    Sql := 'update polines set amazonpo=' + QuotedStr('') +
      ', whname=' + QuotedStr('') +
      ', checked=false where po=' + DM.tbUnsplittedItemsPO.AsString + ' and line=' + DM.tbUnsplittedItemsLine.AsString;
    //    Allow := false;
  end;

  //  ShowMessage(Sql);
  DM.RunSql(Sql);
end;

procedure TfmSplitPO.MenuItem3Click(Sender: TObject);
begin
  Close;
end;

end.

