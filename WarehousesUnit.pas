unit WarehousesUnit;

interface

uses
  Messages, SysUtils, Variants, Classes, Controls, Forms,
  StdCtrls, DBCtrls, Mask, PMDBNavigator, ExtCtrls;

type
  TfmWarehouses = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PMDBNavigator1: TPMDBNavigator;
    dbeName: TDBEdit;
    Label4: TLabel;
    Label2: TLabel;
    dbeLine1: TDBEdit;
    dbeLine2: TDBEdit;
    dbeLine3: TDBEdit;
    dbeLine4: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWarehouses: TfmWarehouses;

implementation

{$R *.dfm}

end.
