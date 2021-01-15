unit CreatePOLinesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, MyFunctions, Vcl.Menus;

type
  TfmCreatePoLines = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    btnCreatePoLines: TBitBtn;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure btnCreatePoLinesClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private
    { Private declarations }
  public
    Po: Integer;
  end;

var
  fmCreatePoLines: TfmCreatePoLines;

implementation

{$R *.dfm}

uses DBUnit;

procedure TfmCreatePoLines.btnCreatePoLinesClick(Sender: TObject);
var
  i, linesCount, errCount, lineNo, qty: Integer;
  tmpStr, Sku, qtyS, errMess, price, mess: String;
  delims: TCharSet;
begin
  delims := [#9,';',','];
  errCount := 0;
  errMess := '';
  lineNo := DM.getMaxPoLine(Po) + 1;
  linesCount := Memo1.Lines.Count;

  for i := 0 to linesCount - 1 do
  begin
    Screen.Cursor := crSQLWait;
    Application.ProcessMessages;
    try
      tmpStr := Memo1.Lines[i];
      if (WordCount(tmpStr, delims) <> 2) then
      begin
        errMess := errMess + #13 + tmpStr + ' not two columns';
        Inc(errCount);
        continue;
      end;
      Sku := ReplaceStr(ExtractDelimited(1, tmpStr, delims), '"', '');
      qtyS := ExtractDelimited(2, tmpStr, delims);
      if (qtyS = '') then
        qtyS := IntToStr(DM.getCaseQty(Sku));
      price := FloatToStr(DM.getMyCost(Sku));
      qty := DM.getSkuQtyPoLine(Po, Sku);
      if (qty = 0) then
        DM.RunSql('insert into polines (po,line,sku,qty,price) values(' + IntToStr(Po) + ', ' + IntToStr(lineNo) + ', ' + QuotedStr(Sku) +
          ', ' + qtyS + ', ' + price + ')')
      else
      begin
        errMess := errMess + #13 + Sku + ' is already exists in PO';
        Inc(errCount);
        continue;
      end;
      DM.RunSql('update ai_items set lastorderdate=' + QuotedStr(DateTimeToStr(Now)) + ', qtyreceived=0' + ' where sku=' + QuotedStr(Sku));
    except
      on E: Exception do
      begin
        errMess := errMess + #13 + Sku;
        Inc(errCount);
        continue;
      end;
    end;
    Inc(lineNo);
  end;
  mess := 'Inserted ' + IntToStr(linesCount - errCount) + ' of ' + IntToStr(linesCount) + ' lines';
  if errCount > 0 then
  begin
    mess := mess + #13 + 'Did not inserted Sku:' + #13 + errMess;
  end;
  showMessage(mess);
  addActivity(DM.AlonDb, 'TfmCreatePoLines.btnCreatePoLines po=' + IntToStr(Po) +' '+ mess);
  Memo1.Lines.Clear;
  ModalResult := mrOK;
  if (linesCount - errCount) > 0 then
  begin
    DM.RenumberPurchaseOrderLines(IntToStr(Po));
    DM.RunSql('update po set totalprice=' + FloatToStr(DM.getTotalPO(Po)) + ' where po=' + IntToStr(Po));
    DM.RefreshQuery(DM.tbPo);
//    sendLogMail('Insert PO lines from Excel', mess);
    log(mess);
  end;
  Close;
end;

procedure TfmCreatePoLines.MenuItem3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

end.
