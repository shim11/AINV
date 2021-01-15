unit CountdownUnit;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MyFunctions, ShellApi;

type
  TfmCountDown = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCounter: TLabel;
    lbSecTo: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    countdown: integer;
    changeVersion: boolean;
  end;

var
  fmCountDown: TfmCountDown;

implementation

uses DBUnit;
{$R *.dfm}

procedure TfmCountDown.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
  if (countdown = 0) then
    countdown := 60;
  lbCounter.Caption := IntToStr(countdown);
end;

procedure TfmCountDown.Timer1Timer(Sender: TObject);
begin
  Dec(countdown);
  lbCounter.Caption := IntToStr(countdown);
  if (countdown < 11) then
    lbCounter.Font.Color := clRed;
  if ((countdown = 2) and (changeVersion)) then
    ShellExecute(Handle, 'open', 'ChangeVersion.exe', PWideChar(DM.AlonDb.ConnectionName + ' ' + ParamStr(0)), nil, 1);
  // ExecAndWait('ChangeVersion.exe',1);
end;

end.
