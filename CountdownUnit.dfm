object fmCountDown: TfmCountDown
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Shutdown'
  ClientHeight = 110
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 110
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 499
    ExplicitHeight = 109
    object Label1: TLabel
      Left = 14
      Top = 41
      Width = 228
      Height = 23
      Caption = 'Please save your work, left '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbCounter: TLabel
      Left = 244
      Top = 41
      Width = 26
      Height = 25
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSecTo: TLabel
      Left = 278
      Top = 41
      Width = 177
      Height = 23
      Caption = 'seconds to shutdown'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 48
    Top = 8
  end
end
