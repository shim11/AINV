object fmSplitPO: TfmSplitPO
  Left = 0
  Top = 0
  Caption = 'Unsplitted items list'
  ClientHeight = 632
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 41
    Align = alTop
    PopupMenu = PopupMenu2
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 29
      Height = 16
      Caption = 'PO #'
    end
    object lbPO: TLabel
      Left = 80
      Top = 6
      Width = 61
      Height = 19
      Caption = 'PONUM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 560
    Width = 392
    Height = 72
    Align = alBottom
    PopupMenu = PopupMenu2
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 78
      Height = 16
      Caption = 'Warehouse #'
    end
    object Label3: TLabel
      Left = 16
      Top = 11
      Width = 79
      Height = 16
      Caption = 'Amazon PO #'
    end
    object cbWarehouse: TComboBox
      Left = 104
      Top = 40
      Width = 145
      Height = 24
      TabOrder = 0
    end
    object btnSavePO: TButton
      Left = 283
      Top = 14
      Width = 90
      Height = 42
      Caption = ' Send to "Outlook"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnSavePOClick
    end
    object edAmazonPO: TEdit
      Left = 104
      Top = 8
      Width = 142
      Height = 24
      TabOrder = 2
    end
  end
  object dbgUnsplittedItems: TjvDBGrid
    Left = 0
    Top = 41
    Width = 392
    Height = 519
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
    ParentFont = False
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    MultiSelect = True
    RowColor1 = clBlack
    RowColor2 = clBlack
    Columns = <
      item
        Expanded = False
        FieldName = 'sku'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 330
        Visible = True
      end
      item
        Color = 12711161
        Expanded = False
        FieldName = 'checked'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 20
        Visible = True
      end>
  end
  object PopupMenu2: TPopupMenu
    Left = 200
    Top = 56
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
