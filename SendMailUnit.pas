unit SendMailUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtrls, SHDocVw, ExtCtrls, StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, Menus, ShellApi, MyFunctions,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdAttachmentFile, IdText, frxClass, frxExportPDF, SqlTimSt, FireDAC.Stan.ExprFuncs
  // IdExplicitTLSClientServerBase,
  // IdMessageClient, IdSMTPBase, IdSMTP,  Menus, ComObj, JPEG, ActiveX
    ;

type
  TfmSendMail = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    btnSendMail: TSpeedButton;
    edSendTo: TEdit;
    edSubject: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    SMTP: TIdSMTP;
    Label4: TLabel;
    edCC: TEdit;
    mmNoteTo: TMemo;
    Label5: TLabel;
    btnPrint: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    Label3: TLabel;
    lbAttachedFile: TLabel;
    procedure btnSendMailClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure lbAttachedFileDblClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    htmlStr, attFileStr: TStringList;
    orderNo, attFile, docType, attFileContent, attFilePath, pdfFilePath: string;
    orderVer: integer;
  end;

var
  fmSendMail: TfmSendMail;

implementation

uses DbUnit;

{$R *.dfm}

procedure TfmSendMail.btnSendMailClick(Sender: TObject);
var
  PostMessage: TIdMessage;
  attFileA, attPdf: TIdAttachmentFile;
  bodyText: TIdText;
  htmlAdd, htmlToSave: string;
begin
  if (edSendTo.Text = '') then
    raise Exception.Create('Must be <To> email address');

  Screen.Cursor := crSQLWait;
  DM.tbSelfInfo.Active := true;
  DM.tbSelfInfo.Filter := 'type=' + QuotedStr('1');
  DM.tbSelfInfo.Filtered := true;
  SMTP.Host := DM.tbSelfInfosmtp_server.Value;
  SMTP.Port := DM.tbSelfInfosmtp_port.Value;
  SMTP.Username := DM.tbSelfInfosmtp_user.Value;
  SMTP.Password := DM.tbSelfInfosmtp_password.Value;
  SMTP.Connect;
  PostMessage := TIdMessage.Create(nil);

  htmlToSave := htmlStr.Text;
  try
    with TIdText.Create(PostMessage.MessageParts, nil) do
    begin
      ContentType := 'multipart/related; type="multipart/alternative"';
    end;
    with TIdText.Create(PostMessage.MessageParts, nil) do
    begin
      ContentType := 'multipart/alternative';
      ParentPart := 0;
    end;
    PostMessage.Organization := DM.tbSelfInfocompany.AsString;
    PostMessage.From.Name := DM.tbSelfInfomyname.Value;
    PostMessage.CCList.EMailAddresses := edCC.Text;
    PostMessage.From.Address := DM.tbSelfInfoemail.Value;
    PostMessage.ReplyTo.EMailAddresses := DM.tbSelfInfoemail.Value;
    PostMessage.Recipients.EMailAddresses := edSendTo.Text;
    // PostMessage.Recipients.EMailAddresses := 'klubatok@gmail.com';
    PostMessage.BccList.Clear;

    if (mmNoteTo.Text <> '') and (Pos('$notes', htmlStr.Text) > 1) then
    begin
      htmlAdd := ReplaceStr(mmNoteTo.Text, #13, '<br>');
      htmlAdd := '<tr><td> <b>Note:</b><br>' + htmlAdd + '</td></tr>';
      htmlStr.Text := ReplaceStr(htmlStr.Text, '$notes', htmlAdd);
    end
    else
      htmlStr.Text := ReplaceStr(htmlStr.Text, '$notes', '&nbsp');

    bodyText := TIdText.Create(PostMessage.MessageParts, nil);
    bodyText.Body := htmlStr;
    bodyText.ContentType := 'text/html';
    bodyText.ParentPart := 1;

    attFileA := TIdAttachmentFile.Create(PostMessage.MessageParts, attFile);
    attFileA.ContentType := 'text/plain';
    attFileA.ExtraHeaders.Values['content-id'] := lbAttachedFile.Caption;
    attFileA.DisplayName := lbAttachedFile.Caption;

    if (pdfFilePath <> '') then
    begin
      attPdf := TIdAttachmentFile.Create(PostMessage.MessageParts, pdfFilePath);
      attPdf.ContentType := 'application/pdf';
      attPdf.ExtraHeaders.Values['content-id'] := 'Labels';
      attPdf.DisplayName := 'Labels file';
    end;

    PostMessage.Subject := edSubject.Text;
    SMTP.Send(PostMessage);
    ModalResult := mrOk;

    // Save the message
    with DM do
    begin
      tbMailArchive.Active := true;
      if (retStrFieldValue(AlonDb, 'select orderno from mail_archive where doctype=' + QuotedStr(docType) + ' and orderno=' +
        QuotedStr(orderNo) + ' and orderversion=' + IntToStr(orderVer)) = orderNo) then
      begin
        tbMailArchive.Filter := 'doctype=' + QuotedStr(docType) + ' and orderno=' + QuotedStr(orderNo) + ' and orderversion=' +
          IntToStr(orderVer);
        tbMailArchive.Filtered := true;
        tbMailArchive.Edit;
      end
      else
      begin
        tbMailArchive.Insert;
        tbMailArchivedoctype.Value := docType;
        tbMailArchiveorderno.Value := orderNo;
        tbMailArchiveorderversion.Value := orderVer;
      end;
      tbMailArchivesentto.Value := edSendTo.Text;
      tbMailArchivesubject.Value := edSubject.Text;
      tbMailArchivecc.Value := edCC.Text;
      tbMailArchivenote.Value := mmNoteTo.Text;
      tbMailArchivebody.Value := htmlToSave;
      tbMailArchiveattachedfilename.Value := lbAttachedFile.Caption;
      tbMailArchiveattached.Value := attFileContent;
      tbMailArchivesentdate.Value := DateTimeToSQLTimeStamp(Now);
      tbMailArchive.Post;
      tbMailArchive.Filter := '';
      tbMailArchive.Filtered := false;
    end;
    //
  finally
    Screen.Cursor := crDefault;
    PostMessage.Free;
    SMTP.Disconnect();
    // htmlStr.Free;
  end;
end;

procedure TfmSendMail.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmSendMail.lbAttachedFileDblClick(Sender: TObject);
begin
  ShellExecute(fmSendMail.Handle, nil, PChar(attFile), nil, nil, SW_RESTORE);
end;

procedure TfmSendMail.Print1Click(Sender: TObject);
var
  vaIn, vaOut: OleVariant;
begin
  // WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
  // WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vaIn, vaOut);
  WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
end;

end.
