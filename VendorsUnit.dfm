object fmVendors: TfmVendors
  Left = 464
  Top = 686
  BorderIcons = [biSystemMenu]
  Caption = 'Vendors'
  ClientHeight = 352
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = pmSuppliers
  Position = poMainFormCenter
  PrintScale = poNone
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 318
    Align = alClient
    TabOrder = 0
    object dbgSuppliers: TJvDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 316
      Align = alClient
      DataSource = DM.dsVendors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = pmSuppliers
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = sbEditClick
      TitleButtons = True
      OnGetBtnParams = dbgSuppliersGetBtnParams
      OnTitleBtnClick = dbgSuppliersTitleBtnClick
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 20
      TitleRowHeight = 20
      Columns = <
        item
          Alignment = taCenter
          Color = clTeal
          Expanded = False
          FieldName = 'vendorname'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = '# Key'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fullname'
          Title.Alignment = taCenter
          Title.Caption = 'Vendor name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'address'
          Title.Alignment = taCenter
          Title.Caption = 'Address'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 296
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 318
    Width = 681
    Height = 34
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      681
      34)
    object sbClose: TSpeedButton
      Left = 609
      Top = 0
      Width = 70
      Height = 33
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
      ExplicitLeft = 388
    end
    object sbEdit: TSpeedButton
      Left = 538
      Top = 0
      Width = 70
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Edit'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbEditClick
      ExplicitLeft = 317
    end
    object sbNewCustomer: TSpeedButton
      Left = 468
      Top = 0
      Width = 70
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = 'New'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbNewCustomerClick
      ExplicitLeft = 247
    end
    object PMDBNavigator1: TPMDBNavigator
      Left = 1
      Top = 1
      Width = 376
      Height = 32
      DataSource = DM.dsVendors
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alLeft
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
      TabOrder = 0
    end
  end
  object pmSuppliers: TPopupMenu
    Left = 16
    Top = 8
    object Addorderline1: TMenuItem
      Bitmap.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33338F3333F83BB3888BB8888BB3388FFFF88FFFF88333B000000000
        0B3333888888888888333330FFFFFFFF08333338F33333338F333330FFFFFFFF
        08333338F33333338F333330FFFFFFFF08333338F33333338F333330FFFFFFFF
        08333FF8F33333338FFFBBB0FFFFFFFF0BB38888F3333333888F3BB0FFFFFFFF
        0BBB3888F3333FFF88883330FFFF000003333338F333888883333330FFFF0FF0
        33333338F3338F38F3333330FFFF0F0B33333338F3338F88FF333330FFFF003B
        B3333338FFFF88388FF333B000000333BB33338888888F3388FF3BB3333BB333
        3BB33883333883333883B333333B3333333B8333333833333338}
      Caption = 'Add order line'
      ShortCut = 45
      OnClick = sbNewCustomerClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Editcurrentline1: TMenuItem
      Bitmap.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333388888888883333330FFFFFFFF03FF3FF8FF33F3FF800300000FF0F
        00F088F888883F838838E00BFBFB0FFFFFF08883333F8F3333F8E0BFBF000FFF
        F0F088F3338883F3F838E0FBFBFBF0F00FF088F3333FF8F88F38E0BFBF00000B
        0FF088F3338888838338E0FBFBFBFBF0FFF088F33FFFFFF83338E0BF0000000F
        FFF088FF888888833FF8000BFB00B0FF00F08883FF88383388383330000B0FFF
        FFF03338888383333FF8333330B0FFFF00003333383833FF888833330B0FF00F
        0FF03333838F38838F383330B00FFFFF0F033338F88F33338F833309030FFFFF
        00333388838FFFFF883333303300000003333338338888888333}
      Caption = 'Edit current line'
      ShortCut = 13
      OnClick = sbEditClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Deleteline1: TMenuItem
      Bitmap.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000D60E0000D60E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD1FDDDD1FDDDDDDDDDDDDD111FDDDDDD
        1FDDDD111FDDDDD1FDDDDDD111FDDD11FDDDDDDD111FD11FDDDDDDDDD11111FD
        DDDDDDDDDD111FDDDDDDDDDDD11111FDDDDDDDDD111FD1FDDDDDDD1111FDDD11
        FDDDD1111FDDDDD11FDDD11FDDDDDDDD11FDDDDDDDDDDDDDDDDD}
      Caption = 'Delete line'
      ShortCut = 16430
      OnClick = Deleteline1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Close1: TMenuItem
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
