object fmPo: TfmPo
  Left = 754
  Top = 386
  Caption = 'View Purchase Order before send'
  ClientHeight = 614
  ClientWidth = 1029
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu2
  Position = poMainFormCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1029
    Height = 139
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
      Width = 516
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
      Left = 16
      Top = 104
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
      Top = 48
      Width = 464
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
      OnDblClick = edToVendorDblClick
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
      Left = 98
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
      Left = 98
      Top = 104
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
    object Label5: TLabel
      Left = 552
      Top = 77
      Width = 81
      Height = 16
      Caption = 'Amazon PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 552
      Top = 35
      Width = 76
      Height = 16
      Caption = 'Label prep'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 263
      Top = 80
      Width = 74
      Height = 16
      Caption = 'Ship from :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label11: TLabel
      Left = 263
      Top = 104
      Width = 57
      Height = 16
      Caption = 'Ship to :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbShipFrom: TLabel
      Left = 351
      Top = 80
      Width = 74
      Height = 16
      Caption = 'Ship from :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbShipTo: TLabel
      Left = 351
      Top = 104
      Width = 74
      Height = 16
      Caption = 'Ship from :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object cbAmazonPo: TComboBox
      Left = 636
      Top = 75
      Width = 216
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'cbAmazonPo'
      OnSelect = cbAmazonPoSelect
    end
    object cbLabelPrep: TComboBox
      Left = 636
      Top = 32
      Width = 216
      Height = 24
      TabOrder = 1
      Text = 'AMAZON_LABEL_PREFERRED'
      Items.Strings = (
        'AMAZON_LABEL_PREFERRED'
        'SELLER_LABEL'
        'AMAZON_LABEL_ONLY')
    end
    object btnCreateLinesFromExcel: TBitBtn
      Left = 914
      Top = 32
      Width = 97
      Height = 41
      Caption = 'Add lines from Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btnCreateLinesFromExcelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 545
    Width = 1029
    Height = 69
    Align = alBottom
    TabOrder = 1
    object Label17: TLabel
      Left = 8
      Top = 37
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
      Left = 113
      Top = 35
      Width = 123
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
    object btnRefresh: TSpeedButton
      Left = 242
      Top = 34
      Width = 28
      Height = 25
      Hint = 'Refresh total cost'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000F6F4FFFFFDF9
        FFFFFFF4FFFFFFF7FFFFFFFCFFFFFDFFFEFFF2FFF5FFF4FFF8FFF2FBEEFFFFFF
        F7FFFDEAE5FFFFFCFBFFFFEEF3FFFFFAFFFFFFFBFFFFFAF5FEFFF4F8FFFFFAFC
        FFFFF5F3F9FFFDFFFFFFF6FFFBFFECFFF8FFDFFFF4FFD6FFECFFE3FFF1FFEFFF
        F2FFFFFFF4FFFFFFF5FFFFF9F3FFFAF3F0FFF8FFFEFFECFDFAFFECFDF4FFF3FF
        F9FFF4FFF5FFDBF4E0FFDDFFF0FF368259FF15804FFF1C905BFF0C7641FF70C4
        94FFD9FFE1FFE9FFE1FF8C9F84FFD3F0D7FFD9FFF1FFD1FFF5FFF6FFF4FFECFF
        EAFFE7FFE6FFE6FFEDFF64A47AFF29834EFF23985BFF0F9150FF1A9857FF1E90
        51FF2F854FFF4C915FFF32683DFFDDFFEAFFD8FFEDFFC5FEDDFFFFFFF1FFF9FF
        EDFFE5FFE4FF9AC6A1FF316A3DFF9ADFACFFCAFFDDFFB2FFCCFF5FC584FF087B
        38FF138E4EFF1C9055FF399562FFCFFFE4FFF3FFEBFFFFFFEDFFF9F8EAFFFDFF
        F4FFF1FFF1FF587A5BFFA6CDA7FFD6FED4FFE4FFDDFFE1FFE2FFC7FFDAFF4EAF
        76FF108A4EFF047C45FF218053FFCEFFE3FFFFFFF0FFFFFFF0FFF6FFFCFFF3FF
        F8FFF6FFF8FFF3FEEEFFF2F9E4FFFFFFEDFFFFFFE7FFF8FFE7FF5E8A63FF3A7C
        53FF1C724AFF338A66FF428369FFE4FFF5FFFBF9EFFFFFFBF6FFECFDFAFFF1FF
        FEFFEAFFF7FFEFFFF8FFF4FFF4FFF8FFF1FFF9FFEAFFFAFFEDFFEFFFEDFFD5FF
        E0FFD8FFF1FFCEFFEEFFD3FFEFFFE8FFFBFFF8FDFBFFFFFFFEFFF6FFFFFFE2F8
        F3FFD8FFF9FF367561FF368064FF297252FF387152FF689273FFECFFEEFFD9F4
        DAFFECFFF2FFE4FFF1FFD9FDEFFFDBFFF6FFE3FFFFFFE4FFFFFFFFFFFBFFEFFF
        F9FFC8FFF0FF2F896BFF087751FF168559FF48A277FFC1FFDCFFE2FFE8FFEDFF
        EBFFE3FEE4FFAAC7B0FF698E7AFFD4FBECFFE1FFFCFFC9EEE6FFFFFDECFFF8FF
        F1FFC0FFE3FF1C8558FF088C57FF048950FF1E8B53FF75C993FFCEFFD9FFE1FF
        E4FF9FD1A9FF3F6F4BFF83AF92FFE8FFF2FFF4FFF5FFFBFFF7FFFFFFEBFFFAFF
        EEFFDCFFEDFF1B6B40FF2F9762FF0F8046FF20874DFF2E8C51FF337F49FF478A
        57FF488154FF5F8E67FFEAFFEEFFF6FFF1FFF9F9E9FFFFFFF5FFF3FFF2FFEEFF
        EBFFEEFDE2FF8FA182FFEFFFE9FFD9FFE0FF81CE9BFF1E7B44FF2F8B56FF2879
        48FF689D75FFEFFFEBFFFFFFEFFFFFFFF2FFFFF3EAFFFFFBF4FFEAFFF7FFF4FF
        F8FFFFFFF5FFF8EBDBFFFFFFF0FFFBFFEDFFD1FFDFFFCAFFEAFFC3FFEBFFBEFF
        E1FFD8FFE5FFF6FFF4FFFFFAF1FFFFF6F3FFFFFDFEFFFFFDFFFFE9F7FDFFF4FA
        FFFFFFFDFFFFFFFDFEFFFFFFFBFFFFFFF8FFE3FAEBFFE3FFF5FFDCFFF7FFDFFF
        F8FFECFFFCFFE1ECEAFFFDFDFFFFF9F5FFFFFBFAFFFFEDEFFFFFF4FBFFFFF4F5
        FFFFFFFAFFFFFFF4FCFFFFFCFFFFFFFEFDFFF8FFFCFFE8FFF6FFE6FFF8FFEAFF
        FEFFE6F5F7FFF6FEFFFFF1F4FFFFEAEEFFFFF3F9FFFFEFF9FFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRefreshClick
    end
    object btnArchive: TSpeedButton
      Left = 966
      Top = 15
      Width = 47
      Height = 42
      Cursor = crHandPoint
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000000000000000
        000000000000000000000000000000000000141D26202A336868683434340000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000D131A334D665986B32D5986
        2B38456868682D2D2D0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000003A5673537DA666
        99CC6699CC3366992D5A86202A337070702D2D2D000000000000000000000000
        000000000000000000000000000000000000000000000000141D262D43596699
        CC70A3D673A6D96DA0D36699CC336699336699336699202A3368686834343400
        00000000000000000000000000000000000000000000000000000D131A334D66
        5986B36DA0D380B3E66DA0D373A6D980B3E66699CC3366993366993366992D59
        862B38456868682D2D2D00000000000000000000000000000000000000000000
        00001A26336699CC4A7DCC6093C64D80B33A6DA04D80B380B3E66699CC3D70A3
        4679AC3366993366992D5A86202A337070702D2D2D0000000000000000000000
        000000000000000000001A26336699CC1A4D8030639626598C1D50832D609366
        99CC70A3D6577DA36D80994070A3336699336699336699202A33686868343434
        0000000000000000000000000000000000001A26336699CC1A4D802053863366
        99598CBF6DA0D380B3E686A6C6879AAD6968756086B33366993366993366992D
        59862B38456868682D2D2D0000000000000000000000000000001A26336699CC
        5386B95386B96699CC83B6E989B2DC808C99939497A7A4A481818129333D6DA0
        D33366993366993366992D5A86202A337070702D2D2D00000000000000000000
        00001A26336699CC70A3D67BAADA91B7DD868F988D8C8CAEABABC8C7C7D3D3D3
        999999151515768089608DB93A6DA0336699336699336699202A336868683434
        34000000000000000000202D3A80B3E66786A68A9DAF8E8C8CAEACACBFBEBED5
        D5D5DBDBDBE1E1E1A2A2A21515156B696944515E6F9BC8336699336699336699
        2D59862B38456868682D2D2D0000000000002633406093C623303DA3A1A1C2C1
        C1D3D3D3DADADADDDDDDF1F1F1D6D6D66B6B6B1919197B78783C3C3C3A444E6D
        A0D33366993366993366992D5A86202A335959590000000000000000003A4D60
        364049F7F7F7DDDDDDE4E4E4E1E1E1D0D0D0848484898989E2E5E737393A8683
        83525050292828768089608DB93A6DA03366993366990D1A2643434300000000
        00000000000000001A1A1AFBFBFBEEEEEEB5B5B59E9E9E919191D7D7D7DBDBDB
        A1A0A07B7B7BA6A6A65250502928286B696944515E6F9BC83366993366990D1A
        260000000000000000000000000000001A1A1ADCDCDC737373A6A6A6C7C7C7F7
        F7F7949494848484C2C2C2D9D9D95050506867673434347B78783C3C3C3A444E
        6DA0D33366990D1A260000000000000000000000000000001414141C1C1C8484
        84D6D6D6B4B4B46A6A6AC0C0C0D4D4D4ACABAB787777DDDDDDCACACA2E2E2E86
        83835250502928281D50836093C613202D000000000000000000000000000000
        0000000909095A5A5A4B4B4BA5A9AADDDDDDA4A4A4919191A6A6A6D5D5D59191
        91919191787878A6A6A652505029282813467973A6D926334000000000000000
        00000000000000000000000202020909091C1C1C7E8081848484B4B4B4B6B5B5
        AEADADB0AEAEB7B7B7B5B3B3ACABAB9997978E8E8E3434343D668F808C992023
        2600000000000000000000000000000000000000000000000000000005050565
        696A565859878787D6D6D6BDBDBD6A6A6AA4A4A4DDDDDDB7B7B77575750D0D0D
        0000000000000000000000000000000000000000000000000000000000000000
        00000000040404090909141414D2D5D7989797959494DDDDDDB7B7B791919122
        2222111111000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001A1A1A353738757575D9D9D96A6A
        6A3E3E3E11111100000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000090909
        5E5C5C4D4C4C0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000404042727270F0F0F000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Layout = blGlyphTop
      OnClick = btnArchiveClick
    end
    object Label7: TLabel
      Left = 10
      Top = 13
      Width = 87
      Height = 16
      Caption = 'Lines count :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbLinesCount: TLabel
      Left = 157
      Top = 13
      Width = 25
      Height = 16
      Caption = '000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 147
      Top = 13
      Width = 6
      Height = 16
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSelectedCount: TLabel
      Left = 115
      Top = 13
      Width = 25
      Height = 16
      Caption = '000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSavePO: TBitBtn
      Left = 692
      Top = 14
      Width = 124
      Height = 42
      Caption = ' Send to vendor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = sendMailPOToVendor
    end
    object btnCreateAmazonPlan: TBitBtn
      Left = 411
      Top = 15
      Width = 126
      Height = 42
      Caption = 'Split PO lines by Amazon'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnCreateAmazonPlanClick
    end
    object btnCreateShip: TBitBtn
      Left = 536
      Top = 15
      Width = 134
      Height = 42
      Caption = 'Confirm shippings '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btnCreateShipClick
    end
    object btnPrintItemLabels: TBitBtn
      Left = 276
      Top = 15
      Width = 104
      Height = 42
      Caption = 'Print item'#39's labels'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      WordWrap = True
      OnClick = btnPrintItemLabelsClick
    end
    object btnSplit199: TBitBtn
      Left = 205
      Top = 10
      Width = 65
      Height = 22
      Caption = 'Split PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnSplit199Click
    end
    object cbAttLabels: TCheckBox
      Left = 832
      Top = 27
      Width = 109
      Height = 17
      Caption = 'Attach labels'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 139
    Width = 1029
    Height = 406
    Align = alClient
    TabOrder = 2
    object dbgPurchaseOrders: TDBGrid
      Left = 1
      Top = 1
      Width = 1027
      Height = 404
      Align = alClient
      DataSource = DM.dsPOLines
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgPurchaseOrdersDblClick
      OnKeyDown = dbgPurchaseOrdersKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'line'
          Title.Alignment = taCenter
          Title.Caption = '#'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MySku'
          Title.Alignment = taCenter
          Title.Caption = 'SKU'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 226
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'caseQty'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Case'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 37
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'fldQtyOrd30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qty 30'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'fldQtyOrd10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qty 10'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clPurple
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'profitDol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Profit $'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'profitPer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clOlive
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Profit%'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clOlive
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
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
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'price'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'whname'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'labelprep'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Label prep'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'shipid'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'ShipId'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 131
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 8
    object Deleteline1: TMenuItem
      Caption = 'Delete line'
      ShortCut = 46
      OnClick = Deleteline1Click
    end
    object Renumberlines1: TMenuItem
      Caption = 'Renumber lines'
      ShortCut = 16500
      OnClick = Renumberlines1Click
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
  object PopupMenu2: TPopupMenu
    Left = 16
    Top = 8
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Caption = 'Exit'
      ShortCut = 27
      OnClick = Exit1Click
    end
  end
end
