object fmSkuPurchaseOrders: TfmSkuPurchaseOrders
  Left = 451
  Top = 540
  Caption = 'Sku Purchase orders'
  ClientHeight = 367
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 367
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    ExplicitWidth = 420
    object dbgSkuPurchaseOrders: TJvDBGrid
      Left = 1
      Top = 1
      Width = 521
      Height = 365
      Align = alClient
      DataSource = DM.dsSkuPo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgSkuPurchaseOrdersDblClick
      TitleButtons = True
      OnGetBtnParams = dbgSkuPurchaseOrdersGetBtnParams
      OnTitleBtnClick = dbgSkuPurchaseOrdersTitleBtnClick
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 20
      TitleRowHeight = 20
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'po'
          Title.Alignment = taCenter
          Title.Caption = 'PO#'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'line'
          Title.Alignment = taCenter
          Title.Caption = 'Line'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'orderdate'
          Title.Alignment = taCenter
          Title.Caption = 'Order date'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 192
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qty'
          Title.Alignment = taCenter
          Title.Caption = 'Qty'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 64
    object ReceivePO1: TMenuItem
      Caption = 'Receive PO'
      ShortCut = 16466
    end
    object DeletePO1: TMenuItem
      Caption = 'Delete PO'
      ShortCut = 16452
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      ShortCut = 27
      OnClick = Exit1Click
    end
  end
end
