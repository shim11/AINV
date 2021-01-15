unit VendorsUnit;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, Buttons, Grids, DBGrids, JvDBControls, DB, PMDBNavigator, Menus, StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExDBGrids, JvDBGrid;

type
  TfmVendors = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sbClose: TSpeedButton;
    dbgSuppliers: TjvDBGrid;
    sbEdit: TSpeedButton;
    sbNewCustomer: TSpeedButton;
    PMDBNavigator1: TPMDBNavigator;
    pmSuppliers: TPopupMenu;
    Addorderline1: TMenuItem;
    N1: TMenuItem;
    Editcurrentline1: TMenuItem;
    N2: TMenuItem;
    Deleteline1: TMenuItem;
    N3: TMenuItem;
    Close1: TMenuItem;
    procedure sbCloseClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbNewCustomerClick(Sender: TObject);
    procedure Deleteline1Click(Sender: TObject);
    procedure dbgSuppliersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure dbgSuppliersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      var SortMarker: TSortMarker; IsDown: Boolean);
  private
    { Private declarations }
  public
    TitleButton: Boolean;
    procedure ShowEditSupplierForm;
    { Public declarations }
  end;

var
  fmVendors: TfmVendors;

implementation

uses DBUnit, EditVendorUnit;

{$R *.DFM}

procedure TfmVendors.sbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmVendors.sbEditClick(Sender: TObject);
begin
  if dbgSuppliers.Fields[0].AsString = '' then
    sbNewCustomerClick(nil)
  else
    ShowEditSupplierForm;
end;

procedure TfmVendors.sbNewCustomerClick(Sender: TObject);
begin
  DM.tbVendors.Insert;
  fmEditVendor := TfmEditVendor.Create(nil);
  try
    fmEditVendor.ShowModal;
  finally
    fmEditVendor.Free;
  end;
end;

procedure TfmVendors.ShowEditSupplierForm;
var
  fmEditVendor: TfmEditVendor;
  TmpIndex: string;
begin
  fmEditVendor := TfmEditVendor.Create(nil);
  try
    TmpIndex := DM.tbVendors.IndexFieldNames;
    // DM.tbSuppliers.IndexName := 'main';
    fmEditVendor.ShowModal;
  finally
    DM.tbVendors.IndexFieldNames := TmpIndex;
    fmEditVendor.Free;
  end;
end;

procedure TfmVendors.Deleteline1Click(Sender: TObject);
begin
  DM.tbVendors.Delete;
end;

procedure TfmVendors.dbgSuppliersTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  TitleButton := True;
  case ACol of
    0:
      DM.tbVendors.IndexFieldNames := 'vendorname';
    1:
      DM.tbVendors.IndexFieldNames := 'fullname';
    2:
      DM.tbVendors.IndexFieldNames := 'address';
  end;
end;

procedure TfmVendors.dbgSuppliersGetBtnParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
var
  HighLight: Boolean;
begin
  HighLight := False;
  if (TjvDBGrid(Sender).DataSource.DataSet is TFdTable) and (Field <> nil) then
  begin
    if (Field.FieldName = 'fullname') and (TFdTable(TjvDBGrid(Sender).DataSource.DataSet).IndexFieldNames = 'fullname')
    then
      HighLight := True;
    if (Field.FieldName = 'address') and (TFdTable(TjvDBGrid(Sender).DataSource.DataSet).IndexFieldNames = 'address')
    then
      HighLight := True;
    if (Field.FieldName = 'vendorname') and
      (TFdTable(TjvDBGrid(Sender).DataSource.DataSet).IndexFieldNames = 'vendorname') then
      HighLight := True;
  end;
  if HighLight then
  begin
    SortMarker := smUp;
    AFont.Color := clBlue;
  end;
end;

end.
