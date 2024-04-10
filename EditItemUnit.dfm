object fmEditItem: TfmEditItem
  Left = 820
  Top = 561
  Caption = 'Edit inventory parts '
  ClientHeight = 322
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  PrintScale = poNone
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 281
    Width = 525
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 280
    ExplicitWidth = 521
    DesignSize = (
      525
      41)
    object sbClose: TSpeedButton
      Left = 455
      Top = 2
      Width = 75
      Height = 37
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Close'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbCloseClick
      ExplicitLeft = 446
    end
    object PMDBNavigator1: TDBNavigator
      Left = 14
      Top = 6
      Width = 430
      Height = 25
      DataSource = DM.dsItems
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 281
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 521
    ExplicitHeight = 280
    object edSearchByName: TEdit
      Left = 257
      Top = 28
      Width = 260
      Height = 24
      TabOrder = 2
      Visible = False
      OnExit = edSearchByNameExit
    end
    object edSKU: TDBEdit
      Left = 4
      Top = 28
      Width = 198
      Height = 24
      DataField = 'SKU'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 0
    end
    object edPrice: TDBEdit
      Left = 205
      Top = 84
      Width = 109
      Height = 24
      DataField = 'Price'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 5
    end
    object edQtyInv: TDBEdit
      Left = 122
      Top = 189
      Width = 102
      Height = 24
      DataField = 'qtyInv'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 10
    end
    object edTitle: TDBEdit
      Left = 5
      Top = 137
      Width = 516
      Height = 24
      DataField = 'Title'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 8
    end
    object StaticText1: TStaticText
      Left = 5
      Top = 8
      Width = 198
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Part number'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 16
      Transparent = False
    end
    object StaticText4: TStaticText
      Left = 122
      Top = 169
      Width = 103
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Qty in stock'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 17
      Transparent = False
    end
    object StaticText5: TStaticText
      Left = 205
      Top = 64
      Width = 109
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Unit cost'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 18
      Transparent = False
    end
    object StaticText11: TStaticText
      Left = 5
      Top = 114
      Width = 516
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Title'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 19
      Transparent = False
    end
    object StaticText3: TStaticText
      Left = 5
      Top = 169
      Width = 111
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Qty to order'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 20
      Transparent = False
    end
    object edQtyToOrder: TDBEdit
      Left = 5
      Top = 189
      Width = 110
      Height = 24
      DataField = 'QtyOrd'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 9
    end
    object StaticText6: TStaticText
      Left = 316
      Top = 64
      Width = 102
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'My cost'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 21
      Transparent = False
    end
    object edMyCost: TDBEdit
      Left = 316
      Top = 84
      Width = 102
      Height = 24
      DataField = 'MyCost'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 6
    end
    object StaticText7: TStaticText
      Left = 207
      Top = 8
      Width = 312
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Vendor'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 22
      Transparent = False
    end
    object edVendor: TDBEdit
      Left = 208
      Top = 28
      Width = 46
      Height = 24
      DataField = 'Vendor'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnDblClick = edVendorDblClick
    end
    object edFbaCost: TDBEdit
      Left = 420
      Top = 84
      Width = 98
      Height = 24
      DataField = 'FbaCost'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 7
    end
    object StaticText2: TStaticText
      Left = 420
      Top = 64
      Width = 98
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'FBA cost'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 23
      Transparent = False
    end
    object StaticText9: TStaticText
      Left = 234
      Top = 169
      Width = 111
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Qty received'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 24
      Transparent = False
    end
    object edQtyReceived: TDBEdit
      Left = 234
      Top = 189
      Width = 111
      Height = 24
      DataField = 'QtyReceived'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 11
    end
    object StaticText8: TStaticText
      Left = 350
      Top = 170
      Width = 71
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Case Qty'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 25
      Transparent = False
    end
    object edCaseQty: TDBEdit
      Left = 350
      Top = 189
      Width = 70
      Height = 24
      DataField = 'CaseQty'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 12
    end
    object cbVendors: TDBLookupComboBox
      Left = 255
      Top = 28
      Width = 264
      Height = 24
      DataField = 'vendor'
      DataSource = DM.dsItems
      KeyField = 'VendorName'
      ListField = 'FullName'
      ListSource = DM.dsVendors
      TabOrder = 3
    end
    object edFfSku: TDBEdit
      Left = 5
      Top = 84
      Width = 198
      Height = 24
      DataField = 'FfSKU'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 4
    end
    object StaticText10: TStaticText
      Left = 5
      Top = 64
      Width = 198
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Vendor'#39's part number'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 26
      Transparent = False
    end
    object StaticText12: TStaticText
      Left = 432
      Top = 170
      Width = 83
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Need Case'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 27
      Transparent = False
    end
    object StaticText13: TStaticText
      Left = 5
      Top = 217
      Width = 111
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Weight (lbs)'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 28
      Transparent = False
    end
    object dbeWeight: TDBEdit
      Left = 5
      Top = 237
      Width = 110
      Height = 24
      DataField = 'weight'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 14
    end
    object StaticText14: TStaticText
      Left = 234
      Top = 218
      Width = 109
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Oversize'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 29
      Transparent = False
    end
    object dbeOversize: TDBCheckBox
      Left = 283
      Top = 244
      Width = 16
      Height = 17
      DataField = 'oversize'
      DataSource = DM.dsItems
      TabOrder = 15
    end
    object dbeNeedCase: TDBCheckBox
      Left = 464
      Top = 193
      Width = 16
      Height = 17
      DataField = 'needcase'
      DataSource = DM.dsItems
      TabOrder = 13
    end
    object StaticText15: TStaticText
      Left = 350
      Top = 218
      Width = 70
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Active'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 30
      Transparent = False
    end
    object DBCheckBox1: TDBCheckBox
      Left = 377
      Top = 244
      Width = 16
      Height = 17
      DataField = 'isactive'
      DataSource = DM.dsItems
      TabOrder = 31
    end
    object StaticText16: TStaticText
      Left = 122
      Top = 217
      Width = 103
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkSoft
      Caption = 'Warehouse'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 32
      Transparent = False
    end
    object dbeQtywh: TDBEdit
      Left = 122
      Top = 237
      Width = 102
      Height = 24
      DataField = 'qtywh'
      DataSource = DM.dsItems
      PopupMenu = PopupMenu1
      TabOrder = 33
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 8
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
