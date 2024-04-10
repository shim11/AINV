object fmInventory: TfmInventory
  Left = 420
  Top = 83
  Caption = 'Manage inventory'
  ClientHeight = 733
  ClientWidth = 1290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 1290
    Height = 608
    ActivePage = tshLoadData
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    Style = tsFlatButtons
    TabHeight = 30
    TabOrder = 0
    TabWidth = 200
    object tshInventory: TTabSheet
      Caption = 'Inventory'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1282
        Height = 568
        Align = alClient
        TabOrder = 0
        object dbgMain: TJvDBGrid
          Left = 1
          Top = 1
          Width = 1280
          Height = 566
          Align = alClient
          DataSource = DM.dsItems
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnCellClick = dbgMainCellClick
          OnDrawColumnCell = dbgMainDrawColumnCell
          OnDblClick = dbgMainDblClick
          TitleButtons = True
          OnGetBtnParams = dbgMainGetBtnParams
          OnTitleBtnClick = dbgMainTitleBtnClick
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Color = 15921906
              Expanded = False
              FieldName = 'addtopo'
              Title.Alignment = taCenter
              Title.Caption = 'V'
              Width = 20
              Visible = True
            end
            item
              Color = 15921864
              Expanded = False
              FieldName = 'sku'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'SKU'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 308
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vendor'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Vendor'
              Width = 67
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'vendorqty'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'VQty'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtyinv'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Inventory'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtywh'
              Title.Alignment = taCenter
              Title.Caption = 'WHQ'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtymin'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clOlive
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Qty 30'
              Width = 90
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'qtyord'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Qty to Order'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGreen
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 96
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'qtymin10'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Qty 10'
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'qtyord10'
              ReadOnly = True
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mycost'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'price'
              ReadOnly = True
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtyreceived'
              ReadOnly = True
              Title.Caption = 'Qty Received'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lastorderdate'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'OrderDate'
              Width = 89
              Visible = True
            end>
        end
        object messagePanel: TPanel
          Left = 457
          Top = 144
          Width = 280
          Height = 89
          BevelInner = bvLowered
          BevelKind = bkTile
          TabOrder = 1
          Visible = False
          object lbMsg1: TLabel
            Left = 12
            Top = 12
            Width = 172
            Height = 16
            AutoSize = False
            Caption = 'Wait while updating cost '
          end
          object lbMsg2: TLabel
            Left = 12
            Top = 34
            Width = 172
            Height = 16
            AutoSize = False
            Caption = 'and profit '
          end
          object lbMsg3: TLabel
            Left = 12
            Top = 56
            Width = 172
            Height = 16
            AutoSize = False
            Caption = 'in ProfitReport table ...'
          end
        end
      end
    end
    object tshReports: TTabSheet
      Caption = 'Reports'
      ImageIndex = 1
      object pnRange: TPanel
        Left = -3
        Top = 3
        Width = 881
        Height = 502
        BevelInner = bvLowered
        TabOrder = 4
        Visible = False
        object memRange: TMemo
          Left = 2
          Top = 43
          Width = 877
          Height = 457
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnKeyUp = memRangeKeyUp
        end
        object Panel21: TPanel
          Left = 2
          Top = 2
          Width = 877
          Height = 41
          Align = alTop
          TabOrder = 1
          object btnCloseMemo: TBitBtn
            Left = 1
            Top = 1
            Width = 875
            Height = 39
            Align = alClient
            Caption = 'Close'
            TabOrder = 0
            OnClick = btnCloseMemoClick
          end
        end
      end
      object Panel11: TPanel
        Left = 465
        Top = 3
        Width = 463
        Height = 196
        BevelInner = bvLowered
        TabOrder = 1
        object Label27: TLabel
          Left = 16
          Top = 78
          Width = 100
          Height = 20
          Caption = 'Dates range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 16
          Top = 48
          Width = 59
          Height = 20
          Caption = 'Vendor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 16
          Top = 110
          Width = 74
          Height = 20
          Caption = 'Group by'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 16
          Top = 20
          Width = 52
          Height = 20
          Caption = 'Item #'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDateFrom1: TDateTimePicker
          Left = 142
          Top = 78
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 0
        end
        object edDateTo1: TDateTimePicker
          AlignWithMargins = True
          Left = 320
          Top = 78
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 1
        end
        object cbPoReportVendors: TComboBox
          Left = 142
          Top = 48
          Width = 283
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object cbOrderBy1: TComboBox
          Left = 142
          Top = 112
          Width = 283
          Height = 24
          TabOrder = 3
          Text = 'Vendor'
          Items.Strings = (
            'Vendor'
            'Vendor,SKU'
            'SKU,Vendor'
            'SKU'
            '')
        end
        object btnPoReport: TBitBtn
          Left = 142
          Top = 144
          Width = 283
          Height = 47
          Caption = 'Purchase orders report'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnPoReportClick
        end
        object edSku1: TEdit
          Left = 142
          Top = 14
          Width = 283
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object Panel12: TPanel
        Left = 3
        Top = 198
        Width = 438
        Height = 135
        BevelInner = bvLowered
        TabOrder = 2
        object Label33: TLabel
          Left = 16
          Top = 16
          Width = 100
          Height = 20
          Caption = 'Dates range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 16
          Top = 50
          Width = 68
          Height = 20
          Caption = 'Vendors'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDateFrom2: TDateTimePicker
          Left = 137
          Top = 16
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 0
        end
        object edDateTo2: TDateTimePicker
          AlignWithMargins = True
          Left = 320
          Top = 16
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 1
        end
        object btnCompareProfitReport: TBitBtn
          Left = 137
          Top = 81
          Width = 288
          Height = 47
          Caption = 'Compare profit report'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnCompareProfitReportClick
        end
        object edCpVendors: TEdit
          Left = 137
          Top = 47
          Width = 288
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object Panel17: TPanel
        Left = 465
        Top = 198
        Width = 463
        Height = 135
        BevelInner = bvLowered
        Color = 16118000
        ParentBackground = False
        TabOrder = 3
        object Label46: TLabel
          Left = 16
          Top = 16
          Width = 100
          Height = 20
          Caption = 'Dates range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 16
          Top = 50
          Width = 68
          Height = 20
          Caption = 'Vendors'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDateFrom3: TDateTimePicker
          Left = 144
          Top = 16
          Width = 105
          Height = 24
          Date = 41640.000000000000000000
          Time = 0.518100439818226700
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edDateFrom3Exit
        end
        object edDateTo3: TDateTimePicker
          AlignWithMargins = True
          Left = 320
          Top = 16
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 1
        end
        object btnTwoCompareProfit: TBitBtn
          Left = 144
          Top = 80
          Width = 281
          Height = 48
          Caption = 'Yearly compare month profit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnTwoCompareProfitClick
        end
        object edCp2Vendors: TEdit
          Left = 144
          Top = 47
          Width = 281
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object Panel18: TPanel
        Left = 3
        Top = 504
        Width = 925
        Height = 58
        BevelInner = bvLowered
        TabOrder = 5
        object btn5000Cost: TBitBtn
          Left = 605
          Top = 7
          Width = 281
          Height = 47
          Caption = 'Items over $5000 cost '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btn5000CostClick
        end
        object btnDayRep: TBitBtn
          Left = 21
          Top = 7
          Width = 158
          Height = 47
          Caption = 'Last day orders'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnDayRepClick
        end
        object btnWeekRep: TBitBtn
          Left = 225
          Top = 7
          Width = 158
          Height = 47
          Caption = 'Last week orders'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnWeekRepClick
        end
        object btnMonthRep: TBitBtn
          Left = 429
          Top = 7
          Width = 158
          Height = 47
          Caption = 'Last month orders'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnMonthRepClick
        end
      end
      object Panel19: TPanel
        Left = 465
        Top = 332
        Width = 463
        Height = 173
        BevelInner = bvLowered
        TabOrder = 6
        object Label21: TLabel
          Left = 16
          Top = 48
          Width = 124
          Height = 20
          Caption = 'Previous period'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 16
          Top = 16
          Width = 116
          Height = 20
          Caption = 'Current period'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 16
          Top = 88
          Width = 52
          Height = 20
          Caption = 'Item #'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edPrevDateFrom: TDateTimePicker
          Left = 168
          Top = 48
          Width = 105
          Height = 24
          Date = 42736.000000000000000000
          Time = 0.518100439818226700
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edDateFrom3Exit
        end
        object edPrevDateTo: TDateTimePicker
          AlignWithMargins = True
          Left = 321
          Top = 48
          Width = 105
          Height = 24
          Date = 42767.000000000000000000
          Time = 42767.000000000000000000
          TabOrder = 1
        end
        object edCurDatefrom: TDateTimePicker
          Left = 168
          Top = 16
          Width = 105
          Height = 24
          Date = 42736.000000000000000000
          Time = 0.518100439818226700
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnExit = edDateFrom3Exit
        end
        object edCurDateTo: TDateTimePicker
          AlignWithMargins = True
          Left = 321
          Top = 16
          Width = 105
          Height = 24
          Date = 42767.000000000000000000
          Time = 42767.000000000000000000
          TabOrder = 3
        end
        object btnPeriodCompareReport: TBitBtn
          Left = 144
          Top = 119
          Width = 281
          Height = 47
          Caption = 'Compare items profit by dates'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnPeriodCompareReportClick
        end
        object edSku3: TEdit
          Left = 144
          Top = 82
          Width = 283
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object Panel20: TPanel
        Left = 3
        Top = 332
        Width = 438
        Height = 173
        BevelInner = bvLowered
        Color = 16118000
        ParentBackground = False
        TabOrder = 7
        object Label68: TLabel
          Left = 16
          Top = 16
          Width = 100
          Height = 20
          Caption = 'Dates range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 16
          Top = 56
          Width = 59
          Height = 20
          Caption = 'Vendor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edSIRepDateFrom: TDateTimePicker
          Left = 144
          Top = 16
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Format = 'MM-yyyy'
          Time = 40590.000000000000000000
          TabOrder = 0
        end
        object edSIRepDateTo: TDateTimePicker
          AlignWithMargins = True
          Left = 320
          Top = 16
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Format = 'MM-yyyy'
          Time = 40590.000000000000000000
          TabOrder = 1
        end
        object btnSoldItemsReport: TBitBtn
          Left = 144
          Top = 119
          Width = 281
          Height = 47
          Caption = 'Sold items report'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnSoldItemsReportClick
        end
        object cbSIRepVendors: TComboBox
          Left = 144
          Top = 55
          Width = 281
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object Panel10: TPanel
        Left = 3
        Top = 3
        Width = 438
        Height = 196
        BevelInner = bvLowered
        Color = 16118000
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 20
          Width = 52
          Height = 20
          Caption = 'Item #'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 16
          Top = 46
          Width = 100
          Height = 20
          Caption = 'Dates range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 16
          Top = 79
          Width = 69
          Height = 20
          Caption = 'Order by'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 16
          Top = 115
          Width = 68
          Height = 20
          Caption = 'Vendors'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbOrderBy: TComboBox
          Left = 137
          Top = 78
          Width = 161
          Height = 24
          TabOrder = 0
          Text = 'SKU'
          OnSelect = cbOrderBySelect
          Items.Strings = (
            'SKU'
            'Item Profit'
            'Total Profit'
            'Percent Profit'
            'Vendor'
            'Total Qty sold')
        end
        object edDateFrom: TDateTimePicker
          Left = 137
          Top = 48
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 1
        end
        object edSku: TEdit
          Left = 137
          Top = 12
          Width = 184
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edDateTo: TDateTimePicker
          AlignWithMargins = True
          Left = 320
          Top = 48
          Width = 105
          Height = 24
          Date = 40590.000000000000000000
          Time = 40590.000000000000000000
          TabOrder = 3
        end
        object cbDesc: TCheckBox
          Left = 320
          Top = 85
          Width = 113
          Height = 17
          Caption = 'Descending'
          TabOrder = 4
        end
        object btnProfitReport: TBitBtn
          Left = 137
          Top = 144
          Width = 288
          Height = 47
          Caption = 'Profit report'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnProfitReportClick
        end
        object edVendors: TEdit
          Left = 138
          Top = 110
          Width = 287
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object btnRangeSku: TBitBtn
          Left = 347
          Top = 12
          Width = 78
          Height = 28
          Caption = 'Sku range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Style = bsNew
          TabOrder = 7
          WordWrap = True
          OnClick = btnRangeSkuClick
        end
        object cbUseRange: TCheckBox
          Left = 328
          Top = 19
          Width = 14
          Height = 17
          TabOrder = 8
        end
      end
    end
    object tchFeedback: TTabSheet
      Caption = 'Feedback request'
      ImageIndex = 4
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 1282
        Height = 568
        Align = alClient
        TabOrder = 0
        object Panel15: TPanel
          Left = 43
          Top = 49
          Width = 758
          Height = 471
          BorderStyle = bsSingle
          TabOrder = 0
          object Label37: TLabel
            Left = 80
            Top = 200
            Width = 99
            Height = 16
            Caption = 'SMTP server :'
          end
          object Label38: TLabel
            Left = 447
            Top = 200
            Width = 82
            Height = 16
            Caption = 'SMTP port :'
          end
          object Label39: TLabel
            Left = 80
            Top = 251
            Width = 86
            Height = 16
            Caption = 'From name :'
          end
          object Label40: TLabel
            Left = 80
            Top = 275
            Width = 86
            Height = 16
            Caption = 'From email :'
          end
          object Label41: TLabel
            Left = 80
            Top = 300
            Width = 67
            Height = 16
            Caption = 'Reply to :'
          end
          object Label42: TLabel
            Left = 80
            Top = 225
            Width = 85
            Height = 16
            Caption = 'SMTP user :'
          end
          object Label43: TLabel
            Left = 447
            Top = 225
            Width = 77
            Height = 16
            Caption = 'Password :'
          end
          object Label44: TLabel
            Left = 448
            Top = 385
            Width = 99
            Height = 16
            Caption = 'Mails per hour'
          end
          object lbFGreen: TLabel
            Left = 86
            Top = 124
            Width = 656
            Height = 20
            AutoSize = False
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbFRed: TLabel
            Left = 86
            Top = 156
            Width = 656
            Height = 20
            AutoSize = False
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 272
            Top = 16
            Width = 193
            Height = 16
            Caption = 'Last feedback request send'
          end
          object Label71: TLabel
            Left = 80
            Top = 325
            Width = 62
            Height = 16
            Caption = 'Copy to :'
          end
          object edCopyTo: TEdit
            Left = 196
            Top = 322
            Width = 439
            Height = 24
            TabOrder = 0
          end
          object edFromMail: TDBEdit
            Left = 196
            Top = 272
            Width = 439
            Height = 24
            DataField = 'email'
            DataSource = DM.dsSelfInfo
            TabOrder = 1
          end
          object edFromName: TDBEdit
            Left = 196
            Top = 248
            Width = 439
            Height = 24
            DataField = 'shortname'
            DataSource = DM.dsSelfInfo
            TabOrder = 2
          end
          object edPort: TDBEdit
            Left = 535
            Top = 197
            Width = 100
            Height = 24
            DataField = 'smtp_port'
            DataSource = DM.dsSelfInfo
            TabOrder = 3
          end
          object edUser: TDBEdit
            Left = 196
            Top = 222
            Width = 245
            Height = 24
            DataField = 'smtp_user'
            DataSource = DM.dsSelfInfo
            TabOrder = 4
          end
          object edPassword: TDBEdit
            Left = 517
            Top = 222
            Width = 118
            Height = 24
            DataField = 'smtp_password'
            DataSource = DM.dsSelfInfo
            PasswordChar = '*'
            TabOrder = 5
          end
          object btnSendRequest: TBitBtn
            Left = 196
            Top = 379
            Width = 119
            Height = 33
            Caption = 'Send request'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = btnSendRequestClick
          end
          object edMailsPerHour: TEdit
            Left = 410
            Top = 382
            Width = 33
            Height = 24
            TabOrder = 7
            Text = '80'
          end
          object Panel16: TPanel
            Left = 0
            Top = 39
            Width = 753
            Height = 76
            BevelInner = bvLowered
            BevelKind = bkFlat
            BorderStyle = bsSingle
            TabOrder = 8
            object lbLastSendDate: TLabel
              Left = 11
              Top = 35
              Width = 189
              Height = 20
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label45: TLabel
              Left = 51
              Top = 5
              Width = 53
              Height = 16
              Caption = 'Sent on'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label48: TLabel
              Left = 307
              Top = 5
              Width = 52
              Height = 16
              Caption = 'Order #'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label49: TLabel
              Left = 543
              Top = 5
              Width = 49
              Height = 16
              Caption = 'Sent to'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbOrderNo: TLabel
              Left = 227
              Top = 35
              Width = 237
              Height = 20
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbSentTo: TLabel
              Left = 487
              Top = 35
              Width = 258
              Height = 20
              AutoSize = False
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object edSmtp: TDBEdit
            Left = 196
            Top = 197
            Width = 245
            Height = 24
            DataField = 'smtp_server'
            DataSource = DM.dsSelfInfo
            TabOrder = 9
          end
          object edReplyTo: TDBEdit
            Left = 196
            Top = 297
            Width = 439
            Height = 24
            DataField = 'reply_To'
            DataSource = DM.dsSelfInfo
            TabOrder = 10
          end
        end
        object adminPanel2: TPanel
          Left = 807
          Top = 50
          Width = 562
          Height = 471
          BevelInner = bvLowered
          BevelKind = bkFlat
          TabOrder = 1
          object Label54: TLabel
            Left = 16
            Top = 40
            Width = 59
            Height = 16
            Caption = 'myname'
            FocusControl = edMyName
          end
          object Label55: TLabel
            Left = 263
            Top = 46
            Width = 73
            Height = 16
            Caption = 'shortname'
            FocusControl = edMyShortName
          end
          object Label56: TLabel
            Left = 16
            Top = 88
            Width = 64
            Height = 16
            Caption = 'company'
            FocusControl = edMyCompany
          end
          object Label57: TLabel
            Left = 263
            Top = 88
            Width = 136
            Height = 16
            Caption = 'companyshortname'
            FocusControl = edCompanyShortName
          end
          object Label58: TLabel
            Left = 16
            Top = 135
            Width = 58
            Height = 16
            Caption = 'address'
            FocusControl = edAddress
          end
          object Label59: TLabel
            Left = 16
            Top = 184
            Width = 44
            Height = 16
            Caption = 'pobox'
            FocusControl = edPoBox
          end
          object Label60: TLabel
            Left = 263
            Top = 184
            Width = 25
            Height = 16
            Caption = 'city'
            FocusControl = edCity
          end
          object Label61: TLabel
            Left = 16
            Top = 232
            Width = 35
            Height = 16
            Caption = 'state'
            FocusControl = edState
          end
          object Label62: TLabel
            Left = 119
            Top = 230
            Width = 21
            Height = 16
            Caption = 'zip'
            FocusControl = edZip
          end
          object Label63: TLabel
            Left = 263
            Top = 230
            Width = 51
            Height = 16
            Caption = 'country'
            FocusControl = edCountry
          end
          object Label64: TLabel
            Left = 16
            Top = 278
            Width = 44
            Height = 16
            Caption = 'phone'
            FocusControl = edPhone
          end
          object Label65: TLabel
            Left = 264
            Top = 278
            Width = 52
            Height = 16
            Caption = 'phone2'
            FocusControl = edPhone2
          end
          object Label66: TLabel
            Left = 16
            Top = 332
            Width = 21
            Height = 16
            Caption = 'fax'
            FocusControl = edFax
          end
          object Label67: TLabel
            Left = 216
            Top = 15
            Width = 95
            Height = 16
            Caption = 'Company info'
          end
          object edMyName: TDBEdit
            Left = 16
            Top = 62
            Width = 241
            Height = 24
            DataField = 'myname'
            DataSource = DM.dsSelfInfo
            TabOrder = 0
          end
          object edMyShortName: TDBEdit
            Left = 263
            Top = 62
            Width = 244
            Height = 24
            DataField = 'shortname'
            DataSource = DM.dsSelfInfo
            TabOrder = 1
          end
          object edMyCompany: TDBEdit
            Left = 16
            Top = 106
            Width = 241
            Height = 24
            DataField = 'company'
            DataSource = DM.dsSelfInfo
            TabOrder = 2
          end
          object edCompanyShortName: TDBEdit
            Left = 263
            Top = 106
            Width = 244
            Height = 24
            DataField = 'companyshortname'
            DataSource = DM.dsSelfInfo
            TabOrder = 3
          end
          object edAddress: TDBEdit
            Left = 16
            Top = 157
            Width = 491
            Height = 24
            DataField = 'address'
            DataSource = DM.dsSelfInfo
            TabOrder = 4
          end
          object edPoBox: TDBEdit
            Left = 16
            Top = 200
            Width = 241
            Height = 24
            DataField = 'pobox'
            DataSource = DM.dsSelfInfo
            TabOrder = 5
          end
          object edCity: TDBEdit
            Left = 263
            Top = 200
            Width = 244
            Height = 24
            DataField = 'city'
            DataSource = DM.dsSelfInfo
            TabOrder = 6
          end
          object edState: TDBEdit
            Left = 16
            Top = 248
            Width = 97
            Height = 24
            DataField = 'state'
            DataSource = DM.dsSelfInfo
            TabOrder = 7
          end
          object edZip: TDBEdit
            Left = 119
            Top = 248
            Width = 100
            Height = 24
            DataField = 'zip'
            DataSource = DM.dsSelfInfo
            TabOrder = 8
          end
          object edCountry: TDBEdit
            Left = 263
            Top = 248
            Width = 244
            Height = 24
            DataField = 'country'
            DataSource = DM.dsSelfInfo
            TabOrder = 9
          end
          object edPhone: TDBEdit
            Left = 16
            Top = 300
            Width = 241
            Height = 24
            DataField = 'phone'
            DataSource = DM.dsSelfInfo
            TabOrder = 10
          end
          object edPhone2: TDBEdit
            Left = 263
            Top = 300
            Width = 244
            Height = 24
            DataField = 'phone2'
            DataSource = DM.dsSelfInfo
            TabOrder = 11
          end
          object edFax: TDBEdit
            Left = 16
            Top = 354
            Width = 241
            Height = 24
            DataField = 'fax'
            DataSource = DM.dsSelfInfo
            TabOrder = 12
          end
          object btnSaveInfo: TButton
            Left = 328
            Top = 352
            Width = 179
            Height = 25
            Caption = 'Save company info'
            TabOrder = 13
            OnClick = btnSaveInfoClick
          end
        end
      end
    end
    object tshLoadData: TTabSheet
      Caption = 'Other'
      ImageIndex = 2
      object Label3: TLabel
        Left = 10
        Top = 44
        Width = 941
        Height = 20
        Caption = 
          'aaa                                                             ' +
          '                                                                ' +
          '                                           qqq        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 70
        Width = 941
        Height = 20
        Caption = 
          'aaa                                                             ' +
          '                                                                ' +
          '                                           qqq        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 113
        Width = 941
        Height = 20
        Caption = 
          'aaa                                                             ' +
          '                                                                ' +
          '                                           qqq        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 10
        Top = 87
        Width = 941
        Height = 20
        Caption = 
          'aaa                                                             ' +
          '                                                                ' +
          '                                           qqq        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnLoadInventory: TBitBtn
        Left = 8
        Top = 3
        Width = 225
        Height = 33
        Caption = 'Load inventory file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnLoadInventoryClick
      end
      object btnLoadOrders: TBitBtn
        Left = 239
        Top = 3
        Width = 225
        Height = 33
        Caption = 'Load orders file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnLoadOrdersClick
      end
      object btnLoadBNFInventory: TBitBtn
        Left = 932
        Top = 3
        Width = 225
        Height = 33
        Caption = 'Load BNF inventory file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnLoadBNFInventoryClick
      end
      object btnUnloadBNF: TBitBtn
        Left = 973
        Top = 265
        Width = 217
        Height = 33
        Caption = 'Unload BNF for Amazon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnUnloadBNFClick
      end
      object Rg1: TRadioGroup
        Left = 973
        Top = 136
        Width = 217
        Height = 97
        Items.Strings = (
          'Product'
          'Inventory'
          'Price'
          'ProductImage')
        TabOrder = 4
      end
      object btnLoadProfitReport: TBitBtn
        Left = 470
        Top = 3
        Width = 225
        Height = 33
        Caption = 'Load profit report file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnLoadProfitReportClick
      end
      object Panel8: TPanel
        Left = 8
        Top = 136
        Width = 513
        Height = 361
        BevelInner = bvSpace
        BevelKind = bkSoft
        TabOrder = 6
        object Label22: TLabel
          Left = 16
          Top = 56
          Width = 31
          Height = 16
          Caption = 'BNF'
        end
        object Label23: TLabel
          Left = 16
          Top = 112
          Width = 33
          Height = 16
          Caption = 'TMC'
        end
        object Label24: TLabel
          Left = 16
          Top = 168
          Width = 42
          Height = 16
          Caption = 'Shultz'
        end
        object Label25: TLabel
          Left = 372
          Top = 16
          Width = 82
          Height = 16
          Caption = 'Last update'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbLastUpdateBnf: TLabel
          Left = 332
          Top = 56
          Width = 141
          Height = 16
          Caption = 'YYYY MM DD HH:Mi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbLastUpdateTmc: TLabel
          Left = 332
          Top = 112
          Width = 141
          Height = 16
          Caption = 'YYYY MM DD HH:Mi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbLastUpdateShultz: TLabel
          Left = 332
          Top = 168
          Width = 141
          Height = 16
          Caption = 'YYYY MM DD HH:Mi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 16
          Top = 224
          Width = 41
          Height = 16
          Caption = 'MELE'
        end
        object lbLastUpdateMele: TLabel
          Left = 332
          Top = 224
          Width = 141
          Height = 16
          Caption = 'YYYY MM DD HH:Mi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 16
          Top = 288
          Width = 45
          Height = 16
          Caption = 'BWKD'
        end
        object lbLastUpdateBWKD: TLabel
          Left = 332
          Top = 288
          Width = 141
          Height = 16
          Caption = 'YYYY MM DD HH:Mi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnBnfInv: TBitBtn
          Left = 113
          Top = 48
          Width = 168
          Height = 33
          Caption = 'Update inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnBnfInvClick
        end
        object btnTmcInv: TBitBtn
          Left = 113
          Top = 104
          Width = 168
          Height = 33
          Caption = 'Update inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnTmcInvClick
        end
        object btnShultzInv: TBitBtn
          Left = 113
          Top = 160
          Width = 168
          Height = 33
          Caption = 'Update inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnShultzInvClick
        end
        object btnMeleInv: TBitBtn
          Left = 113
          Top = 216
          Width = 168
          Height = 33
          Caption = 'Update inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnMeleInvClick
        end
        object btnBWKDInv: TBitBtn
          Left = 113
          Top = 280
          Width = 168
          Height = 33
          Caption = 'Update inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnBWKDInvClick
        end
        object cbBnfUpdate: TCheckBox
          Left = 64
          Top = 56
          Width = 16
          Height = 17
          TabOrder = 5
        end
        object cbTmcUpdate: TCheckBox
          Left = 64
          Top = 112
          Width = 16
          Height = 17
          TabOrder = 6
        end
      end
      object adminPanel: TPanel
        Left = 527
        Top = 325
        Width = 663
        Height = 172
        BevelInner = bvRaised
        BevelKind = bkSoft
        TabOrder = 7
        object Label32: TLabel
          Left = 30
          Top = 8
          Width = 149
          Height = 16
          Caption = 'Amazon reports WMS'
        end
        object Label20: TLabel
          Left = 218
          Top = 12
          Width = 115
          Height = 16
          Caption = 'Path to Postgres'
        end
        object Label70: TLabel
          Left = 218
          Top = 44
          Width = 79
          Height = 16
          Caption = 'Year Month'
        end
        object btnReportList: TButton
          Left = 12
          Top = 27
          Width = 173
          Height = 25
          Caption = 'List'
          TabOrder = 0
          OnClick = btnReportListClick
        end
        object btnReportRequest: TButton
          Left = 12
          Top = 58
          Width = 173
          Height = 25
          Caption = 'Request'
          TabOrder = 1
          OnClick = btnReportRequestClick
        end
        object btnReportGet: TButton
          Left = 12
          Top = 91
          Width = 173
          Height = 25
          Caption = 'Download'
          TabOrder = 2
          OnClick = btnReportGetClick
        end
        object edPathToPostgres: TEdit
          Left = 336
          Top = 8
          Width = 297
          Height = 24
          TabOrder = 3
          Text = 'C:\Program Files\PostgreSQL\12'
        end
        object btnUpItemsProfit: TButton
          Left = 416
          Top = 39
          Width = 217
          Height = 25
          Caption = 'Update ItemsProfit table'
          TabOrder = 4
          OnClick = btnUpItemsProfitClick
        end
        object btnBackupDb: TButton
          Left = 216
          Top = 123
          Width = 97
          Height = 25
          Caption = 'DB Backup'
          TabOrder = 5
          OnClick = btnBackupDbClick
        end
        object btnDbRestore: TButton
          Left = 319
          Top = 123
          Width = 97
          Height = 25
          Caption = 'DB Restore...'
          TabOrder = 6
          OnClick = btnDbRestoreClick
        end
        object btnVacuum: TButton
          Left = 422
          Top = 123
          Width = 97
          Height = 25
          Caption = 'DB Vacuum'
          TabOrder = 7
          OnClick = btnVacuumClick
        end
        object btnUpdVndCosts: TButton
          Left = 415
          Top = 70
          Width = 218
          Height = 43
          Caption = 'Update Vendors and costs in ProfitReport table'
          TabOrder = 8
          WordWrap = True
          OnClick = btnUpdVndCostsClick
        end
        object edYear: TEdit
          Left = 307
          Top = 39
          Width = 47
          Height = 24
          TabOrder = 9
        end
        object edMonth: TEdit
          Left = 361
          Top = 39
          Width = 28
          Height = 24
          TabOrder = 10
        end
        object btnUpdateItemsSoldMonthly: TButton
          Left = 216
          Top = 69
          Width = 195
          Height = 25
          Caption = 'Update Items sold monthly'
          TabOrder = 11
          OnClick = btnUpdateItemsSoldMonthlyClick
        end
        object btnUpdOrdQty: TButton
          Left = 216
          Top = 93
          Width = 195
          Height = 25
          Caption = 'Update Ord Qty'
          TabOrder = 12
          OnClick = btnUpdOrdQtyClick
        end
        object btnProcessAll: TButton
          Left = 12
          Top = 123
          Width = 173
          Height = 25
          Caption = 'Process all files'
          TabOrder = 13
          OnClick = btnProcessAllClick
        end
        object btnTestEmail: TButton
          Left = 544
          Top = 123
          Width = 89
          Height = 25
          Caption = 'Test email'
          TabOrder = 14
          OnClick = btnTestEmailClick
        end
      end
      object Panel7: TPanel
        Left = 527
        Top = 139
        Width = 440
        Height = 180
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 8
        object Label9: TLabel
          Left = 56
          Top = 24
          Width = 149
          Height = 16
          Caption = 'Max price = MyCost * '
        end
        object Label15: TLabel
          Left = 56
          Top = 72
          Width = 145
          Height = 16
          Caption = 'Min price = MyCost * '
        end
        object Label14: TLabel
          Left = 282
          Top = 71
          Width = 21
          Height = 16
          Caption = '+ $'
        end
        object btnCreateCMFile: TBitBtn
          Left = 56
          Top = 120
          Width = 331
          Height = 49
          Caption = 'Create ChannelMax file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnCreateCMFileClick
        end
        object edMaxPrice: TEdit
          Left = 229
          Top = 20
          Width = 49
          Height = 24
          TabOrder = 1
          Text = '3'
        end
        object edMinPrice: TEdit
          Left = 229
          Top = 67
          Width = 49
          Height = 24
          TabOrder = 2
          Text = '0.93'
        end
        object edAddShipCost: TEdit
          Left = 309
          Top = 68
          Width = 36
          Height = 24
          TabOrder = 3
          Text = '3'
        end
      end
      object btnReconLoad: TBitBtn
        Left = 696
        Top = 3
        Width = 225
        Height = 33
        Caption = 'Load reconcile file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = btnReconLoadClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1290
    Height = 65
    Align = alTop
    TabOrder = 1
    object btnCreatePO: TSpeedButton
      Left = 4
      Top = 1
      Width = 128
      Height = 60
      Hint = 'Create Purchase orders for selected vendors or items'
      Caption = 'Create PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        B60C0000424DB60C000000000000360000002800000020000000190000000100
        200000000000800C000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E7F7E700C6EFBD0042BD310021A51800108408005AB5
        5200ADDEA500F7FFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00BDEFB5007BD66B0021B5100018A50800087B00001873
        100052AD5200E7F7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00EFF7EF00C6EFBD0039C6210029BD100021BD080021B5080010940800085A
        0000086300006BBD6300C6E7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00CEEFC60084D6730029BD100021BD080021BD080021BD080018A508000873
        0000086300003194290094CE8C00F7FFF700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700DEF7
        DE0052CE420029BD100021BD080021BD080021BD080021BD080021B508001094
        0800108400000873000021842100CEE7CE00F7F7F700FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEF7D600A5E7
        9C0031BD180029BD100021BD080021BD080021BD080021BD080021BD080018A5
        080010940800087B0000087B0000A5CEA500E7EFE700FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700DEF7DE0063CE520031BD
        180021BD080021BD080029BD100029BD100029BD100029BD100029BD100021BD
        080021AD080010840000087B00004A944A00ADD6AD00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7E700B5E7AD0039C6210029BD
        100021BD080021BD080029BD100021BD080021BD080029BD100029BD100021BD
        080021B5080010940800088400000873000084BD8400F7F7F700FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F7FFF7008CDE840021BD080021BD080021BD
        080029BD100029BD100021B5080021AD080021B5080021BD080029BD100021BD
        080021BD080021B50800189C08001073080008730000DEEFD600F7FFF700FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F7FFF700DEF7DE0021BD080021BD080021BD080021BD
        080029BD100029BD100021AD080010940800A5DE9C0021BD080021BD080029BD
        100029BD100021BD080018AD0800107B080008730000BDDEBD00EFF7EF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DEF7DE0021BD080021BD080021BD080021BD080029BD
        100021BD080021B50800108C0000CEE7CE00EFF7EF00C6EFC60021BD080021BD
        080029BD100021BD080021BD0800189C08001084080008730000BDDEBD00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0021BD080021BD080029BD100029BD100021BD080029BD
        100021BD080018AD0800C6E7C600EFF7EF00F7FFF700E7F7E7006BCE520021BD
        080029BD100029BD100021BD080021B5080010940800087300009CC69400F7FF
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F7FFF700DEF7D60021BD080021BD080021BD080021BD080029BD100021BD
        080018A50800108C0000F7FFF700FFFFFF00FFFFFF00FFFFFF00C6EFBD0042C6
        290021BD080029BD100029BD100021BD080021B50800107B0800086B0000D6E7
        D600F7FFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00DEF7D60021BD080021BD080029BD100021BD080021BD080021BD080021B5
        0800108C0000D6EFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7DE006BD6
        5A0021BD080029BD100029BD100021BD080021BD0800108C080018731000ADD6
        AD00E7F7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFF
        EF0021BD080029BD100021BD080021BD080021BD080021B50800189C08001094
        0800E7F7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6EF
        CE0094DE8C0021BD080029BD100021BD080021BD080021B50800109C0800086B
        0000086B0000F7FFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0021BD
        080021BD080029BD100021BD080021BD080021B5080018AD0800108400001084
        0000F7FFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7
        EF00C6EFC60021BD080021BD080029BD100021BD080021BD080018AD0800217B
        180008630000EFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF70021BD
        080029BD100021BD080021BD080021B50800108C0800087B0000A5D69C00E7F7
        DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F7FFF700ADE7A5006BD65A0029BD100029BD100021BD080029BD1000189C
        08001884100008630000DEEFDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEF7
        DE0021BD080021B5080021B50800189C080008730000087B0000CEEFCE00F7FF
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00DEF7D600A5E7940021BD080029BD100029BD100021BD080021B5
        0800189C080008630000B5CEB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FF
        F70018AD080018A50800108C0000087B00006BBD6B00B5DEAD00F7FFF700FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFF700EFF7EF0084D6730021BD080029BD100029BD100029BD
        100021BD100018941000086B0000DEEFDE00F7FFF700FFFFFF00FFFFFF00FFFF
        FF0021AD080018A508006BBD5A00189C0800C6EFC600E7F7E700FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFF700BDE7B5006BD65A0021BD080029BD100021BD
        080021BD080018A50800108C0000B5CEB500E7EFE700FFFFFF00FFFFFF00FFFF
        FF00FFFFF700F7FFF700F7FFF700F7FFF700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F7FFF700D6EFCE0052CE420021BD080029BD
        100021BD080021BD080021B508000873000000520000F7FFF700FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFFEF008CDE84004AC6390029BD
        100029BD100029BD100021BD100010940800086B0000EFEFEF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7EF00C6EFBD0021BD
        080021BD080029BD100029BD100021BD100031B5210008630000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7F7E7008CDE
        7B0021BD080029BD100029BD100029BD100039BD2900087B0000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7
        EF00CEEFCE0021BD080031C6210021BD080018AD080018A50800}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCreatePOClick
    end
    object Panel5: TPanel
      Left = 149
      Top = 1
      Width = 313
      Height = 60
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 8
        Width = 38
        Height = 16
        Caption = 'Items'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 6
        Top = 31
        Width = 51
        Height = 16
        Caption = 'Vendor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edItemSearch: TEdit
        Left = 69
        Top = 4
        Width = 170
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyUp = edItemSearchKeyDown
      end
      object btnSelectFound: TBitBtn
        Left = 240
        Top = 4
        Width = 70
        Height = 52
        Hint = 'Select all found items for PO'
        Caption = 'Select for PO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        WordWrap = True
        OnClick = btnSelectFoundClick
      end
      object cbVendors: TComboBox
        Left = 69
        Top = 31
        Width = 170
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnSelect = cbVendorsSelect
      end
    end
    object Panel6: TPanel
      Left = 921
      Top = 1
      Width = 189
      Height = 60
      BevelInner = bvLowered
      TabOrder = 3
      object btnShowPO: TBitBtn
        Left = 9
        Top = 4
        Width = 174
        Height = 25
        Caption = 'Purchase orders'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Purchaseorders1Click
      end
      object btnVendors: TBitBtn
        Left = 8
        Top = 31
        Width = 174
        Height = 25
        Caption = 'Vendors'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Editvendor1Click
      end
    end
    object Panel9: TPanel
      Left = 569
      Top = 1
      Width = 317
      Height = 60
      Hint = 'Select items by "Ctrl-Click" and then press "Set" button'
      BevelInner = bvLowered
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object Label26: TLabel
        Left = 78
        Top = 9
        Width = 52
        Height = 16
        Caption = 'Action: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnDoAction: TBitBtn
        Left = 249
        Top = 4
        Width = 64
        Height = 52
        Hint = 
          'Select items select vendor and then set choosen vendor for the i' +
          'tems'
        Caption = 'Do action'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        WordWrap = True
        OnClick = btnDoActionClick
      end
      object cbSetVendor: TComboBox
        Left = 78
        Top = 31
        Width = 168
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object btnSelectVisible: TBitBtn
        Left = 4
        Top = 4
        Width = 70
        Height = 52
        Hint = 'Select all visible items'
        Caption = 'Select visible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = btnSelectVisibleClick
      end
      object cbAction: TComboBox
        Left = 126
        Top = 6
        Width = 119
        Height = 22
        AutoComplete = False
        AutoCloseUp = True
        Style = csOwnerDrawFixed
        DropDownCount = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Text = 'Set vendor'
        OnSelect = cbActionSelect
        Items.Strings = (
          'Set vendor'
          'Set active'
          'Set inactive')
      end
    end
    object Panel13: TPanel
      Left = 464
      Top = 1
      Width = 104
      Height = 60
      BevelInner = bvLowered
      ShowCaption = False
      TabOrder = 1
      object Label53: TLabel
        Left = 30
        Top = 6
        Width = 38
        Height = 16
        Caption = 'Show'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1516278
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbShow: TComboBox
        Left = 6
        Top = 30
        Width = 92
        Height = 22
        AutoComplete = False
        AutoCloseUp = True
        Style = csOwnerDrawFixed
        DropDownCount = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnSelect = cbVendorsSelect
        Items.Strings = (
          'Active'
          'All items'
          'Inactive')
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 673
    Width = 1290
    Height = 60
    Align = alBottom
    TabOrder = 2
    object Label7: TLabel
      Left = 230
      Top = 19
      Width = 176
      Height = 16
      Caption = 'Active Inventory statistics'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPrintLines: TSpeedButton
      Left = 1170
      Top = 4
      Width = 98
      Height = 50
      Hint = 'Print first page of parts should be ordered immediately'
      Glyph.Data = {
        36190000424D3619000000000000360000002800000028000000280000000100
        2000000000000019000000000000000000000000000000000000FFFFFFFFFDFD
        FDFFFAF9FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFBFB
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFDFDFDFFFFFFFFFFFFFFFEFFFFFF
        FFFFFFFFFFFFF9F9F9FFF5F5F5FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFD
        FDFFFFFFFFFFFFFFFFFFFFFFFEFFF7F7F7FFF8F9F7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF2F1F1FFFDFDFDFFFDFD
        FDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAF9FBFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFF
        FFFFFFFFFFFFF9F9F9FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFD
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF1F0EFFFFFFFFFFFFDFF
        FFFFFBFEFFFFF8FBFCFFFAFCFDFFFDFDFDFFFDFDFDFFFDFDFDFFFFFFFEFFFDFD
        FDFFFDFDFDFFFFFFFFFFFFFFFEFFF9F9F9FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFDFFFFFFF2F1F1FFCDCB
        CCFFB0ADABFFACA9A6FFB5B4B3FFC7C8C5FFE9EAEAFFFFFFFFFFF7F7F7FFF9F9
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1F1FFE0DDDAFFB0ADABFF9D9A
        99FF979492FF9D9A99FF8D8C8BFF888685FFB5B4B3FFF2F1F1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9FBFFFDFD
        FDFFFDFDFDFFF5F5F5FFE9EAEAFFCDCBCCFFA5A5A5FF838282FFB5B4B3FFCDCB
        CCFFF1F0EFFFFFFFFFFFDBD9D5FF9D9A99FF888685FF979492FFE0E2E2FFF3F5
        F6FFFFFFFFFFFDFDFDFFFAF9FBFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE8E9E7FFB0ADABFF838282FF8D8C8BFFC2C4C3FFF4F3F2FFFFFFFFFFF7F7
        F7FFF8F9F7FFFFFFFFFFF7F7F7FFD2D2D0FFA5A5A5FF8D8C8BFF716F6AFFB5B4
        B3FFF8FFF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFEFFFFACAF
        B4FF818488FFACAFB4FFEAEDEEFFFDFFFFFFFAF9FBFFFAF9FBFFF4F3F2FFF6F4
        F3FFF2EFEAFFF2EFEAFFFFFBF7FFFCF8F4FFCBC6C1FF8E8982FFBBB7A8FF716F
        6AFF878B80FFFDFEFCFFFDFEFCFFF8F9F7FFFFFFFFFFFDFDFDFFFFFFFEFFFFFB
        FCFFFFFFFEFFFFFDF9FFFFFFF9FFFFFFF4FFFFFEECFFFEFEF0FFFFFFF9FFF8F3
        EFFFFFFFFBFFFFFFFEFFFDFEFCFFFFFEFFFFFDFFFFFFFDFFFFFF9899A5FFD5D9
        DEFFFBFEFFFFFAFDFFFFF2F1F1FFF7F9FAFFFAF9FBFFEDEDEDFFF2F1F1FFFBF9
        F8FFFCF8F4FFF6F1ECFFF8F3EFFFF9F6F1FFEBE6E1FFD1D0C9FF655F5CFF9794
        92FFA4A09AFF5F5A52FFE8E9E7FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFFFB
        FCFFFFFFFEFFFFFFFBFFF6F1ECFFE4DAD0FFDFD5C9FFF2EBE1FFFFFFF7FFFFFF
        FCFFFDFAF5FFFFFFFEFFF7F7F7FFFFFEFFFFFDFFFFFFF7F9FAFFE0E2E2FFEAEC
        F3FFF6F9FDFFF6F9FDFFFAFCFDFFFDFFFFFFFFFFFFFFF7F7F7FFF1F0EFFFF8F5
        F4FFF8F3EFFFF4EEE7FFEFE9E1FFF4EEE7FFFCF7F0FFFFFBF3FFE3E4D5FF817E
        74FF87837BFFBEBBB4FF504B42FFB5B4B3FFF7F7F7FFFFFFFFFFFFFCFFFFF1F0
        EFFFB0ADABFF787571FF6B6961FF817E74FF716F6AFF5F5A52FF8E8982FFFFFF
        F9FFFFFFF7FFEFECE9FFFFFFFCFFFFFFFEFFEAEDEEFFFDFFFFFFFBFEFFFFEAEC
        F3FFE2E6E9FFF6F9FDFFFDFFFFFFF7F9FAFFF7F7F7FFFFFFFFFFF8F9F7FFF1F0
        EFFFEBE8E4FFEEEAE5FFF1EBE4FFF1EBE4FFF1EBE4FFF4EEE7FFFFFFF4FFD1D0
        C9FF6B6961FF716F6AFFD1D0C9FF5F5A52FF8D8C8BFFB6ADB5FF787571FF8382
        82FF888685FFCBC6C1FFF9F6F1FFF9F6F1FFCECAC4FFBBB7A8FF7A7368FF6B69
        61FFF5F2E9FFFCF8F4FFFFFFFCFFFFFFFFFFE9EAEAFFFDFFFFFFF0F3F7FFFAFD
        FFFFF8FBFFFFEAECF3FFEAEDEEFFFAF9FBFFFFFFFEFFF9F6F5FFFFFFFCFFF9F6
        F1FFF2EFEAFFF6F1ECFFF6F1ECFFF1EDE5FFECE5DCFFECE5DCFFE3E4D5FFF7F9
        E9FFFEFEF0FF8E8982FF6B6961FFC7C8C5FF787571FF504B42FF8D8C8BFFF4F3
        F2FFF8F5F4FFEDEAE9FFE0E2E2FFF9F6F5FFD2D2D0FFA4A09AFFA4A09AFF8E89
        82FF504B42FFEBE6E1FFEFECE9FFF8F5F4FFFFFFFFFFFAF9FBFFFBFEFFFFFBFE
        FFFFF6F9FDFFE2E6E9FFE2E6E9FFFFFCFFFFFFFFFEFFFBF9F8FFFFFBF7FFFDFA
        F5FFFCF8F4FFF9F6F1FFF4EEE7FFEFE9E1FFEFE9E1FFF4EDE3FFEFF0E0FFE3E4
        D5FFE3E4D5FFEBE6E1FF817E74FF2B241CFF372F24FF372F24FF716F6AFFE0DD
        DAFFEFECE9FFFFFFFEFFF2F1F1FFE0DDDAFFC7C8C5FFC7C8C5FFC4BBB1FFA4A0
        9AFF8E8982FF504B42FFE5E1DDFFFFFBFCFFFDFDFDFFFFFFFFFFF3F6FAFFF8FB
        FFFFFDFFFFFFFDFFFFFFFFFFFEFFE9EAEAFFEBECEAFFFFFCFBFFFCF8F4FFFFFB
        F7FFFFFBF3FFFCF5ECFFF4EEE7FFF2EBE1FFECE5DCFFECE5DCFFDEDCC9FFFFFE
        ECFFDDDAC4FFCEC8B9FFDFD5C9FF5F5A52FF191006FF191006FF655F5CFFF4EE
        E7FFEEEAE5FFEFECE9FFE0E2E2FFFFFFFEFFE8E9E7FFC2C4C3FFBBB7A8FFC4BA
        A9FFA59990FF8E8982FF5F5A52FFE0DDDAFFF7F7F7FFF5F5F5FFFBFEFFFFF8FB
        FFFFF5F7F8FFFDFFFFFFFFFFFFFFF5F5F5FFEBECEAFFEDEAE9FFFFFFFBFFFFFF
        F9FFFFFBF3FFFCF5ECFFFCF5ECFFFCF5ECFFECE5DCFFD4CCC3FFCEC8B9FFBBB7
        A8FFBBB7A8FFB6ADA3FFADA49AFFA59990FF5F5A52FF372F24FF787571FFFCF7
        F0FFEBE8E4FFF8F3EFFFE8E9E7FFFAFBF9FFE0E2E2FFCDCBCCFFDCD2C4FFB6AD
        A3FFBBB7A8FFA4A09AFF716F6AFF6B6961FFE0DDDAFFFFFFFFFFF8FBFCFFFDFF
        FFFFFBFBFBFFF5F5F5FFFFFFFEFFFFFFFEFFEBE6E1FFDBD9D5FFDBD9D5FFFFFF
        FBFFF1EBE4FFFFFDF5FFECE5DCFFD4CCC3FFDFD5C9FFC4BBB1FFA7A18DFFB4AC
        96FF948B7BFF948B7BFF948B7BFF877663FF796851FF463828FF5F5A52FFECE1
        D4FFFFFBF3FFF4EEE7FFF5F2E9FFF0F1E7FFF4F7EEFFD1D0C9FFDCD2C4FFD9C8
        B3FFC4BAA9FFADA49AFFA59990FF928E8AFF8D8C8BFFFFFFFEFFF3F5F6FFFDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFFEDEAE9FFC0BCB8FFB0ADABFFD1D0C9FFF5EF
        E9FFFCF7F0FFFAEFE4FFE4DAD0FFDFD5C9FFADA49AFFA59990FF9A9385FF948B
        7BFF706658FF68583FFF564930FF2B241CFF2B241CFF191006FF504B42FFE4D6
        C4FFFCF5ECFFF4EDE3FFF1EDE5FFEAEFE5FFFFFDF5FFEAEFE5FFF0E1CDFFF4E8
        D8FFBBB7A8FFC4BBB1FFADA49AFF8E8982FFB5B4B3FFFBF9F8FFFFFFFFFFFFFF
        FFFFFBFBFBFFF8F9F7FFF8F9F7FFE5E1DDFFE0DDDAFFF1EBE4FFF1EBE4FFF5EF
        E9FF928E8AFFC4BBB1FFD4CCC3FFB6ADA3FFADA49AFF9A9385FF5E5046FF4638
        28FF2A1D0EFF2A1D0EFF372F24FF463828FF68583FFF796851FF8F7D6BFFE4D6
        C4FFFFF2DEFFFAF9E4FFFFFEECFFF8EEDFFFFAF9E4FFECEBD7FFF4E8D8FFE4D6
        C4FFE4D6C4FFDCD2C4FFB6ADA3FFA4A09AFFB0ADABFFFFFFFCFFFFFFFFFFFDFD
        FDFFFFFFFFFFFFFFFFFFFFFFFEFFDBD9D5FFE5E1DDFFF8F3EFFFFFFDF5FFD6D2
        CDFF191006FF5E5046FF9A9385FF7A7368FF5F5A52FF191006FF2A1D0EFF2A1D
        0EFF372F24FF68583FFF877663FFA29981FFD6BAA6FFE3D0B5FFE0D0BBFFF0E1
        CDFFE3D0B5FFCEC1AFFFA7A18DFF877663FF9A9385FFC4BAA9FFFFF2DEFFE4D6
        C4FFECE1D4FFDCD2C4FFC4BBB1FFBEBBB4FFA4A09AFFFFFFFCFFFFFFFFFFFBFB
        FBFFFFFFFEFFFFFFFEFFFFFFFCFFDAD6D2FFEFECE9FFF2EFEAFFEBE6E1FFCBC6
        C1FF372F24FF2A1D0EFF191006FF2A1D0EFF2A1D0EFF463828FF706658FF8783
        7BFFB4AC96FFC7B698FFC6AB96FFB9A589FFA88D71FF9D8268FFA88D71FF9476
        54FF68583FFF68583FFF68583FFF564930FF564930FF564930FFD9C8B3FFFFFE
        ECFFE4D6C4FFDFD5C9FFD6CFC6FFC4BBB1FFC2BEBAFFFDFAF5FFFFFFFFFFFFFF
        FEFFFFFFFEFFFBF9F8FFFFFFFBFFDAD6D2FFF6F1ECFFD6D2CDFFFFFDF5FFB6AD
        A3FF000000FF372F24FF504B42FF7A7368FF948B7BFFB6ADA3FFC4BAA9FFC4BA
        A9FFC4BAA9FFB4AC96FFD6BAA6FFFCE5C5FFF0DAB6FFE0C6A3FFA1885FFF9D82
        68FFA1885FFFB8A078FFD7C5A8FFE8D5B1FFB4AC96FF796851FF796851FFE0D0
        BBFFFDF5E4FFF4E8D8FFDCD2C4FFCBC6C1FFC5C1BBFFFFFFFBFFF9F6F5FFFFFF
        FEFFFFFFFEFFFFFFFEFFFFFFFCFFD6D2CDFFD6D2CDFF87837BFFC5C1BBFFB6AD
        A3FF463828FFAAA6A1FFC4BBB1FFC4BAA9FFCEC8B9FFCEC8B9FFC4BBB1FFA599
        90FF8F7D6BFF68583FFF9D8268FFD7C5A8FFE0C6A3FFD6B897FFD6B897FFF0D0
        ABFFFCE5C5FFF0DAB6FFE0C6A3FFE8D5B1FFF0DAB6FFE8D5B1FF796851FF8F7D
        6BFFF0E1CDFFFDF5E4FFDFD5C9FFE4DAD0FFC2BEBAFFFFFFFBFFFFFFFEFFFFFF
        FEFFFFFFFEFFF4F3F2FFFFFFFCFFEEEAE5FFFCF8F4FFA4A09AFFD6CFC6FFFCF5
        ECFFE4DAD0FFECE1D4FFC4BAA9FFECE5DCFFADA49AFF877663FF706658FF7066
        58FF8F7D6BFF877663FF9D8268FFC7B698FFD6B897FFD6B897FFD4AE8BFFB695
        71FFB69571FFB8A078FFB8A078FFB9A589FFC7B698FFD7C5A8FFE0D0BBFF8776
        63FF877663FFF8EEDFFFFAEFE4FFE4DAD0FFE5E1DDFFFCF8F4FFFFFFF9FFFFFF
        F9FFFFFBF7FFFFFFF9FFFFFFFBFFF6F1ECFFEBE6E1FFFAEFE4FFDFD5C9FFD7C5
        A8FFE0C6A3FFFCE5C5FFFFE0AFFFFFE0AFFFD3A658FF906D34FF947654FFAB8B
        5EFFB69571FFD5AA6AFFE5AB76FFF2B47BFFF2B47BFFE8A565FFE8A565FFE8A5
        65FFE09D5EFFE09D5EFFD39453FFD39453FFE09D5EFFE5AB76FFC0BCB8FFACA9
        A6FFA4A09AFF8E8982FFD6D2CDFFF2EFEAFFCDCBCCFFFDFBFAFFFFFFF9FFFFFF
        F9FFFFFFF9FFFFFFFBFFFFFFFBFFEBE6E1FFD4CCC3FFD4CCC3FFCEC1AFFFD7C5
        A8FFE8D5B1FFF0D0ABFFEFC590FFEFC590FFEFC590FFE3B978FFD4AE8BFFE7BA
        8FFFE7BA8FFFE7BA8FFFE5AB76FFE5AB76FFE8A565FFE8A565FFE8A565FFE09D
        5EFFD39453FFD39453FFBD7E44FFBD7E44FFBD7E44FFBD7E44FF8E8982FFBEBB
        B4FF979492FF9D9A99FF979492FFE5E1DDFFDBD9D5FFFFFFFEFFFFFBF7FFFFFF
        FBFFFFFFFCFFFFFFFCFFFFFFFCFFEEEAE5FFD6D2CDFFD6CFC6FFF4E8D8FFF4E8
        D8FFFCE5C5FFD6B897FFE0C6A3FFDFB887FFE7BA8FFFE3B978FFE3B978FFE3B9
        78FFD5AA6AFFD3A658FFD3A658FFD3A658FFD3A658FFD3A658FFB68E47FFB68E
        47FFB68E47FFB68E47FFA98647FF9D7939FF9D7939FF906D34FF716F6AFFAAA6
        A1FFB5B4B3FFC5C1BBFFBAB7B3FFD1D0C9FFF1F0EFFFFFFFFEFFFFFDF9FFFFFF
        FCFFFFFDF9FFFFFFFCFFFFFFFCFFF9F6F1FFEBE6E1FFF2EBE1FFFEFEF0FFFFF2
        DEFFE3D0B5FFC3A881FFD6B897FFE7BA8FFFDFB887FFD5AA6AFFD5AA6AFFD5AA
        6AFFD3A658FFD3A658FFD39453FFBE954DFFB48535FFB48535FFB68E47FFB485
        35FF9D7939FF9D7939FF9D7939FFA98647FFBD9A59FFB8A078FFBEBBB4FFD6D2
        CDFFEBE6E1FFD1D0C9FFC0BCB8FFE5E1DDFFFFFFFEFFFFFFFEFFFFFFFFFFFFFF
        FFFFFAFCFDFFF8FBFCFFFBFEFFFFF5F7F8FFEDEDEDFFF1F0EFFFEFE9E1FFFAEF
        E4FFCEC1AFFFB9A589FFB69571FFC3A881FFB69571FFC3A881FFBD9A59FFBD9A
        59FFBE954DFFB68E47FFA98647FFA98647FFB68E47FFBD9A59FFA98647FFAB8B
        5EFFB8A078FFC7B698FFC7B698FFB4AC96FFA29981FF948B7BFFA4A09AFFBAB7
        B3FF979492FF655F5CFF2B241CFFD6D2CDFFF9F6F5FFF4F3F2FFFBFBFBFFFFFF
        FFFFFBFEFFFFFBFEFFFFFDFFFFFFFBFEFFFFF5F5F5FFFCF8F4FFECE5DCFFF8EE
        DFFFE4D6C4FFD7C5A8FFB9A589FFB8A078FFA1885FFFAB8B5EFFBE954DFFB68E
        47FFA98647FFBE954DFFC8A363FFD5AA6AFFC8A363FFBD9A59FFC8A363FFAB8B
        5EFFA1885FFF947654FF796851FF68583FFF564930FF504B42FF87837BFF928E
        8AFF928E8AFF5F5A52FF2B241CFFDAD6D2FFFFFFFEFFFFFFFEFFF3F6FAFFFBFE
        FFFFFAFDFFFFFAFDFFFFFBFEFFFFFBFEFFFFFBFEFFFFFFFEFFFFEBE8E4FFE0DD
        DAFFE4DAD0FFECE1D4FFE0D0BBFFD7C5A8FFC6AB96FFB9A589FFC6AB96FFC6AB
        96FFD6B897FFD6BAA6FFC6AB96FFA88D71FF877663FF796851FF5E5046FF5E50
        46FF655F5CFF796D73FF827A84FF898597FF898597FF9899A5FFACA9A6FFACA9
        A6FFC5C1BBFFACA9A6FF8E8982FFDBD9D5FFFFFDFCFFFFFCFBFFFBFEFFFFFBFE
        FFFFF8FBFFFFF3F6FAFFFAFDFFFFFBFEFFFFF8FBFCFFFFFEFFFFFFFFFCFFF1EB
        E4FFF4EDE3FFE4DAD0FFE0D0BBFFC4BAA9FFE3D0B5FFE3D0B5FFF7D7C4FFF7D7
        C4FFD6BAA6FF9D8268FF463828FF2A1D0EFF564930FF8F7D6BFFA59990FFA599
        90FFADA49AFFADA4ABFFADA4ABFFAAA4B4FFAAA4B4FFB1AFC2FFB0ADABFFDAD6
        D2FFBAB7B3FFD1D0C9FF928E8AFFFDFAF5FFFFFFFEFFFDFBFAFFFBFEFFFFFBFE
        FFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFDFEFFFFFFFFFFFFFFFF
        FCFFFFFFFCFFFFFFF9FFFFFFF7FFFFFFF4FFFFFFF4FFFFFFF4FFFBF5FEFFFFFB
        FFFFE4DFE8FFC9BDC5FF9D9A99FF655F5CFF796D73FFCDCBCCFFB6ADB5FFBDB2
        B8FFADA4ABFFBDB2B8FF979492FFB6ADB5FFADA4ABFFAAA4B4FFBAB7B3FFCECA
        C4FFCBC6C1FFD6D2CDFF9D9A99FFE0DDDAFFFFFCFBFFFFFFFEFFFBFEFFFFFBFE
        FFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFDFEFFFFFFFFFFFFFFFF
        FCFFFFFFFCFFFFFFF9FFFFFFF7FFFFFFF4FFFFFFF4FFFFFFF4FFFDFAFFFFFFFB
        FFFFFFFCFFFFFFFBFFFFF5EDF4FFC9BDC5FFC3B7BDFFE4DFE8FFC9BDC5FFB6AD
        B5FFB0ADABFFBDB2B8FFA5A5A5FFADA4ABFFB0ADABFFB6ADB5FFBAB7B3FFC5C1
        BBFFC2BEBAFFDAD6D2FFCBC6C1FFC2BEBAFFFFFFFEFFFDFBFAFFFBFEFFFFFBFE
        FFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFDFFFFFFFDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFFFFFFFEFFFFFFFCFFFFFFFCFFFFFFFCFFFFFFFCFFF1FEFDFFF1FE
        FDFFF1FEFDFFF6FFFDFFF6FFFDFFF4FCF2FFEAEFE5FFEBEEDCFFF7F9E9FFD5D2
        BCFFBBB7A8FFB4AC96FFA7A18DFFA29981FFB4AC96FFC4BAA9FFC2BEBAFFCBC6
        C1FFCBC6C1FFE0DDDAFFEBE8E4FF979492FFFFFFFEFFFFFDFCFFFBFEFFFFFBFE
        FFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFDFFFFFFFDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFFFFFFFEFFFFFFFCFFFFFFFCFFFFFFFCFFFFFFFCFFF1FEFDFFF1FE
        FDFFF0FCF8FFF0FCF8FFF0FCF8FFFAFFF9FFFCFFF7FFE3E4D5FFF1F6E7FFECEB
        D7FFECEBD7FFECEBD7FFDDDAC4FFD5D2BCFFD5D2BCFFD5D2BCFFCECAC4FFD6D2
        CDFFE0DDDAFFE0DDDAFFEBE6E1FF87837BFFFFFFFEFFFFFFFEFFFDFFFFFFFDFF
        FFFFFDFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFAFFF9FFF8FF
        F6FFFAFFF9FFFAFFF9FFF8FFF6FFFAFFF9FFFDFFF8FFD4DACFFFDAE1D2FFEFF0
        E0FFE3E4D5FFEBEEDCFFCEC8B9FFDEDCC9FFD5D2BCFFD5D2BCFFD6D2CDFFDBD9
        D5FFEEEAE5FFE5E1DDFFEBE6E1FFB0ADABFFF4F3F2FFFFFFFEFFFDFFFFFFFDFF
        FFFFFDFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFF4FCF2FFF4FC
        F2FFFAFFF9FFFAFFF9FFF4FCF2FFF8FFF6FFFCFFF7FFE2E8DDFFF1F6E7FFFEFE
        F0FFE3E4D5FFE3E4D5FFBBB7A8FFEBEEDCFFFAF9E4FFFEFEF0FFEEEAE5FFEBE6
        E1FFF8F3EFFFF6F1ECFFFFFBF7FFF9F6F1FFFBF9F8FFFFFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFFFCFFFFFFFB
        FCFFFFFBFCFFFFFBFFFFFFF9FFFFFFFBFFFFFFFBFFFFFFF9FFFFCCC9D9FFD5D3
        E3FFD5D3E3FFEAECF3FFD5D3E3FFFBFAFFFFFBFAFFFFFFF9FFFFFFFBF7FFFFFD
        F9FFFFFBF7FFFFFFF9FFFFFFFCFFFFFFFCFFFFFFFEFFFFFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFBFEFFFFFFFCFFFFFBF5
        FEFFFBF5FEFFFFFBFFFFFFFCFFFFFFF9FFFFFBF5FEFFFBF5FEFFFDFAFFFFFBF5
        FEFFFBF5FEFFFDFAFFFFFBFAFFFFFBFAFFFFFBFAFFFFFBF5FEFFFFFDF9FFFFFF
        FBFFFFFFF9FFFFFFF9FFFFFFFBFFFFFBF7FFFDFBFAFFFFFFFEFF}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnPrintLinesClick
    end
    object lbSelectedLinesLbl: TLabel
      Left = 63
      Top = 18
      Width = 100
      Height = 16
      Caption = 'Selected lines'
      Visible = False
    end
    object lbSelectedLines: TLabel
      Left = 6
      Top = 15
      Width = 51
      Height = 20
      Caption = '99999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panel4: TPanel
      Left = 424
      Top = 1
      Width = 577
      Height = 56
      BevelInner = bvLowered
      BorderStyle = bsSingle
      TabOrder = 0
      object Label18: TLabel
        Left = 6
        Top = 6
        Width = 94
        Height = 16
        Caption = 'Total distinct '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTotalRec: TLabel
        Left = 119
        Top = 7
        Width = 48
        Height = 13
        AutoSize = False
        Caption = '000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 189
        Top = 6
        Width = 31
        Height = 16
        Caption = 'SKU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 30
        Width = 108
        Height = 16
        Caption = 'Total inventory '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbInventory: TLabel
        Left = 119
        Top = 31
        Width = 65
        Height = 16
        AutoSize = False
        Caption = '00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 189
        Top = 30
        Width = 38
        Height = 16
        Caption = 'items'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 267
        Top = 6
        Width = 135
        Height = 16
        Caption = 'Total Amazon price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbAmazonPrice: TLabel
        Left = 407
        Top = 7
        Width = 49
        Height = 16
        Caption = '000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 267
        Top = 30
        Width = 100
        Height = 16
        Caption = 'Total My price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbMyCost: TLabel
        Left = 407
        Top = 31
        Width = 49
        Height = 16
        Caption = '000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnRefresh: TSpeedButton
        Left = 500
        Top = 2
        Width = 71
        Height = 47
        Caption = 'Refresh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnRefreshClick
      end
    end
  end
  object OD: TOpenDialog
    DefaultExt = '*.txt'
    Left = 1080
  end
  object PopupMenu1: TPopupMenu
    Left = 1192
    object Setiteminactive1: TMenuItem
      Caption = 'Set item inactive'
      ShortCut = 16452
      OnClick = Setiteminactive1Click
    end
    object Setitemactive1: TMenuItem
      Caption = 'Set item active'
      ShortCut = 49217
      OnClick = Setitemactive1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AddItemtoPO1: TMenuItem
      Caption = 'Add/Remove Item to PO'
      ShortCut = 16449
      OnClick = AddItemtoPO1Click
    end
    object Emptyorderdate1: TMenuItem
      Caption = 'Empty order date'
      ShortCut = 16453
      OnClick = Emptyorderdate1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object UpdatemyCostinprofitreport1: TMenuItem
      Caption = 'Update myCost in profit report'
      ShortCut = 16469
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Receiveitem1: TMenuItem
      Caption = 'Receive item'
      ShortCut = 16466
      OnClick = Receiveitem1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object DeleteItem1: TMenuItem
      Caption = 'Delete Item'
      ShortCut = 16430
      OnClick = DeleteItem1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 1160
    object Purchaseorders1: TMenuItem
      Caption = 'View'
      object View1: TMenuItem
        Caption = 'Purchase orders'
        OnClick = Purchaseorders1Click
      end
      object Editvendor1: TMenuItem
        Caption = 'Vendors'
        OnClick = Editvendor1Click
      end
      object Warehouses1: TMenuItem
        Caption = 'Warehouses'
        OnClick = Warehouses1Click
      end
      object Shippingproblems1: TMenuItem
        Caption = 'Shipping problems'
        OnClick = Shippingproblems1Click
      end
      object Searchaddress1: TMenuItem
        Caption = 'Search address'
        OnClick = Searchaddress1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Refresh1: TMenuItem
        Caption = 'Refresh '
        OnClick = Refresh1Click
      end
    end
    object Ver1291: TMenuItem
      Caption = 'Ver. 6.15'
      Checked = True
      Enabled = False
    end
  end
  object TimerForUpdates: TTimer
    Interval = 3600000
    OnTimer = TimerForUpdatesTimer
    Left = 1008
    Top = 48
  end
  object TimerForFeedback: TTimer
    Enabled = False
    Interval = 3600000
    OnTimer = SendRequestByTimer
    Left = 1312
    Top = 48
  end
  object LoadFiles: TTimer
    Enabled = False
    Interval = 900000
    OnTimer = LoadFilesTimer
    Left = 1072
    Top = 48
  end
  object ExitTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = ExitTimerTimer
    Left = 1232
    Top = 48
  end
  object FormStorage1: TJvFormStorage
    AppStorage = IniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    VersionCheck = fpvcNocheck
    StoredProps.Strings = (
      'memRange.Lines'
      'edPathToPostgres.Text'
      'cbTmcUpdate.Checked'
      'cbBnfUpdate.Checked')
    StoredValues = <>
    Left = 881
    Top = 73
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 1120
    Bitmap = {
      494C010102000800040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F5F5F500E6E6E600DDDDDD00E5E5E500F3F3F300FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00EEEF
      EE00C7C9C7009B9F9B008C8F8C00A0A1A000C6C6C600EAEAEA00FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00EEEFEE00ADB7
      AE003A693D0018571C0029552B004C5B4D007F827F00BFBFBF00EDEDED00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F3F300B5BEB6000E5B
      130005750D00057D0C00066D0C000B5A0F004456460086888600C9C9C900F1F1
      F100FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C9CFCA00135E1700068E
      0F000695100006940F00068C0D0005770C0017581B004E5D4F0093959300D5D5
      D500F7F7F700FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00E4E6E5002F6C330005870E00089C
      1200079B11000799100007950F00068D0D00066F0C001F5423005D665E00A7A8
      A700E3E3E300FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F8F800789B7A0008760F0008A0140009A5
      140008A21300089E1200079A110007960F00058A0D0006640B002F5132007074
      7000BCBCBC00EFEFEF00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00DEE2DF0015601A00089C130009A7150009A7
      150009A6150008A31400089F1200079B110007940F0005870D00075A0C004455
      45008A8C8A00D5D5D500F9F9F900FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00F1F2F2007295740005750C0009A6150009A7150009A7
      150009A7150009A6150009A4140008A11300079B110006920F0005790D001453
      18005D665E00AFB0AF00E9E9E900FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F5F400C0C6C1000A5A0E0008A1140009A7150009A7150009A7
      150009A7150009A7150009A6150009A5140008A11300079B110006900F00045F
      0A003B503D007C7F7C00C5C5C500F2F2F200FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D8DAD900256529000791110009A7150009A7150009A7150009A7
      150009A7150009A7150009A7150009A7150009A5140008A11300079A10000586
      0E000B570F004D594E0094959400DBDBDB00FBFBFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00EFF0F000246728004DB1540011A51C0009A7150009A7150009A7150009A7
      150009A7150009A7150009A7150009A7150009A7150009A5140008A113000796
      100005760C001C511F00666C6600B6B6B600ECECEC00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F2F3
      F200B4BDB50018671D008BD290004DC0560009A7150009A7150009A7150009A7
      150009A3140009A3140009A7150009A7150009A7150009A7150009A51400089F
      130007941000055B0A004052420085878500CFCFCF00F5F5F500FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4F5F400C3C8
      C4001C6320008BCF8F009DDCA10090D7950045BC4E0009A7150009A7150008A1
      1400089312000888110009A3140009A7150009A7150009A7150009A7150009A4
      1400089E120006810D001256160056615700A0A2A000DFDFDF00F9F9F900FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900CED2CF00286A
      2C0087CB8C00A8E0AC00A3DEA8009EDCA2008FD795004BBE53000CA21800097E
      1100246328004B7F4E000889110009A5150009A7150009A7150009A7150009A6
      150008A31400089A110004670A002F513100696F6A00B2B3B200E7E7E700FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E8E700376E3A007FC2
      8300B2E3B600AFE2B300AAE1AE00A4DFA9009FDCA3008FD4940034953B004C76
      4F00D5D6D500F8F8F800437E4600078F100009A7150009A7150009A7150009A7
      150009A6150008A213000796110007620C0038533A007A7D7A00C0C0C000EDED
      ED00FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F8006E9370005FA86400B8E4
      BB00BBE7BF00B6E5B900B0E3B400AAE1AE0098D89D003F934500376E3A00D8D9
      D800F7F7F70000000000F1F6F200206A2400089B130009A7150009A7150009A7
      150009A7150009A6150008A2140006860E00105A15004558470086888600C8C8
      C800F1F1F100FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E9E9000D581100BBE5BE00C6EB
      C900C1E9C400BBE7BF00B2E3B6007EC583000E5912007D9C7F00EBEBEB00FBFB
      FB00000000000000000000000000EEF4EF0017611B0018A5230010A91B0009A7
      15000FA91B0017AC230023AF2E002EAF3800258F2C001F5C2200515D52008F90
      8F00CFCFCF00F4F4F400FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000649267007CBE8000CFEED100CCED
      CE00C2E9C500AEDFB1002D7D3200366F3900DADCDA00F6F6F600000000000000
      000000000000000000000000000000000000FEFFFF00145F18006AC4700071CC
      78006CCB740067C86E0061C669005BC4630053BD5B003094370021582300565E
      570096979600D5D5D500F6F6F600FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000047864B00A5D7A800C7EACA00B3E0
      B7004C995100125B1600A6B8A700EEEFEE00FCFCFC0000000000000000000000
      00000000000000000000000000000000000000000000FEFFFF001D6521004BA8
      51006BC772006CCB740067C86E0062C769005CC4640052BC59002E9336002255
      25005D635E00A0A1A000DDDDDD00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFF4F000156419001E6921001F64
      23008CA98E00ECECEC00FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFCFB006192
      64004FAA56006CC773006DCB740068C96F0062C769005CC5640051BC59002788
      2E002A532C00676B6700AFAFAF00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3ECE400ECF2ED00FCFC
      FC00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004E8651000D5911004AA851006AC8710069C9700063C76A005DC5650051BD
      59001E7A240034503600797B7900C3C3C3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B8E5E0015671A0063C26A0068C86F0064C76B005EC5
      66004BB55200136118004A564B00959695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3ECE4001B641F002E89340062C36A0064C7
      6B005EC566003AA041001C532000797C79000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFFFF009CBB9E00125D16002985
      2F0058BC600056BD5E0015671A00889389000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2BF
      A4001F6623001A671E0020652400DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBF2EC00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFF87FFF0000000000000000
      FFFFFFFFFFE03FFF0000000000000000FFFFFFFFFFC01FFF0000000000000000
      FFFFFFFFFF800FFF0000000000000000FFFFFFFFFF8007FF0000000000000000
      FFFFFFFFFF0003FF0000000000000000FFFFFFFFFE0003FF0000000000000000
      FFFFFFFFFE0001FF0000000000000000FFFFFFFFFC0000FF0000000000000000
      FFFFFFFFF80000FF0000000000000000FFFFFFFFF800007F0000000000000000
      FFFFFFFFF000007F0000000000000000FFFFFFFFE000003F0000000000000000
      FFFFFFFFC000001F0000000000000000FFFFFFFFC000000F0000000000000000
      FFFFFFFF8000000F0000000000000000FFFFFFFF800000070000000000000000
      FFFFFFFF000400030000000000000000FFFFFFFF000E00010000000000000000
      FFFFFFFF003F00000000000000000000FFFFFFFF007F80000000000000000000
      FFFFFFFF01FFC0000000000000000000FFFFFFFF87FFF0000000000000000000
      FFFFFFFFFFFFFC000000000000000000FFFFFFFFFFFFFE000000000000000000
      FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFE00000000000000000
      FFFFFFFFFFFFFFF80000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
      000000000000}
  end
  object GetReporSettlement: TTimer
    Enabled = False
    Interval = 5400000
    OnTimer = GetReporSettlementTimer
    Left = 1144
    Top = 48
  end
  object IniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoReload = True
    Location = flCustom
    SubStorages = <>
    SynchronizeFlushReload = True
    Left = 840
    Top = 72
  end
  object SMTP: TIdSMTP
    MailAgent = 'MS Outlook'
    AuthType = satSASL
    SASLMechanisms = <>
    Left = 768
    Top = 496
  end
end
