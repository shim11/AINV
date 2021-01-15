object fmEditVendor: TfmEditVendor
  Left = 225
  Top = 553
  BorderIcons = [biSystemMenu]
  Caption = 'Edit Vendor'
  ClientHeight = 327
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  PrintScale = poNone
  Scaled = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 288
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object dbeSupp: TDBEdit
      Left = 10
      Top = 26
      Width = 77
      Height = 24
      TabStop = False
      Color = clBackground
      DataField = 'VendorName'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dbeSuppName: TDBEdit
      Left = 90
      Top = 26
      Width = 345
      Height = 24
      DataField = 'FullName'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbeSuppAddress: TDBEdit
      Left = 10
      Top = 166
      Width = 215
      Height = 24
      DataField = 'Address'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dbeSuppCity: TDBEdit
      Left = 231
      Top = 166
      Width = 204
      Height = 24
      DataField = 'City'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object dbeSuppState: TDBEdit
      Left = 10
      Top = 211
      Width = 71
      Height = 24
      DataField = 'State'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object dbeSuppZIP: TDBEdit
      Left = 11
      Top = 259
      Width = 74
      Height = 24
      DataField = 'Zip'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object dbeSuppCountry: TDBEdit
      Left = 231
      Top = 211
      Width = 204
      Height = 24
      DataField = 'Country'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object dbeSuppPhone: TDBEdit
      Left = 90
      Top = 259
      Width = 183
      Height = 24
      DataField = 'Phone'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object dbeSuppFax: TDBEdit
      Left = 279
      Top = 258
      Width = 158
      Height = 24
      DataField = 'Fax'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object StaticText5: TStaticText
      Left = 10
      Top = 7
      Width = 77
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Vendor'
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 13
      Transparent = False
    end
    object StaticText1: TStaticText
      Left = 90
      Top = 7
      Width = 345
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Vendor name'
      Color = 8454143
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 14
      Transparent = False
    end
    object StaticText2: TStaticText
      Left = 10
      Top = 147
      Width = 215
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Address'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 15
      Transparent = False
    end
    object StaticText3: TStaticText
      Left = 231
      Top = 147
      Width = 204
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'City'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 16
      Transparent = False
    end
    object StaticText4: TStaticText
      Left = 10
      Top = 192
      Width = 71
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'State'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 17
      Transparent = False
    end
    object StaticText6: TStaticText
      Left = 231
      Top = 192
      Width = 204
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Country'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 18
      Transparent = False
    end
    object StaticText7: TStaticText
      Left = 11
      Top = 240
      Width = 74
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'ZIP'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 19
      Transparent = False
    end
    object StaticText8: TStaticText
      Left = 90
      Top = 240
      Width = 183
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Phone'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 20
      Transparent = False
    end
    object StaticText9: TStaticText
      Left = 279
      Top = 240
      Width = 158
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Fax'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 21
      Transparent = False
    end
    object StaticText11: TStaticText
      Left = 10
      Top = 98
      Width = 426
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Email'
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 22
      Transparent = False
    end
    object edEmail: TDBEdit
      Left = 10
      Top = 119
      Width = 425
      Height = 24
      DataField = 'Email'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object StaticText12: TStaticText
      Left = 90
      Top = 52
      Width = 71
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Min Order'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 23
      Transparent = False
    end
    object edMinOrder: TDBEdit
      Left = 90
      Top = 71
      Width = 72
      Height = 24
      DataField = 'MinOrder'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object StaticText10: TStaticText
      Left = 10
      Top = 52
      Width = 75
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Prefix'
      Color = clPurple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 24
      Transparent = False
    end
    object edPrefix: TDBEdit
      Left = 10
      Top = 71
      Width = 76
      Height = 24
      DataField = 'Prefix'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbePoBox: TDBEdit
      Left = 82
      Top = 211
      Width = 148
      Height = 24
      DataField = 'POBox'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object StaticText14: TStaticText
      Left = 164
      Top = 52
      Width = 49
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Active'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 25
      Transparent = False
    end
    object DBCheckBox1: TDBCheckBox
      Left = 178
      Top = 75
      Width = 15
      Height = 17
      DataField = 'isactive'
      DataSource = DM.dsVendors
      TabOrder = 26
    end
    object StaticText15: TStaticText
      Left = 214
      Top = 52
      Width = 219
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Contact person'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 27
      Transparent = False
    end
    object edContactPerson: TDBEdit
      Left = 214
      Top = 71
      Width = 217
      Height = 24
      DataField = 'contact_person'
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 28
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 288
    Width = 436
    Height = 39
    Align = alBottom
    TabOrder = 1
    object PMDBNavigator1: TPMDBNavigator
      Left = 1
      Top = 1
      Width = 434
      Height = 37
      DataSource = DM.dsVendors
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbClose]
      Align = alClient
      Hints.Strings = (
        'First record'
        'Prior record'
        'Next record'
        'Last record'
        'Insert record'
        'Delete record'
        'Edit current record'
        'Post'
        'Cancel'
        'Refresh'
        'Locate'
        'Filter'
        'Close')
      ParentShowHint = False
      ConfirmDelete = False
      TabOrder = 0
    end
  end
  object StaticText13: TStaticText
    Left = 82
    Top = 192
    Width = 148
    Height = 19
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'PO Box'
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    Transparent = False
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 8
    object Close1: TMenuItem
      AutoHotkeys = maAutomatic
      Bitmap.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333301BBBBBBBB033333011BBBBBBB0333330111BBBBBB03333301110BBBBB
        03333301110BBBBB03333301110BBBBB03333301110BBBBB03333301110BBBBB
        03333301110BBBBB0333330111B0BBBB03333301110BBBBB03333301110BBBBB
        03333301E10BBBBB03333301EE0BBBBB03333300000000000333}
      Caption = 'Close'
      ShortCut = 27
      OnClick = sbCloseClick
    end
  end
end
