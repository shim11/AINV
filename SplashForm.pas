unit SplashForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, Vcl.StdCtrls;

type
  TfmSplash = class(TForm)
    Panel1: TPanel;
    Image3: TImage;
    Panel2: TPanel;
    mmText: TMemo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSplash: TfmSplash;

implementation

{$R *.DFM}

procedure TfmSplash.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//sleep(2000);
end;

end.
