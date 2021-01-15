unit EditVendorUnit;

interface

uses
  Windows,  SysUtils, Classes, Controls, Forms,
  ExtCtrls, StdCtrls, DBCtrls, PMDBNavigator, DB, Menus, Vcl.Mask;

type
  TfmEditVendor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PMDBNavigator1: TPMDBNavigator;
    dbeSupp: TDBEdit;
    dbeSuppName: TDBEdit;
    dbeSuppAddress: TDBEdit;
    dbeSuppCity: TDBEdit;
    dbeSuppState: TDBEdit;
    dbeSuppZIP: TDBEdit;
    dbeSuppCountry: TDBEdit;
    dbeSuppPhone: TDBEdit;
    dbeSuppFax: TDBEdit;
    StaticText5: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    StaticText11: TStaticText;
    edEmail: TDBEdit;
    StaticText13: TStaticText;
    StaticText12: TStaticText;
    edMinOrder: TDBEdit;
    StaticText10: TStaticText;
    edPrefix: TDBEdit;
    dbePoBox: TDBEdit;
    StaticText14: TStaticText;
    DBCheckBox1: TDBCheckBox;
    StaticText15: TStaticText;
    edContactPerson: TDBEdit;
    procedure sbCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  fmEditVendor: TfmEditVendor;

implementation

uses DBUnit;

{$R *.DFM}

procedure TfmEditVendor.sbCloseClick(Sender: TObject);
  begin
    Close;
  end;

procedure TfmEditVendor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    if PMDBNavigator1.DataSource.DataSet.State <> dsBrowse then
      begin
        if Application.MessageBox('Do you want to save changes ?', 'Unsaved changes', MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
          begin
            PMDBNavigator1.DataSource.DataSet.Post;
            CanClose := True;
          end
        else begin
            PMDBNavigator1.DataSource.DataSet.Cancel;
            CanClose := True;
          end;
      end
    else
      CanClose := True;
  end;

end.
