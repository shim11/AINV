unit EditReceivePoUnit;

interface

uses
  SysUtils, Forms, StdCtrls, ExtCtrls, Buttons, DateUtils, DB, Grids, DBGrids, DBCtrls, Menus,
  Vcl.Controls, System.Classes, MyFunctions,SqlTimSt;

type
  TfmReceiver = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    edToVendor: TDBText;
    edPo: TDBText;
    Panel2: TPanel;
    Label17: TLabel;
    edTotAm: TDBText;
    Panel3: TPanel;
    dbgPurchaseOrders: TDBGrid;
    Label2: TLabel;
    edOrderDate: TDBText;
    edSentDate: TDBText;
    edReceivedDate: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    btnReceive: TBitBtn;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    cbReceiveAll: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnReceiveClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    private
      { Private declarations }
    public
      // SavePlace: TBookmark;
  end;

var
  fmReceiver: TfmReceiver;

implementation

uses DBUnit;

{$R *.dfm}

procedure TfmReceiver.FormShow(Sender: TObject);
  begin
    DM.tbPOLines.Active := True;
    // SavePlace := DM.tbPO.GetBookmark;
  end;

procedure TfmReceiver.btnReceiveClick(Sender: TObject);
  begin
    addActivity(DM.AlonDb, 'TfmReceiver.btnReceiveClick');
    // DM.tbPO.GotoBookmark(SavePlace);
    DM.tbPO.Edit;
    DM.tbPOReceivedDate.Value := DateTimeToSQLTimeStamp(Now);
    DM.tbPO.Post;
    DM.UpdateQtyReceived(DM.tbPOPO.AsString, cbReceiveAll.Checked);
    DM.RefreshQuery(DM.qAInv);
    Close;
  end;

procedure TfmReceiver.Exit1Click(Sender: TObject);
  begin
    Close;
  end;

end.
