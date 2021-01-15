object fmCreatePoLines: TfmCreatePoLines
  Left = 0
  Top = 0
  ActiveControl = Memo1
  BorderIcons = [biSystemMenu]
  Caption = 'Create PO lines from Excel'
  ClientHeight = 572
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 63
    Align = alTop
    PopupMenu = PopupMenu2
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 245
      Height = 50
      AutoSize = False
      Caption = 
        'Paste or write into the edit two fields SKU and QTY, press butto' +
        'n -->'#13#10'(Delimiters tab, ","or";")'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu2
      WordWrap = True
    end
    object btnCreatePoLines: TBitBtn
      Left = 267
      Top = 10
      Width = 100
      Height = 33
      Caption = 'Create lines'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      OnClick = btnCreatePoLinesClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 63
    Width = 376
    Height = 509
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitTop = 57
    ExplicitWidth = 324
    ExplicitHeight = 411
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 374
      Height = 507
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      WantTabs = True
      ExplicitWidth = 322
      ExplicitHeight = 409
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 208
    Top = 40
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Caption = 'Exit'
      ShortCut = 27
      OnClick = MenuItem3Click
    end
  end
end
