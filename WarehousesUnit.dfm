object fmWarehouses: TfmWarehouses
  Left = 0
  Top = 0
  Caption = 'Warehouse address'
  ClientHeight = 239
  ClientWidth = 357
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
    Width = 357
    Height = 17
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 198
    Width = 357
    Height = 41
    Align = alBottom
    TabOrder = 1
    object PMDBNavigator1: TPMDBNavigator
      Left = 16
      Top = 0
      Width = 319
      Height = 39
      DataSource = DM.dsWarehouses
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbLocate, nbFilter, nbClose]
      ParentShowHint = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 17
    Width = 357
    Height = 181
    Align = alClient
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 6
      Width = 29
      Height = 16
      Caption = 'WH#'
    end
    object Label2: TLabel
      Left = 16
      Top = 34
      Width = 46
      Height = 16
      Caption = 'Address'
    end
    object dbeName: TDBEdit
      Left = 57
      Top = 6
      Width = 279
      Height = 24
      DataField = 'WhName'
      DataSource = DM.dsWarehouses
      TabOrder = 0
    end
    object dbeLine1: TDBEdit
      Left = 16
      Top = 56
      Width = 320
      Height = 24
      DataField = 'Line1'
      DataSource = DM.dsWarehouses
      TabOrder = 1
    end
    object dbeLine2: TDBEdit
      Left = 16
      Top = 86
      Width = 320
      Height = 24
      DataField = 'Line2'
      DataSource = DM.dsWarehouses
      TabOrder = 2
    end
    object dbeLine3: TDBEdit
      Left = 16
      Top = 116
      Width = 320
      Height = 24
      DataField = 'Line3'
      DataSource = DM.dsWarehouses
      TabOrder = 3
    end
    object dbeLine4: TDBEdit
      Left = 16
      Top = 146
      Width = 320
      Height = 24
      DataField = 'Line4'
      DataSource = DM.dsWarehouses
      TabOrder = 4
    end
  end
end
