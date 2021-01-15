object fmReceiver: TfmReceiver
  Left = 422
  Top = 659
  Caption = 'Receive purchase order'
  ClientHeight = 313
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 113
    Align = alTop
    BorderWidth = 1
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 8
      Width = 140
      Height = 20
      Caption = 'Purchase Order #'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 32
      Width = 571
      Height = 6
      Shape = bsBottomLine
    end
    object Label8: TLabel
      Left = 15
      Top = 48
      Width = 24
      Height = 16
      Caption = 'To:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 288
      Top = 10
      Width = 64
      Height = 16
      Caption = 'Created :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 80
      Width = 40
      Height = 16
      Caption = 'Sent :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 288
      Top = 80
      Width = 76
      Height = 16
      Caption = 'Received :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edToVendor: TDBText
      Left = 60
      Top = 49
      Width = 448
      Height = 22
      Color = clWhite
      DataField = 'VendorName'
      DataSource = DM.dsPO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edPo: TDBText
      Left = 163
      Top = 9
      Width = 97
      Height = 22
      Color = clWhite
      DataField = 'PO'
      DataSource = DM.dsPO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edOrderDate: TDBText
      Left = 379
      Top = 10
      Width = 130
      Height = 22
      Color = clWhite
      DataField = 'OrderDate'
      DataSource = DM.dsPO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edSentDate: TDBText
      Left = 61
      Top = 80
      Width = 130
      Height = 22
      Color = clWhite
      DataField = 'SentDate'
      DataSource = DM.dsPO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edReceivedDate: TDBText
      Left = 379
      Top = 81
      Width = 130
      Height = 22
      Color = clWhite
      DataField = 'ReceivedDate'
      DataSource = DM.dsPO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 262
    Width = 513
    Height = 51
    Align = alBottom
    TabOrder = 1
    object Label17: TLabel
      Left = 8
      Top = 13
      Width = 99
      Height = 16
      Caption = 'Total amount: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edTotAm: TDBText
      Left = 115
      Top = 13
      Width = 134
      Height = 22
      Color = clWhite
      DataField = 'TotalPrice'
      DataSource = DM.dsPO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btnReceive: TBitBtn
      Left = 384
      Top = 8
      Width = 105
      Height = 33
      Caption = 'Receive'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnReceiveClick
    end
    object cbReceiveAll: TCheckBox
      Left = 216
      Top = 16
      Width = 148
      Height = 17
      Caption = 'Receive all parts'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 513
    Height = 149
    Align = alClient
    TabOrder = 2
    object dbgPurchaseOrders: TDBGrid
      Left = 1
      Top = 1
      Width = 511
      Height = 147
      Align = alClient
      DataSource = DM.dsPOLines
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'line'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = '#'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sku'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 244
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qty'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtyreceived'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 107
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 80
    object Exit1: TMenuItem
      Caption = 'Exit'
      ShortCut = 27
      OnClick = Exit1Click
    end
  end
end
