unit EditItemUnit;

interface

uses Vcl.Menus, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,Forms, Dialogs, DB,Windows,SysUtils,
Vcl.Controls, Vcl.Buttons, System.Classes, Vcl.ExtCtrls, PMDBNavigator;

type
  TfmEditItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edSKU: TDBEdit;
    edPrice: TDBEdit;
    edQtyInv: TDBEdit;
    edTitle: TDBEdit;
    PMDBNavigator1: TPMDBNavigator;
    sbClose: TSpeedButton;
    StaticText1: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText11: TStaticText;
    StaticText3: TStaticText;
    edQtyToOrder: TDBEdit;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    StaticText6: TStaticText;
    edMyCost: TDBEdit;
    StaticText7: TStaticText;
    edVendor: TDBEdit;
    edSearchByName: TEdit;
    edFbaCost: TDBEdit;
    StaticText2: TStaticText;
    StaticText9: TStaticText;
    edQtyReceived: TDBEdit;
    StaticText8: TStaticText;
    edCaseQty: TDBEdit;
    cbVendors: TDBLookupComboBox;
    edFfSku: TDBEdit;
    StaticText10: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    dbeWeight: TDBEdit;
    StaticText14: TStaticText;
    dbeOversize: TDBCheckBox;
    dbeNeedCase: TDBCheckBox;
    StaticText15: TStaticText;
    DBCheckBox1: TDBCheckBox;
    StaticText16: TStaticText;
    dbeQtywh: TDBEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbCloseClick(Sender: TObject);
    procedure Saveitem1Click(Sender: TObject);
    procedure lbVendorNameDblClick(Sender: TObject);
    procedure edSearchByNameExit(Sender: TObject);
    procedure edVendorDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  fmEditItem: TfmEditItem;

implementation

uses DBUnit, EditVendorUnit;
{$R *.dfm}

procedure TfmEditItem.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  edSearchByName.Visible := false;
  edSearchByName.SendToBack;
  edSearchByName.Text := '';
  if PMDBNavigator1.DataSource.DataSet.State <> dsBrowse then
  begin
    if Application.MessageBox('Do you want to save changes ?',
      'Unsaved changes', MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
    begin
      PMDBNavigator1.DataSource.DataSet.Post;
      CanClose := True;
    end
    else
    begin
      PMDBNavigator1.DataSource.DataSet.Cancel;
      CanClose := True;
    end;
  end
  else
    CanClose := True;
end;

procedure TfmEditItem.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_NEXT) or (Key = VK_PRIOR) then
  begin
    if PMDBNavigator1.DataSource.DataSet.State <> dsBrowse then
      PMDBNavigator1.DataSource.DataSet.Post;
    if (Key = VK_NEXT) then
      PMDBNavigator1.DataSource.DataSet.Next
    else
      PMDBNavigator1.DataSource.DataSet.Prior;
  end;
end;

procedure TfmEditItem.FormShow(Sender: TObject);
begin
  DM.dsItems.DataSet.Active := true;
end;

procedure TfmEditItem.sbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEditItem.Saveitem1Click(Sender: TObject);
begin
  if (PMDBNavigator1.DataSource.State = dsEdit) then
    PMDBNavigator1.DataSource.DataSet.Post;
   Close;
end;

procedure TfmEditItem.lbVendorNameDblClick(Sender: TObject);
begin
  edSearchByName.Visible := True;
  edSearchByName.BringToFront;
  edSearchByName.SetFocus;
end;

procedure TfmEditItem.edSearchByNameExit(Sender: TObject);
begin
  edSearchByName.Visible := false;
  edSearchByName.SendToBack;
  edSearchByName.Text := '';
end;

procedure TfmEditItem.edVendorDblClick(Sender: TObject);
begin
  if (edVendor.Field.Value > '') then
  begin
    DM.tbVendors.Active := true;
    DM.tbVendors.Filter := 'vendorname=' + QuotedStr(edVendor.Field.AsString);
    DM.tbVendors.Filtered := true;
    fmEditVendor.ShowModal;
    DM.tbVendors.Filtered := False;
  end
  else
  begin
    edSearchByName.Visible := True;
    edSearchByName.BringToFront;
    edSearchByName.SetFocus;
  end;
end;

end.

