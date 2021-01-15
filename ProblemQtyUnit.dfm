object fmShipQtyProblem: TfmShipQtyProblem
  Left = 0
  Top = 0
  Caption = 'Problem shipping items quantity'
  ClientHeight = 613
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu2
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 549
    Height = 541
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 539
    ExplicitHeight = 539
    object dbgShipId: TJvDBGrid
      Left = 1
      Top = 1
      Width = 547
      Height = 539
      Align = alClient
      DataSource = DM.dsReconReport
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgShipIdDrawColumnCell
      OnDblClick = dbgShipIdDblClick
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 29
      TitleRowHeight = 23
      Columns = <
        item
          Expanded = False
          FieldName = 'shipid'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Title.Alignment = taCenter
          Title.Caption = 'Ship ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'shipcreatedate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Title.Alignment = taCenter
          Title.Caption = 'Create date'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 144
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'deleted'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          PickList.Strings = (
            'Active'
            'Deleted')
          Title.Alignment = taCenter
          Title.Caption = 'Delete'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 78
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 33
    Align = alTop
    PopupMenu = PopupMenu2
    TabOrder = 1
    ExplicitWidth = 539
    object cbShowDeleted: TCheckBox
      Left = 194
      Top = 8
      Width = 161
      Height = 17
      Caption = ' Show Deleted'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cbShowDeletedClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 574
    Width = 549
    Height = 39
    Align = alBottom
    PopupMenu = PopupMenu2
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 177
      Height = 19
      Caption = 'Total shipping problems '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbCount: TLabel
      Left = 200
      Top = 8
      Width = 45
      Height = 19
      Caption = '00000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 48
    Top = 8
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
