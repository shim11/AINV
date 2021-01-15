unit AdressSearchUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, JvDBControls, Vcl.StdCtrls, JvExDBGrids, JvDBGrid;

type
  TfmAdressSearch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    dbgAdresses: TjvDBGrid;
    edSearchFilter: TEdit;
    Label1: TLabel;
    procedure Exit1Click(Sender: TObject);
    procedure edSearchFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAdressSearch: TfmAdressSearch;

implementation

{$R *.dfm}

uses DBUnit;

procedure TfmAdressSearch.edSearchFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  strF: String;
begin
  // if (Key >= Ord('A')) and (Key < Ord('Z')) then
  // begin
  with DM do
  begin
    if (edSearchFilter.Text > '') then
    begin
      strF := 'upper(whname) like ' + QuotedStr('%' + UpperCase(edSearchFilter.Text) + '%') + ' or ' +
        'upper(line1) like ' + QuotedStr('%' + UpperCase(edSearchFilter.Text) + '%') + ' or ' + 'upper(line2) like ' +
        QuotedStr('%' + UpperCase(edSearchFilter.Text) + '%') + ' or ' + 'upper(line3) like ' +
        QuotedStr('%' + UpperCase(edSearchFilter.Text) + '%') + ' or ' + 'upper(line4) like ' +
        QuotedStr('%' + UpperCase(edSearchFilter.Text) + '%');
      // showMessage(strF);
      tbWarehouses.Filter := strF;
      tbWarehouses.Filtered := true;
    end
    else
    begin
      tbWarehouses.Filtered := false;
    end;
  end;
  // end;

end;

procedure TfmAdressSearch.Exit1Click(Sender: TObject);
begin
  Close();
end;

end.
