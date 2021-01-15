object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 725
  Width = 1023
  object dsItems: TDataSource
    DataSet = tbItems
    Left = 112
    Top = 104
  end
  object dsVendors: TDataSource
    DataSet = tbVendors
    Left = 40
    Top = 104
  end
  object dsPO: TDataSource
    DataSet = tbPo
    Left = 304
    Top = 112
  end
  object dsPOLines: TDataSource
    DataSet = tbPOLines
    Left = 368
    Top = 112
  end
  object dsAInv: TDataSource
    DataSet = qAInv
    Left = 176
    Top = 8
  end
  object dsProfitReport: TDataSource
    DataSet = tbProfitReport
    Left = 528
    Top = 112
  end
  object dsWarehouses: TDataSource
    DataSet = tbWarehouses
    Left = 600
    Top = 112
  end
  object dsUnsplittedItems: TDataSource
    DataSet = tbUnsplittedItems
    Left = 440
    Top = 112
  end
  object tbVendors: TFDTable
    AfterInsert = tbVendorsAfterInsert
    AfterPost = tbVendorsAfterPost
    BeforeDelete = tbVendorsBeforeDelete
    IndexFieldNames = 'vendorname'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'vendors'
    TableName = 'vendors'
    Left = 40
    Top = 160
    object tbVendorsvendorname: TWideStringField
      FieldName = 'vendorname'
      Origin = 'vendorname'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 5
    end
    object tbVendorsfullname: TWideStringField
      FieldName = 'fullname'
      Origin = 'fullname'
      Size = 80
    end
    object tbVendorscompany: TWideStringField
      FieldName = 'company'
      Origin = 'company'
      Size = 32
    end
    object tbVendorsshipvia: TWideStringField
      FieldName = 'shipvia'
      Origin = 'shipvia'
      Size = 32
    end
    object tbVendorsaddress: TWideStringField
      FieldName = 'address'
      Origin = 'address'
      Size = 64
    end
    object tbVendorspobox: TWideStringField
      FieldName = 'pobox'
      Origin = 'pobox'
      Size = 32
    end
    object tbVendorscity: TWideStringField
      FieldName = 'city'
      Origin = 'city'
      Size = 32
    end
    object tbVendorsstate: TWideStringField
      FieldName = 'state'
      Origin = 'state'
      Size = 16
    end
    object tbVendorszip: TWideStringField
      FieldName = 'zip'
      Origin = 'zip'
      Size = 6
    end
    object tbVendorscountry: TWideStringField
      FieldName = 'country'
      Origin = 'country'
      Size = 32
    end
    object tbVendorsphone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
    end
    object tbVendorsphone2: TWideStringField
      FieldName = 'phone2'
      Origin = 'phone2'
    end
    object tbVendorsfax: TWideStringField
      FieldName = 'fax'
      Origin = 'fax'
    end
    object tbVendorsemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 128
    end
    object tbVendorsminorder: TBCDField
      FieldName = 'minorder'
      Origin = 'minorder'
      Precision = 10
      Size = 2
    end
    object tbVendorsprefix: TWideStringField
      FieldName = 'prefix'
      Origin = 'prefix'
      Size = 8
    end
    object tbVendorsadd: TWideStringField
      FieldName = 'add'
      Origin = '"add"'
      Size = 64
    end
    object tbVendorsterms: TWideStringField
      FieldName = 'terms'
      Origin = 'terms'
      Size = 12
    end
    object tbVendorsfob: TWideStringField
      FieldName = 'fob'
      Origin = 'fob'
      Size = 12
    end
    object tbVendorsisactive: TBooleanField
      FieldName = 'isactive'
      Origin = 'isactive'
    end
    object tbVendorscontact_person: TWideStringField
      FieldName = 'contact_person'
      Origin = 'contact_person'
      Size = 128
    end
  end
  object tbItems: TFDTable
    BeforePost = tbItemsBeforePost
    AfterPost = tbItemsAfterPost
    IndexFieldNames = 'sku'
    MasterSource = dsAInv
    MasterFields = 'sku'
    DetailFields = 'sku'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'ai_items'
    TableName = 'ai_items'
    Left = 112
    Top = 160
    object tbItemssku: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object tbItemstitle: TWideStringField
      FieldName = 'title'
      Origin = 'title'
      Size = 255
    end
    object tbItemsdescription: TWideStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object tbItemscaseqty: TSmallintField
      FieldName = 'caseqty'
      Origin = 'caseqty'
    end
    object tbItemsweight: TBCDField
      FieldName = 'weight'
      Origin = 'weight'
      Precision = 10
      Size = 2
    end
    object tbItemsprice: TBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
    object tbItemsqtyinv: TIntegerField
      FieldName = 'qtyinv'
      Origin = 'qtyinv'
    end
    object tbItemsfbacost: TBCDField
      FieldName = 'fbacost'
      Origin = 'fbacost'
      Precision = 10
      Size = 2
    end
    object tbItemsmycost: TBCDField
      FieldName = 'mycost'
      Origin = 'mycost'
      Precision = 10
      Size = 2
    end
    object tbItemsffsku: TWideStringField
      FieldName = 'ffsku'
      Origin = 'ffsku'
      Size = 64
    end
    object tbItemsasin: TWideStringField
      FieldName = 'asin'
      Origin = 'asin'
      Size = 32
    end
    object tbItemsqtymin: TIntegerField
      FieldName = 'qtymin'
      Origin = 'qtymin'
    end
    object tbItemsqtyord: TIntegerField
      FieldName = 'qtyord'
      Origin = 'qtyord'
    end
    object tbItemsqtymin10: TIntegerField
      FieldName = 'qtymin10'
      Origin = 'qtymin10'
    end
    object tbItemsqtyord10: TIntegerField
      FieldName = 'qtyord10'
      Origin = 'qtyord10'
    end
    object tbItemslastorderdate: TSQLTimeStampField
      FieldName = 'lastorderdate'
      Origin = 'lastorderdate'
    end
    object tbItemsqtyreceived: TIntegerField
      FieldName = 'qtyreceived'
      Origin = 'qtyreceived'
    end
    object tbItemsisactive: TBooleanField
      FieldName = 'isactive'
      Origin = 'isactive'
    end
    object tbItemsaddtopo: TBooleanField
      FieldName = 'addtopo'
      Origin = 'addtopo'
    end
    object tbItemsqtyordered: TIntegerField
      FieldName = 'qtyordered'
      Origin = 'qtyordered'
    end
    object tbItemsvendor: TWideStringField
      FieldName = 'vendor'
      Origin = 'vendor'
      Size = 5
    end
    object tbItemsvendorqty: TIntegerField
      FieldName = 'vendorqty'
      Origin = 'vendorqty'
    end
    object tbItemsvendorqtyupdate: TSQLTimeStampField
      FieldName = 'vendorqtyupdate'
      Origin = 'vendorqtyupdate'
    end
    object tbItemsneedcase: TBooleanField
      FieldName = 'needcase'
      Origin = 'needcase'
    end
    object tbItemsoversize: TBooleanField
      FieldName = 'oversize'
      Origin = 'oversize'
    end
    object tbItemsmycost_changed: TBooleanField
      FieldName = 'mycost_changed'
      Origin = 'mycost_changed'
      OnChange = tbItemsmycostChange
    end
    object tbItemsisvendoractive: TBooleanField
      FieldName = 'isvendoractive'
      Origin = 'isvendoractive'
    end
    object tbItemsqtywh: TIntegerField
      FieldName = 'qtywh'
      Origin = 'qtywh'
    end
  end
  object qAInv: TFDQuery
    BeforePost = tbItemsBeforePost
    AfterPost = tbItemsAfterPost
    Filtered = True
    Filter = 'isActive=true and isvendoractive=true'
    Connection = AlonDb
    SQL.Strings = (
      'select * from  ai_items order by '
      'qtyInv asc,qtyOrd desc, qtyMin desc, sku asc')
    Left = 136
    Top = 8
    object qAInvsku: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object qAInvtitle: TWideStringField
      FieldName = 'title'
      Origin = 'title'
      Size = 255
    end
    object qAInvdescription: TWideStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object qAInvcaseqty: TSmallintField
      FieldName = 'caseqty'
      Origin = 'caseqty'
    end
    object qAInvweight: TBCDField
      FieldName = 'weight'
      Origin = 'weight'
      Precision = 10
      Size = 2
    end
    object qAInvprice: TBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
    object qAInvqtyinv: TIntegerField
      FieldName = 'qtyinv'
      Origin = 'qtyinv'
    end
    object qAInvfbacost: TBCDField
      FieldName = 'fbacost'
      Origin = 'fbacost'
      Precision = 10
      Size = 2
    end
    object qAInvmycost: TBCDField
      FieldName = 'mycost'
      Origin = 'mycost'
      Precision = 10
      Size = 2
    end
    object qAInvffsku: TWideStringField
      FieldName = 'ffsku'
      Origin = 'ffsku'
      Size = 64
    end
    object qAInvasin: TWideStringField
      FieldName = 'asin'
      Origin = 'asin'
      Size = 32
    end
    object qAInvqtymin: TIntegerField
      FieldName = 'qtymin'
      Origin = 'qtymin'
    end
    object qAInvqtyord: TIntegerField
      FieldName = 'qtyord'
      Origin = 'qtyord'
    end
    object qAInvqtymin10: TIntegerField
      FieldName = 'qtymin10'
      Origin = 'qtymin10'
    end
    object qAInvqtyord10: TIntegerField
      FieldName = 'qtyord10'
      Origin = 'qtyord10'
    end
    object qAInvlastorderdate: TSQLTimeStampField
      FieldName = 'lastorderdate'
      Origin = 'lastorderdate'
      DisplayFormat = 'mm-dd-yyyy'
    end
    object qAInvqtyreceived: TIntegerField
      FieldName = 'qtyreceived'
      Origin = 'qtyreceived'
    end
    object qAInvisactive: TBooleanField
      FieldName = 'isactive'
      Origin = 'isactive'
    end
    object qAInvaddtopo: TBooleanField
      FieldName = 'addtopo'
      Origin = 'addtopo'
    end
    object qAInvqtyordered: TIntegerField
      FieldName = 'qtyordered'
      Origin = 'qtyordered'
    end
    object qAInvvendor: TWideStringField
      FieldName = 'vendor'
      Origin = 'vendor'
      Size = 5
    end
    object qAInvvendorqty: TIntegerField
      FieldName = 'vendorqty'
      Origin = 'vendorqty'
    end
    object qAInvvendorqtyupdate: TSQLTimeStampField
      FieldName = 'vendorqtyupdate'
      Origin = 'vendorqtyupdate'
    end
    object qAInvneedcase: TBooleanField
      FieldName = 'needcase'
      Origin = 'needcase'
    end
    object qAInvoversize: TBooleanField
      FieldName = 'oversize'
      Origin = 'oversize'
    end
    object qAInvmycost_changed: TBooleanField
      FieldName = 'mycost_changed'
      Origin = 'mycost_changed'
    end
    object qAInvisvendoractive: TBooleanField
      FieldName = 'isvendoractive'
      Origin = 'isvendoractive'
    end
    object qAInvqtywh: TIntegerField
      FieldName = 'qtywh'
      Origin = 'qtywh'
    end
  end
  object tbPo: TFDTable
    OnCalcFields = tbPoCalcFields
    Filtered = True
    Filter = 'po=5360'
    IndexFieldNames = 'po:D'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'po'
    TableName = 'po'
    Left = 304
    Top = 168
    object tbPoVendorName: TStringField
      FieldKind = fkCalculated
      FieldName = 'VendorName'
      LookupDataSet = tbVendors
      LookupKeyFields = 'vendorname'
      LookupResultField = 'fullname'
      KeyFields = 'vendor'
      LookupCache = True
      ReadOnly = True
      Size = 32
      Calculated = True
    end
    object tbPopo: TIntegerField
      FieldName = 'po'
      Origin = 'po'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbPovendor: TWideStringField
      FieldName = 'vendor'
      Origin = 'vendor'
      Size = 5
    end
    object tbPoorderdate: TSQLTimeStampField
      FieldName = 'orderdate'
      Origin = 'orderdate'
    end
    object tbPosentdate: TSQLTimeStampField
      FieldName = 'sentdate'
      Origin = 'sentdate'
    end
    object tbPoreceiveddate: TSQLTimeStampField
      FieldName = 'receiveddate'
      Origin = 'receiveddate'
    end
    object tbPototalprice: TBCDField
      FieldName = 'totalprice'
      Origin = 'totalprice'
      Precision = 10
      Size = 2
    end
    object tbPowithcases: TBooleanField
      FieldName = 'withcases'
      Origin = 'withcases'
    end
    object tbPoadded: TBooleanField
      FieldName = 'added'
      Origin = 'added'
    end
    object tbPobulkpo: TBooleanField
      FieldName = 'bulkpo'
      Origin = 'bulkpo'
    end
    object tbPobulkorders: TWideStringField
      FieldName = 'bulkorders'
      Origin = 'bulkorders'
      Size = 64
    end
  end
  object tbPOLines: TFDTable
    AfterInsert = tbPOLinesAfterInsert
    BeforePost = tbPOLinesBeforePost
    BeforeDelete = tbPOLinesBeforeDelete
    AfterDelete = tbPOLinesAfterDelete
    OnCalcFields = tbPOLinesCalcFields
    IndexName = 'polines_mainindex'
    MasterSource = dsPO
    MasterFields = 'po'
    DetailFields = 'po'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'polines'
    TableName = 'polines'
    Left = 368
    Top = 168
    object tbPOLinesfldQtyOrd30: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'fldQtyOrd30'
      LookupDataSet = tbSearchItems
      LookupKeyFields = 'sku'
      LookupResultField = 'qtyord10'
      KeyFields = 'sku'
      Calculated = True
    end
    object tbPOLinescaseQty: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'caseQty'
      LookupDataSet = tbSearchItems
      LookupKeyFields = 'sku'
      LookupResultField = 'caseqty'
      KeyFields = 'sku'
      LookupCache = True
    end
    object tbPOLinesfldQtyOrd10: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'fldQtyOrd10'
      LookupDataSet = tbSearchItems
      LookupKeyFields = 'sku'
      LookupResultField = 'qtyord10'
      KeyFields = 'sku'
      LookupCache = True
    end
    object tbPOLinesprofitDol: TFloatField
      FieldKind = fkLookup
      FieldName = 'profitDol'
      LookupDataSet = tbItemsProfit
      LookupKeyFields = 'sku'
      LookupResultField = 'profit_dol'
      KeyFields = 'sku'
      Lookup = True
    end
    object tbPOLinesprofitPer: TFloatField
      FieldKind = fkLookup
      FieldName = 'profitPer'
      LookupDataSet = tbItemsProfit
      LookupKeyFields = 'sku'
      LookupResultField = 'profit_percent'
      KeyFields = 'sku'
      Lookup = True
    end
    object tbPOLinespo: TIntegerField
      FieldName = 'po'
      Origin = 'po'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbPOLinesline: TSmallintField
      FieldName = 'line'
      Origin = 'line'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbPOLinessku: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      OnChange = tbPOLinesMySkuChange
      Size = 64
    end
    object tbPOLinesqty: TIntegerField
      FieldName = 'qty'
      Origin = 'qty'
    end
    object tbPOLinesprice: TBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
    object tbPOLinesqtyreceived: TIntegerField
      FieldName = 'qtyreceived'
      Origin = 'qtyreceived'
    end
    object tbPOLineschecked: TBooleanField
      FieldName = 'checked'
      Origin = 'checked'
    end
    object tbPOLinesamazonpo: TWideStringField
      FieldName = 'amazonpo'
      Origin = 'amazonpo'
      Size = 32
    end
    object tbPOLineswhname: TWideStringField
      FieldName = 'whname'
      Origin = 'whname'
      Size = 32
    end
    object tbPOLineslabelprep: TWideStringField
      FieldName = 'labelprep'
      Origin = 'labelprep'
      Size = 255
    end
    object tbPOLinesshipid: TWideStringField
      FieldName = 'shipid'
      Origin = 'shipid'
      Size = 128
    end
    object tbPOLinesMySku: TStringField
      FieldKind = fkLookup
      FieldName = 'MySku'
      LookupDataSet = tbSearchItems
      LookupKeyFields = 'sku'
      LookupResultField = 'sku'
      KeyFields = 'sku'
      Required = True
      Size = 64
      Lookup = True
    end
  end
  object tbProfitReport: TFDTable
    IndexFieldNames = 'orderid;sku'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'profitreport'
    TableName = 'profitreport'
    Left = 528
    Top = 168
    object tbProfitReportorderid: TWideStringField
      FieldName = 'orderid'
      Origin = 'orderid'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 32
    end
    object tbProfitReportsku: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object tbProfitReportvendor: TWideStringField
      FieldName = 'vendor'
      Origin = 'vendor'
      Size = 5
    end
    object tbProfitReportorderdate: TSQLTimeStampField
      FieldName = 'orderdate'
      Origin = 'orderdate'
    end
    object tbProfitReportqty: TBCDField
      FieldName = 'qty'
      Origin = 'qty'
      Precision = 10
      Size = 2
    end
    object tbProfitReportprincipal: TBCDField
      FieldName = 'principal'
      Origin = 'principal'
      Precision = 10
      Size = 2
    end
    object tbProfitReportshipping: TBCDField
      FieldName = 'shipping'
      Origin = 'shipping'
      Precision = 10
      Size = 2
    end
    object tbProfitReportfbaperunitfulfillmentfee: TBCDField
      FieldName = 'fbaperunitfulfillmentfee'
      Origin = 'fbaperunitfulfillmentfee'
      Precision = 10
      Size = 2
    end
    object tbProfitReportfbaweightbasedfee: TBCDField
      FieldName = 'fbaweightbasedfee'
      Origin = 'fbaweightbasedfee'
      Precision = 10
      Size = 2
    end
    object tbProfitReportfbaperorderfulfillmentfee: TBCDField
      FieldName = 'fbaperorderfulfillmentfee'
      Origin = 'fbaperorderfulfillmentfee'
      Precision = 10
      Size = 2
    end
    object tbProfitReportcommission: TBCDField
      FieldName = 'commission'
      Origin = 'commission'
      Precision = 10
      Size = 2
    end
    object tbProfitReportnetto: TBCDField
      FieldName = 'netto'
      Origin = 'netto'
      Precision = 10
      Size = 2
    end
    object tbProfitReportainvcost: TBCDField
      FieldName = 'ainvcost'
      Origin = 'ainvcost'
      Precision = 10
      Size = 2
    end
    object tbProfitReportprofit: TBCDField
      FieldName = 'profit'
      Origin = 'profit'
      Precision = 10
      Size = 2
    end
  end
  object tbWarehouses: TFDTable
    IndexFieldNames = 'whname'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'warehouses'
    TableName = 'warehouses'
    Left = 600
    Top = 168
    object tbWarehouseswhname: TWideStringField
      FieldName = 'whname'
      Origin = 'whname'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 32
    end
    object tbWarehousesline1: TWideStringField
      FieldName = 'line1'
      Origin = 'line1'
      Size = 32
    end
    object tbWarehousesline2: TWideStringField
      FieldName = 'line2'
      Origin = 'line2'
      Size = 32
    end
    object tbWarehousesline3: TWideStringField
      FieldName = 'line3'
      Origin = 'line3'
      Size = 32
    end
    object tbWarehousesline4: TWideStringField
      FieldName = 'line4'
      Origin = 'line4'
      Size = 32
    end
  end
  object tbUnsplittedItems: TFDTable
    IndexFieldNames = 'po'
    MasterSource = dsPO
    MasterFields = 'po'
    DetailFields = 'po'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'polines'
    TableName = 'polines'
    Left = 440
    Top = 168
    object tbUnsplittedItemspo: TIntegerField
      FieldName = 'po'
      Origin = 'po'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbUnsplittedItemsline: TSmallintField
      FieldName = 'line'
      Origin = 'line'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbUnsplittedItemssku: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      Size = 64
    end
    object tbUnsplittedItemsqty: TIntegerField
      FieldName = 'qty'
      Origin = 'qty'
    end
    object tbUnsplittedItemsprice: TBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
    object tbUnsplittedItemsqtyreceived: TIntegerField
      FieldName = 'qtyreceived'
      Origin = 'qtyreceived'
    end
    object tbUnsplittedItemschecked: TBooleanField
      FieldName = 'checked'
      Origin = 'checked'
    end
    object tbUnsplittedItemsamazonpo: TWideStringField
      FieldName = 'amazonpo'
      Origin = 'amazonpo'
      Size = 32
    end
    object tbUnsplittedItemswhname: TWideStringField
      FieldName = 'whname'
      Origin = 'whname'
      Size = 32
    end
    object tbUnsplittedItemslabelprep: TWideStringField
      FieldName = 'labelprep'
      Origin = 'labelprep'
      Size = 255
    end
    object tbUnsplittedItemsshipid: TWideStringField
      FieldName = 'shipid'
      Origin = 'shipid'
      Size = 128
    end
  end
  object qProfitReport: TFDQuery
    Connection = AlonDb
    SQL.Strings = (
      'select  extract(year from orderdate) as year,'
      'extract(month from orderdate) as month,sku, '
      '(sum(principal) / sum(qty)) principal,'
      '(sum(ainvcost) / sum(qty)) ainvcost1, '
      '(sum(FBAPerUnitFulfillmentFee) + sum(FBAWeightBasedFee) + '
      'sum(FBAPerOrderFulfillmentFee) + sum(Commission))  TotalFees, '
      'sum(qty) qtyS, sum(profit) profit, '
      'sum(profit) / sum(qty) itemProfit, '
      
        ' (((sum(profit) / sum(qty) ) / (sum(ainvcost) / sum(qty))) * 100' +
        ') percentProfit, sum(Principal*qty) sumPrincipal'
      ', ((sum(ainvcost) / sum(qty)) * sum(qty)) totalPrincipalSold '
      ''
      'from  profitreport '
      ' where ainvcost > 0 and principal>0'
      ' group  by year,month, sku'
      ' order by year desc,month, qtyS desc'
      'limit 100')
    Left = 344
    Top = 584
  end
  object qRep: TFDQuery
    Connection = AlonDb
    SQL.Strings = (
      'select *'
      
        'from  ai_items where qtyinv>0  and isactive=true and lastorderda' +
        'te is not null'
      'order by LastOrderDate desc'
      '  limit 30')
    Left = 768
    Top = 584
  end
  object qPoReport: TFDQuery
    Connection = AlonDb
    SQL.Strings = (
      '        select vendor,sku, sum(qty * price) as cost'
      '        from po po, polines pl'
      '        where pl.po=po.po group by vendor,sku')
    Left = 696
    Top = 584
  end
  object SMTP: TIdSMTP
    MailAgent = 'MS Outlook'
    SASLMechanisms = <>
    Left = 880
    Top = 32
  end
  object XMLDocument1: TXMLDocument
    Left = 880
    Top = 144
    DOMVendorDesc = 'MSXML'
  end
  object qRep5000: TFDQuery
    Connection = AlonDb
    SQL.Strings = (
      'select SKU, (qtyinv * price) as cost, '
      'qtyinv, price  from ai_items where (qtyinv * price) > 5000'
      'order by cost desc')
    Left = 616
    Top = 584
  end
  object frx5000: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmWholePage
    PrintOptions.Collate = False
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42225.886355150500000000
    ReportOptions.LastChange = 42225.913311759300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 616
    Top = 528
    Datasets = <
      item
        DataSet = frxDs5000
        DataSetName = 'frxDs5000'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 740.409927000000000000
        object Page: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Top = 1.000000000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 1.000000000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Page ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 194.645795000000000000
          Top = 22.677180000000000000
          Width = 351.496290000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Items with more than $5000 cost')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 79.370130000000000000
          Width = 343.937230000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'SKU')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 79.370130000000000000
          Width = 98.267780000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'QTY')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Top = 79.370130000000000000
          Width = 185.196970000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Total cost')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 631.181510000000000000
          Top = 79.370130000000000000
          Width = 105.826840000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Price')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 192.756030000000000000
        Width = 740.409927000000000000
        DataSet = frxDs5000
        DataSetName = 'frxDs5000'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 0.559060000000000000
          Top = 1.779529999999994000
          Width = 737.008350000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
        end
        object frxDs5000sku: TfrxMemoView
          AllowVectorExport = True
          Left = 9.779530000000000000
          Top = 3.000000000000000000
          Width = 325.039580000000000000
          Height = 22.677180000000000000
          DataField = 'sku'
          DataSet = frxDs5000
          DataSetName = 'frxDs5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDs5000."sku"]')
          ParentFont = False
        end
        object frxDs5000cost: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 3.000000000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          DataField = 'cost'
          DataSet = frxDs5000
          DataSetName = 'frxDs5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDs5000."cost"]')
          ParentFont = False
        end
        object frxDs5000qtyinv: TfrxMemoView
          AllowVectorExport = True
          Left = 370.496290000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          DataField = 'qtyinv'
          DataSet = frxDs5000
          DataSetName = 'frxDs5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDs5000."qtyinv"]')
          ParentFont = False
        end
        object frxDs5000price: TfrxMemoView
          AllowVectorExport = True
          Left = 651.740570000000000000
          Top = 3.000000000000000000
          Width = 68.031540000000000000
          Height = 22.677180000000000000
          DataField = 'price'
          DataSet = frxDs5000
          DataSetName = 'frxDs5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDs5000."price"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 0.779529999999994100
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 631.181510000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 737.008350000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 0.220470000000006000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 740.409927000000000000
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 1.779529999999994000
          Width = 733.228820000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDs5000: TfrxDBDataset
    UserName = 'frxDs5000'
    CloseDataSource = False
    FieldAliases.Strings = (
      'sku=sku'
      'cost=cost'
      'qtyinv=qtyinv'
      'price=price')
    DataSet = qRep5000
    BCDToCurrency = False
    Left = 616
    Top = 640
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    CreationTime = 43201.953822858800000000
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = True
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 100
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = True
    Left = 944
    Top = 32
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 944
    Top = 88
  end
  object frxCSVExport1: TfrxCSVExport
    FileName = 'report.csv'
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ','
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = True
    NoSysSymbols = True
    ForcedQuotes = True
    Left = 944
    Top = 144
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 944
    Top = 200
  end
  object frxProfitReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42225.939217453700000000
    ReportOptions.LastChange = 42226.858734201400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Top = 528
    Datasets = <
      item
        DataSet = frxDsProfitReport
        DataSetName = 'frxDsProfitReport'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 88.488250000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            'Profit report')
          ParentFont = False
        end
        object lbSku: TfrxMemoView
          AllowVectorExport = True
          Top = 45.354360000000000000
          Width = 226.771800000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'SKU')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771653543307000000
          Top = 45.354360000000000000
          Width = 37.795300000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            ' Qty '
            'sold')
          ParentFont = False
        end
        object lbPerItem: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 68.031540000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Per item')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 338.267935000000000000
          Top = 68.031540000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 425.968770000000000000
          Top = 68.031540000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 45.354360000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Profit')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Sale '
            'price')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 535.134200000000000000
          Top = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ainv'
            'cost')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = 45.354360000000000000
          Width = 71.811070000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total '
            'cost')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 659.417750000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total '
            'fees')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 88.488250000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 166.299320000000000000
        Width = 740.409927000000000000
        DataSet = frxDsProfitReport
        DataSetName = 'frxDsProfitReport'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 740.787880000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
        end
        object frxDsProfitReportsku: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 1.559060000000000000
          Top = 2.559060000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = True
          StretchMode = smMaxHeight
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsProfitReport."sku"]')
          ParentFont = False
          WordWrap = False
          Highlights = <
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -15
              Font.Name = 'Arial Narrow'
              Font.Style = []
              Condition = 
                '((length(<frxDsProfitReport."sku">) > 21) and (length(<frxDsProf' +
                'itReport."sku">) < 24))'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'Arial Narrow'
              Font.Style = []
              Condition = 
                '((length(<frxDsProfitReport."sku">) >= 24) and (length(<frxDsPro' +
                'fitReport."sku">) < 27))'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Arial Narrow'
              Font.Style = []
              Condition = 
                '((length(<frxDsProfitReport."sku">) >= 27) and (length(<frxDsPro' +
                'fitReport."sku">) < 29))'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial Narrow'
              Font.Style = []
              Condition = 'length(<frxDsProfitReport."sku">) >= 29 '
              FillType = ftBrush
              Frame.Typ = []
            end>
        end
        object frxDsProfitReportqty: TfrxMemoView
          AllowVectorExport = True
          Left = 227.535560000000000000
          Top = 1.225726670000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clGreen
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxDsProfitReport."qtys"> > 9999'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsProfitReport."qtys"]')
          ParentFont = False
        end
        object frxDsProfitReportitemprofit: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 2.559060000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'itemprofit'
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsProfitReport."itemprofit"]')
          ParentFont = False
        end
        object frxDsProfitReporttotalfees: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 2.559060000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'profit'
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsProfitReport."profit"]')
          ParentFont = False
        end
        object frxDsProfitReportpercentprofit: TfrxMemoView
          AllowVectorExport = True
          Left = 434.968770000000000000
          Top = 2.559060000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'percentprofit'
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#.#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsProfitReport."percentprofit"]')
          ParentFont = False
        end
        object frxDsProfitReportainvcost1: TfrxMemoView
          AllowVectorExport = True
          Left = 540.913730000000000000
          Top = 2.559060000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'ainvcost1'
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#.#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsProfitReport."ainvcost1"]')
          ParentFont = False
        end
        object frxDsProfitReporttotalfees1: TfrxMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Top = 2.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'totalfees'
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsProfitReport."totalfees"]')
          ParentFont = False
        end
        object frxDsProfitReportprincipal: TfrxMemoView
          AllowVectorExport = True
          Left = 489.779840000000000000
          Top = 2.559060000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'principal'
          DataSet = frxDsProfitReport
          DataSetName = 'frxDsProfitReport'
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsProfitReport."principal"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 1.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[(<frxDsProfitReport."qtyS"> * <frxDsProfitReport."ainvcost1">)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -1.220470000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 226.771653543307000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 264.566929133858000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 336.157700000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 424.968770000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 534.913730000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 659.417750000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 739.008350000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 215.433210000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Totals')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 4.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDsProfitReport."itemprofit">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 4.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDsProfitReport."profit">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 430.748300000000000000
          Top = 4.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '#.##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[AVG(<frxDsProfitReport."percentprofit">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 486.338900000000000000
          Top = 4.779530000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '#.#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDsProfitReport."sumprincipal">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 589.165740000000000000
          Top = 4.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '#.#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDsProfitReport."totalprincipalsold">,MasterData1)]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 262.567100000000000000
          Top = 30.236240000000000000
          Width = 427.086890000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 264.566929133858000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 691.653990000000000000
          Top = -0.000000000000000208
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 336.157700000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 425.307360000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = -0.000000000000000208
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = -0.000000000000000208
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = -0.000000000000000208
          Width = 430.866420000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDsProfitReport: TfrxDBDataset
    UserName = 'frxDsProfitReport'
    CloseDataSource = False
    FieldAliases.Strings = (
      'year=year'
      'month=month'
      'sku=sku'
      'principal=principal'
      'ainvcost1=ainvcost1'
      'totalfees=totalfees'
      'qtys=qtys'
      'profit=profit'
      'itemprofit=itemprofit'
      'percentprofit=percentprofit'
      'sumprincipal=sumprincipal'
      'totalprincipalsold=totalprincipalsold')
    DataSet = qProfitReport
    BCDToCurrency = False
    Left = 344
    Top = 640
  end
  object frxTwoCompareProfit: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42227.815659039300000000
    ReportOptions.LastChange = 42229.829237500000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 64
    Top = 528
    Datasets = <
      item
        DataSet = frxDsTwoCompareProfit
        DataSetName = 'frxDsTwoCompareProfit'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 355.600000000000000000
      PaperSize = 5
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 5.669295000000000000
          Width = 415.748300000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Yearly compare month profit report')
          ParentFont = False
        end
        object lbVendor: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 45.354360000000000000
          Width = 188.976500000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 257.008040000000000000
          Top = 45.354360000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            ' Total   profit')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbThisYear: TfrxMemoView
          AllowVectorExport = True
          Left = 256.787570000000000000
          Top = 71.590600000000000000
          Width = 196.535560000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'lbThisYear')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbPreviousYear: TfrxMemoView
          AllowVectorExport = True
          Left = 453.323130000000000000
          Top = 71.590600000000000000
          Width = 196.535560000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'lbThisYear')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 173.858380000000000000
        Width = 740.409927000000000000
        DataSet = frxDsTwoCompareProfit
        DataSetName = 'frxDsTwoCompareProfit'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 67.472480000000000000
          Top = 0.779530000000000000
          Width = 582.047620000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsTwoCompareProfitVENDOR: TfrxMemoView
          AllowVectorExport = True
          Left = 84.370130000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          DataField = 'VENDOR'
          DataSet = frxDsTwoCompareProfit
          DataSetName = 'frxDsTwoCompareProfit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsTwoCompareProfit."VENDOR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsTwoCompareProfitFIELD1: TfrxMemoView
          AllowVectorExport = True
          Left = 300.567100000000000000
          Top = 2.779530000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          DataSet = frxDsTwoCompareProfit
          DataSetName = 'frxDsTwoCompareProfit'
          DisplayFormat.FormatStr = '#,0;-#,0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -16
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0 '
          Highlight.FillType = ftBrush
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsTwoCompareProfit."FIELD1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsTwoCompareProfitFIELD2: TfrxMemoView
          AllowVectorExport = True
          Left = 499.323130000000000000
          Top = 2.779530000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          DataSet = frxDsTwoCompareProfit
          DataSetName = 'frxDsTwoCompareProfit'
          DisplayFormat.FormatStr = '#,0;-#,0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -16
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0 '
          Highlight.FillType = ftBrush
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsTwoCompareProfit."FIELD2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 67.811070000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 257.008040000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 0.000000000000010714
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 740.409927000000000000
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 0.559060000000000000
          Width = 582.047620000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 309.921460000000000000
        Width = 740.409927000000000000
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 313.512013500000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Page')
          ParentFont = False
          VAlign = vaCenter
        end
        object Page: TfrxMemoView
          AllowVectorExport = True
          Left = 360.756138500000000000
          Top = 19.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 68.811070000000000000
          Top = 0.779530000000000000
          Width = 582.047620000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDsTwoCompareProfit: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 10
    UserName = 'frxDsTwoCompareProfit'
    Fields.Strings = (
      'VENDOR'
      'FIELD1'
      'FIELD2')
    OnGetValue = frxDsTwoCompareProfitGetValue
    Left = 64
    Top = 584
  end
  object frxDsCompareProfitReport: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 12
    UserName = 'frxDsCompareProfitReport'
    Fields.Strings = (
      'Vendor'
      'Field1'
      'Field2'
      'Field3'
      'Field4'
      'Field5'
      'Field6'
      'Field7'
      'Field8'
      'Field9'
      'Field10'
      'Field11'
      'Field12')
    OnGetValue = frxDsCompareProfitReportGetValue
    Left = 216
    Top = 584
  end
  object frxCompareProfitReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42227.908579166700000000
    ReportOptions.LastChange = 42229.828045034700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 224
    Top = 528
    Datasets = <
      item
        DataSet = frxDsCompareProfitReport
        DataSetName = 'frxDsCompareProfitReport'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 100.047310000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Top = 7.559060000000000000
          Width = 400.630180000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Compare profit report')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 39.574830000000000000
          Width = 124.724490000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 125.504020000000000000
          Top = 39.354360000000000000
          Width = 616.063390000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Total Profit   ')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField1: TfrxMemoView
          AllowVectorExport = True
          Left = 125.063080000000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField2: TfrxMemoView
          AllowVectorExport = True
          Left = 177.437482730000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField3: TfrxMemoView
          AllowVectorExport = True
          Left = 229.370945450000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField4: TfrxMemoView
          AllowVectorExport = True
          Left = 278.524878180000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField5: TfrxMemoView
          AllowVectorExport = True
          Left = 328.678810910000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField6: TfrxMemoView
          AllowVectorExport = True
          Left = 378.832743640000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField7: TfrxMemoView
          AllowVectorExport = True
          Left = 427.986676360000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField8: TfrxMemoView
          AllowVectorExport = True
          Left = 478.140609090000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField9: TfrxMemoView
          AllowVectorExport = True
          Left = 530.294541820000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField10: TfrxMemoView
          AllowVectorExport = True
          Left = 583.007534550000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField11: TfrxMemoView
          AllowVectorExport = True
          Left = 634.940997270000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbField12: TfrxMemoView
          AllowVectorExport = True
          Left = 687.874460000000000000
          Top = 66.031540000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            '2015/01')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 99.826840000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 181.417440000000000000
        Width = 740.409927000000000000
        DataSet = frxDsCompareProfitReport
        DataSetName = 'frxDsCompareProfitReport'
        RowCount = 0
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 0.779530000000000000
          Width = 737.008350000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportVendor: TfrxMemoView
          AllowVectorExport = True
          Left = 6.559060000000000000
          Top = 4.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'Vendor'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Vendor"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 124.724490000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 177.637910000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 229.551330000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 278.685220000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 328.598640000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 378.953000000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 428.086890000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 478.000310000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 530.134200000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 582.827150000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 634.740570000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 687.874460000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 740.787880000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDsCompareProfitReportField1: TfrxMemoView
          AllowVectorExport = True
          Left = 127.283550000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField2: TfrxMemoView
          AllowVectorExport = True
          Left = 180.417440000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField3: TfrxMemoView
          AllowVectorExport = True
          Left = 231.330860000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field3"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField4: TfrxMemoView
          AllowVectorExport = True
          Left = 281.464750000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field4"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField5: TfrxMemoView
          AllowVectorExport = True
          Left = 330.598640000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field5'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field5"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField6: TfrxMemoView
          AllowVectorExport = True
          Left = 380.732530000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field6'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field6"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField7: TfrxMemoView
          AllowVectorExport = True
          Left = 430.086890000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field7'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field7"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField8: TfrxMemoView
          AllowVectorExport = True
          Left = 479.779840000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field8"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField9: TfrxMemoView
          AllowVectorExport = True
          Left = 531.913730000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field9'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field9"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField10: TfrxMemoView
          AllowVectorExport = True
          Left = 584.827150000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field10'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field10"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField11: TfrxMemoView
          AllowVectorExport = True
          Left = 636.740570000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field11'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field11"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareProfitReportField12: TfrxMemoView
          AllowVectorExport = True
          Left = 690.653990000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Field12'
          DataSet = frxDsCompareProfitReport
          DataSetName = 'frxDsCompareProfitReport'
          DisplayFormat.FormatStr = '#,#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareProfitReport."Field12"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 0.779530000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object receiver: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = receiverUDPRead
    Left = 880
    Top = 200
  end
  object frxRep: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42230.471084027800000000
    ReportOptions.LastChange = 42230.471084027800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 760
    Top = 528
    Datasets = <
      item
        DataSet = frxDsRep
        DataSetName = 'frxDsRep'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftBottom]
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 93.488250000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object lbTitle: TfrxMemoView
          AllowVectorExport = True
          Left = 241.700943500000000000
          Top = 3.779530000000000000
          Width = 257.008040000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial Black'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 13434879
          HAlign = haCenter
          Memo.UTF8W = (
            'Last day orders')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 55.692950000000000000
          Width = 279.685220000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'SKU')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 281.244280000000000000
          Top = 55.692950000000000000
          Width = 177.637910000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Qty ordered')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 55.692950000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Qty received')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 613.063390000000000000
          Top = 55.692950000000000000
          Width = 124.724490000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Order date')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 740.409927000000000000
        DataSet = frxDsRep
        DataSetName = 'frxDsRep'
        RowCount = 0
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 0.779530000000000000
          Width = 737.008350000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
        end
        object frxDsRepsku: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 1.000000000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'sku'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."sku"]')
          ParentFont = False
        end
        object frxDsRepqtyord: TfrxMemoView
          AllowVectorExport = True
          Left = 338.700990000000000000
          Top = 1.000000000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'qtyord'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."qtyord"]')
          ParentFont = False
        end
        object frxDsRepqtyreceived: TfrxMemoView
          AllowVectorExport = True
          Left = 516.338900000000000000
          Top = 1.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'qtyreceived'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."qtyreceived"]')
          ParentFont = False
        end
        object frxDsReplastorderdate: TfrxMemoView
          AllowVectorExport = True
          Left = 621.504330000000000000
          Top = 1.000000000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'lastorderdate'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."lastorderdate"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 280.464750000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 459.102660000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 740.409927000000000000
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 0.779530000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDsRep: TfrxDBDataset
    UserName = 'frxDsRep'
    CloseDataSource = False
    DataSet = qRep
    BCDToCurrency = False
    Left = 768
    Top = 640
  end
  object frxPrintLines: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42230.517841192100000000
    ReportOptions.LastChange = 42230.517841192100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 832
    Top = 528
    Datasets = <
      item
        DataSet = frxDsRep
        DataSetName = 'frxDsRep'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Width = 445.984540000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 13434879
          HAlign = haCenter
          Memo.UTF8W = (
            'Parts should be ordered immediately')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = -2.000000000000000000
          Top = 60.472480000000000000
          Width = 275.905690000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'SKU')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 269.126160000000000000
          Top = 60.472480000000000000
          Width = 124.724490000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Inventory')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 393.070866141732000000
          Top = 60.472480000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Min qty')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 498.897637795276000000
          Top = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Qty to order')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 617.952755905512100000
          Top = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Order date')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.236240000000000000
        Top = 177.637910000000000000
        Width = 740.409927000000000000
        DataSet = frxDsRep
        DataSetName = 'frxDsRep'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 0.779529999999994100
          Width = 740.787880000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRepsku: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."sku"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRepqtyinv: TfrxMemoView
          AllowVectorExport = True
          Left = 312.141930000000000000
          Top = 3.779529999999994000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'qtyinv'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."qtyinv"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRepqtymin: TfrxMemoView
          AllowVectorExport = True
          Left = 429.307360000000000000
          Top = 3.779529999999994000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'qtymin'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."qtymin"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRepqtyord: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'qtyord'
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRep."qtyord"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsReplastorderdate: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Top = 3.779529999999994000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = frxDsRep
          DataSetName = 'frxDsRep'
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDsRep."lastorderdate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 269.102362204724000000
          Top = 0.779529999999994100
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 0.779529999999994100
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 498.897637795276000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 617.842920000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 740.409927000000000000
        object Line5: TfrxLineView
          AllowVectorExport = True
          Top = 1.779529999999994000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDsPoReport: TfrxDBDataset
    UserName = 'frxDsPoReport'
    CloseDataSource = False
    DataSet = qPoReport
    BCDToCurrency = False
    Left = 696
    Top = 640
  end
  object frxPoReport: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42230.541004710600000000
    ReportOptions.LastChange = 42230.541004710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 688
    Top = 528
    Datasets = <
      item
        DataSet = frxDsPoReport
        DataSetName = 'frxDsPoReport'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      PrintIfEmpty = False
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 589.386210000000000000
          Top = 26.456710000000000000
          Width = 147.401670000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Sum $ cost')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 188.976500000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 189.756030000000000000
          Top = 26.456710000000000000
          Width = 400.630180000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'SKU')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 31.015770000000000000
        Top = 139.842610000000000000
        Width = 740.409927000000000000
        DataSet = frxDsPoReport
        DataSetName = 'frxDsPoReport'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 0.559060000000000000
          Top = 0.779530000000000000
          Width = 737.008350000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
        end
        object frxDsPoReportvendor: TfrxMemoView
          AllowVectorExport = True
          Left = 20.338590000000000000
          Top = 3.779530000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'vendor'
          DataSet = frxDsPoReport
          DataSetName = 'frxDsPoReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsPoReport."vendor"]')
          ParentFont = False
        end
        object frxDsPoReportsku: TfrxMemoView
          AllowVectorExport = True
          Left = 203.756030000000000000
          Top = 3.779530000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          DataField = 'sku'
          DataSet = frxDsPoReport
          DataSetName = 'frxDsPoReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsPoReport."sku"]')
          ParentFont = False
        end
        object frxDsPoReportcost: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'cost'
          DataSet = frxDsPoReport
          DataSetName = 'frxDsPoReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsPoReport."cost"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 590.606680000000000000
          Top = 0.779530000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
    end
  end
  object HTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 880
    Top = 88
  end
  object tbSelfInfo: TFDTable
    IndexFieldNames = 'type'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'selfinfo'
    TableName = 'selfinfo'
    Left = 680
    Top = 168
    object tbSelfInfotype: TWideStringField
      FieldName = 'type'
      Origin = '"type"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object tbSelfInfomyname: TWideStringField
      FieldName = 'myname'
      Origin = 'myname'
      Size = 55
    end
    object tbSelfInfoshortname: TWideStringField
      FieldName = 'shortname'
      Origin = 'shortname'
      Size = 15
    end
    object tbSelfInfocompany: TWideStringField
      FieldName = 'company'
      Origin = 'company'
      Size = 64
    end
    object tbSelfInfocompanyshortname: TWideStringField
      FieldName = 'companyshortname'
      Origin = 'companyshortname'
      Size = 15
    end
    object tbSelfInfoaddress: TWideStringField
      FieldName = 'address'
      Origin = 'address'
      Size = 64
    end
    object tbSelfInfopobox: TWideStringField
      FieldName = 'pobox'
      Origin = 'pobox'
      Size = 32
    end
    object tbSelfInfocity: TWideStringField
      FieldName = 'city'
      Origin = 'city'
      Size = 32
    end
    object tbSelfInfostate: TWideStringField
      FieldName = 'state'
      Origin = 'state'
      Size = 16
    end
    object tbSelfInfozip: TWideStringField
      FieldName = 'zip'
      Origin = 'zip'
      Size = 6
    end
    object tbSelfInfocountry: TWideStringField
      FieldName = 'country'
      Origin = 'country'
      Size = 32
    end
    object tbSelfInfophone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
    end
    object tbSelfInfophone2: TWideStringField
      FieldName = 'phone2'
      Origin = 'phone2'
    end
    object tbSelfInfofax: TWideStringField
      FieldName = 'fax'
      Origin = 'fax'
    end
    object tbSelfInfoemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 128
    end
    object tbSelfInfosmtp_server: TWideStringField
      FieldName = 'smtp_server'
      Origin = 'smtp_server'
      Size = 128
    end
    object tbSelfInfosmtp_port: TSmallintField
      FieldName = 'smtp_port'
      Origin = 'smtp_port'
    end
    object tbSelfInfosmtp_user: TWideStringField
      FieldName = 'smtp_user'
      Origin = 'smtp_user'
      Size = 128
    end
    object tbSelfInfosmtp_password: TWideStringField
      FieldName = 'smtp_password'
      Origin = 'smtp_password'
      Size = 64
    end
  end
  object tbMailArchive: TFDTable
    IndexFieldNames = 'doctype;orderno;orderversion'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'mail_archive'
    TableName = 'mail_archive'
    Left = 752
    Top = 168
    object tbMailArchivedoctype: TWideStringField
      FieldName = 'doctype'
      Origin = 'doctype'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object tbMailArchiveorderno: TWideStringField
      FieldName = 'orderno'
      Origin = 'orderno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 15
    end
    object tbMailArchiveorderversion: TIntegerField
      FieldName = 'orderversion'
      Origin = 'orderversion'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbMailArchivesentto: TWideStringField
      FieldName = 'sentto'
      Origin = 'sentto'
      Size = 255
    end
    object tbMailArchivecc: TWideStringField
      FieldName = 'cc'
      Origin = 'cc'
      Size = 255
    end
    object tbMailArchivesubject: TWideStringField
      FieldName = 'subject'
      Origin = 'subject'
      Size = 255
    end
    object tbMailArchivenote: TWideStringField
      FieldName = 'note'
      Origin = 'note'
      Size = 500
    end
    object tbMailArchiveattachedfilename: TWideStringField
      FieldName = 'attachedfilename'
      Origin = 'attachedfilename'
      Size = 255
    end
    object tbMailArchivesentdate: TSQLTimeStampField
      FieldName = 'sentdate'
      Origin = 'sentdate'
    end
    object tbMailArchivebody: TWideMemoField
      FieldName = 'body'
      Origin = 'body'
      BlobType = ftWideMemo
    end
    object tbMailArchiveattached: TWideMemoField
      FieldName = 'attached'
      Origin = 'attached'
      BlobType = ftWideMemo
    end
  end
  object tbItemsProfit: TFDTable
    IndexFieldNames = 'sku'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'items_profit'
    TableName = 'items_profit'
    Left = 192
    Top = 160
    object tbItemsProfitsku: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object tbItemsProfitprofit_dol: TBCDField
      FieldName = 'profit_dol'
      Origin = 'profit_dol'
      Precision = 10
      Size = 2
    end
    object tbItemsProfitprofit_percent: TBCDField
      FieldName = 'profit_percent'
      Origin = 'profit_percent'
      Precision = 10
      Size = 2
    end
    object tbItemsProfitlast_update: TSQLTimeStampField
      FieldName = 'last_update'
      Origin = 'last_update'
    end
  end
  object frxCompareItemProfitByDates: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42227.815659039300000000
    ReportOptions.LastChange = 42837.799871967600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 464
    Top = 528
    Datasets = <
      item
        DataSet = frxDsCompareItemProfitByDates
        DataSetName = 'frxDsCompareItemProfitByDates'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 355.600000000000000000
      PaperSize = 5
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 5.669295000000000000
          Width = 415.748300000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Compare items sales by date ranges')
          ParentFont = False
        end
        object lbSKU: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 45.354360000000000000
          Width = 317.480520000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'SKU')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 328.819110000000000000
          Top = 45.354360000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            ' Total   sales')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbFirstDateRange: TfrxMemoView
          AllowVectorExport = True
          Left = 329.598640000000000000
          Top = 71.590600000000000000
          Width = 196.535560000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'lbFirstDateRange')
          ParentFont = False
          VAlign = vaCenter
        end
        object lbSecDateRange: TfrxMemoView
          AllowVectorExport = True
          Left = 526.134200000000000000
          Top = 71.590600000000000000
          Width = 196.535560000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16777180
          HAlign = haCenter
          Memo.UTF8W = (
            'lbSecDateRange')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 173.858380000000000000
        Width = 740.409927000000000000
        DataSet = frxDsCompareItemProfitByDates
        DataSetName = 'frxDsCompareItemProfitByDates'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 10.779530000000000000
          Top = 0.779530000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line> mod 2 = 1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15790320
          Highlight.Frame.Typ = []
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareItemProfitByDatesSKU: TfrxMemoView
          AllowVectorExport = True
          Left = 16.338590000000000000
          Top = 3.779530000000000000
          Width = 309.921460000000000000
          Height = 22.677180000000000000
          DataField = 'sku'
          DataSet = frxDsCompareItemProfitByDates
          DataSetName = 'frxDsCompareItemProfitByDates'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareItemProfitByDates."sku"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsCompareItemProfitByDatesField1: TfrxMemoView
          AllowVectorExport = True
          Left = 390.275820000000000000
          Top = 2.779530000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          DataSet = frxDsCompareItemProfitByDates
          DataSetName = 'frxDsCompareItemProfitByDates'
          DisplayFormat.FormatStr = '#,0;-#,0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Memo.UTF8W = (
            '[frxDsCompareItemProfitByDates."sales1"]')
          ParentFont = False
          VAlign = vaCenter
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 
                '<frxDsCompareItemProfitByDates."sales1"> < <frxDsCompareItemProf' +
                'itByDates."sales2">'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 
                '<frxDsCompareItemProfitByDates."sales1"> > <frxDsCompareItemProf' +
                'itByDates."sales2">'
              FillType = ftBrush
              Frame.Typ = []
            end>
        end
        object frxDsCompareItemProfitByDatesFIELD2: TfrxMemoView
          AllowVectorExport = True
          Left = 585.252320000000000000
          Top = 2.559060000000000000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          DataField = 'sales2'
          DataSet = frxDsCompareItemProfitByDates
          DataSetName = 'frxDsCompareItemProfitByDates'
          DisplayFormat.FormatStr = '#,0;-#,0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -16
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value < 0 '
          Highlight.FillType = ftBrush
          Highlight.Fill.ForeColor = clRed
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsCompareItemProfitByDates."sales2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 11.118120000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 328.819110000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 526.354670000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 226.771800000000000000
        Width = 740.409927000000000000
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 0.559060000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 313.700990000000000000
        Width = 740.409927000000000000
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 313.512013500000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Page')
          ParentFont = False
          VAlign = vaCenter
        end
        object Page: TfrxMemoView
          AllowVectorExport = True
          Left = 360.756138500000000000
          Top = 19.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 0.779530000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDsCompareItemProfitByDates: TfrxDBDataset
    UserName = 'frxDsCompareItemProfitByDates'
    CloseDataSource = False
    FieldAliases.Strings = (
      'sku=sku'
      'sales1=sales1'
      'sales2=sales2')
    DataSet = qCompByDates
    BCDToCurrency = False
    Left = 464
    Top = 584
  end
  object qCompByDates: TFDQuery
    Connection = AlonDb
    SQL.Strings = (
      'select p1.sku, sum(p1.qty) as sales1, sum(p2.qty) as sales2'
      'from profitreport p1, profitreport p2'
      'where p2.sku=p1.sku and '
      'p1.orderdate between '#39'1-apr-2017'#39' '
      'and '#39'20-apr-2017'#39' '
      'and p2.orderdate between '#39'1-apr-2016'#39' '
      'and '#39'20-apr-2016'#39
      'group by p1.sku')
    Left = 464
    Top = 640
  end
  object AlonDb: TFDConnection
    ConnectionName = 'AlonDb'
    Params.Strings = (
      'Server=localhost'
      'DriverID=PG')
    ResourceOptions.AssignedValues = [rvAutoConnect]
    ResourceOptions.AutoConnect = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    LoginPrompt = False
    Left = 20
    Top = 12
  end
  object qSkuPo: TFDQuery
    Connection = AlonDb
    SQL.Strings = (
      
        'select distinct (p.po), p.orderdate, l.qty, l.line from po p,pol' +
        'ines l'
      'where sku='#39'VELROSE-3362-BLACK-1X'#39' and l.po=p.po'
      'order by orderdate desc')
    Left = 600
    Top = 328
  end
  object dsSkuPo: TDataSource
    DataSet = qSkuPo
    Left = 600
    Top = 264
  end
  object dsSelfInfo: TDataSource
    DataSet = tbSelfInfo
    Left = 680
    Top = 120
  end
  object frxPrintItemLabels: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43189.529242905090000000
    ReportOptions.LastChange = 43189.529242905090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 928
    Top = 528
    Datasets = <
      item
        DataSet = frxDsItemLabels
        DataSetName = 'frxDsItemLabels'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      Font.Quality = fqAntialiased
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 6.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 13.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 67.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '71'
        '142')
      Frame.Typ = []
      PrintIfEmpty = False
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 96.755905511811000000
        Top = 18.897650000000000000
        Width = 253.228510000000000000
        DataSet = frxDsItemLabels
        DataSetName = 'frxDsItemLabels'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 69.149660000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          Frame.Typ = []
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            'New')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsItemLabelstitle: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          ShiftMode = smDontShift
          Top = 52.467223329999990000
          Width = 223.207483330000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          CharSpacing = -1.400000000000000000
          DataSet = frxDsItemLabels
          DataSetName = 'frxDsItemLabels'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqAntialiased
          Frame.Typ = []
          LineSpacing = 1.000000000000000000
          Memo.UTF8W = (
            '[frxDsItemLabels."title"]')
          ParentFont = False
          UseDefaultCharset = True
          WordBreak = True
          WordWrap = False
          Highlights = <
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Consolas'
              Font.Style = []
              Condition = 'Length(<frxDsItemLabels."title">) <= 20'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Consolas'
              Font.Style = []
              Condition = 'Length(<frxDsItemLabels."title">) > 40'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              ApplyFill = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Consolas'
              Font.Style = []
              Condition = 
                '(Length(<frxDsItemLabels."title">) > 20) and (Length(<frxDsItemL' +
                'abels."title">) < 40)'
              FillType = ftBrush
              Frame.Typ = []
            end>
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 5.559055120000000000
          Top = 17.230971130000000000
          Width = 187.180000000000000000
          Height = 36.682436670000000000
          BarType = bcCode128A
          DataField = 'fnsku'
          DataSet = frxDsItemLabels
          DataSetName = 'frxDsItemLabels'
          Expression = '<frxDsItemLabels."fnsku">'
          Frame.Typ = []
          Rotation = 0
          TestLine = False
          Text = 'B07289ZFTZ'
          WideBarRatio = 3.000000000000000000
          Zoom = 0.980000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
        end
      end
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 944
    Top = 280
  end
  object qItemLabels: TFDQuery
    Connection = AlonDb
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftInteger
    SQL.Strings = (
      
        'select a.sku,a.fnsku,a.title , generate_series(1,qty / a.caseqty' +
        ') from polines p, ai_items a'
      'where po=5527 and a.sku=p.sku')
    Left = 928
    Top = 584
  end
  object frxDsItemLabels: TfrxDBDataset
    UserName = 'frxDsItemLabels'
    CloseDataSource = False
    DataSet = qItemLabels
    BCDToCurrency = False
    Left = 928
    Top = 648
  end
  object tbSearchItems: TFDTable
    BeforePost = tbItemsBeforePost
    AfterPost = tbItemsAfterPost
    IndexFieldNames = 'sku'
    DetailFields = 'sku'
    Connection = AlonDb
    UpdateOptions.UpdateTableName = 'ai_items'
    TableName = 'ai_items'
    Left = 96
    Top = 304
    object WideStringField1: TWideStringField
      FieldName = 'sku'
      Origin = 'sku'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object WideStringField2: TWideStringField
      FieldName = 'title'
      Origin = 'title'
      Size = 255
    end
    object WideStringField3: TWideStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object SmallintField1: TSmallintField
      FieldName = 'caseqty'
      Origin = 'caseqty'
    end
    object BCDField1: TBCDField
      FieldName = 'weight'
      Origin = 'weight'
      Precision = 10
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'qtyinv'
      Origin = 'qtyinv'
    end
    object BCDField3: TBCDField
      FieldName = 'fbacost'
      Origin = 'fbacost'
      Precision = 10
      Size = 2
    end
    object BCDField4: TBCDField
      FieldName = 'mycost'
      Origin = 'mycost'
      Precision = 10
      Size = 2
    end
    object WideStringField4: TWideStringField
      FieldName = 'ffsku'
      Origin = 'ffsku'
      Size = 64
    end
    object WideStringField5: TWideStringField
      FieldName = 'asin'
      Origin = 'asin'
      Size = 32
    end
    object IntegerField2: TIntegerField
      FieldName = 'qtymin'
      Origin = 'qtymin'
    end
    object IntegerField3: TIntegerField
      FieldName = 'qtyord'
      Origin = 'qtyord'
    end
    object IntegerField4: TIntegerField
      FieldName = 'qtymin10'
      Origin = 'qtymin10'
    end
    object IntegerField5: TIntegerField
      FieldName = 'qtyord10'
      Origin = 'qtyord10'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'lastorderdate'
      Origin = 'lastorderdate'
    end
    object IntegerField6: TIntegerField
      FieldName = 'qtyreceived'
      Origin = 'qtyreceived'
    end
    object BooleanField1: TBooleanField
      FieldName = 'isactive'
      Origin = 'isactive'
    end
    object BooleanField2: TBooleanField
      FieldName = 'addtopo'
      Origin = 'addtopo'
    end
    object IntegerField7: TIntegerField
      FieldName = 'qtyordered'
      Origin = 'qtyordered'
    end
    object WideStringField6: TWideStringField
      FieldName = 'vendor'
      Origin = 'vendor'
      Size = 5
    end
    object IntegerField8: TIntegerField
      FieldName = 'vendorqty'
      Origin = 'vendorqty'
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'vendorqtyupdate'
      Origin = 'vendorqtyupdate'
    end
    object BooleanField3: TBooleanField
      FieldName = 'needcase'
      Origin = 'needcase'
    end
    object BooleanField4: TBooleanField
      FieldName = 'oversize'
      Origin = 'oversize'
    end
    object BooleanField5: TBooleanField
      FieldName = 'mycost_changed'
      Origin = 'mycost_changed'
    end
    object BooleanField6: TBooleanField
      FieldName = 'isvendoractive'
      Origin = 'isvendoractive'
    end
    object IntegerField9: TIntegerField
      FieldName = 'qtywh'
      Origin = 'qtywh'
    end
  end
  object dsSearchItems: TDataSource
    DataSet = tbSearchItems
    Left = 96
    Top = 240
  end
  object tbReconReport: TFDTable
    IndexName = 'CreateDateDesc'
    Connection = AlonDb
    FormatOptions.AssignedValues = [fvSortOptions]
    FormatOptions.SortOptions = [soDescending]
    UpdateOptions.UpdateTableName = 'reconreport'
    TableName = 'reconreport'
    Left = 288
    Top = 304
    object tbReconReportshipid: TWideStringField
      FieldName = 'shipid'
      Origin = 'shipid'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 128
    end
    object tbReconReportshipcreatedate: TSQLTimeStampField
      FieldName = 'shipcreatedate'
      Origin = 'shipcreatedate'
      DisplayFormat = 'mm-dd-yyyy'
    end
    object tbReconReportdeleted: TIntegerField
      FieldName = 'deleted'
      Origin = 'deleted'
      OnGetText = tbReconReportdeletedGetText
    end
    object tbReconReportlastupdate: TSQLTimeStampField
      FieldName = 'lastupdate'
      Origin = 'lastupdate'
    end
    object tbReconReportread: TIntegerField
      FieldName = 'read'
      Origin = '"read"'
    end
  end
  object dsReconReport: TDataSource
    DataSet = tbReconReport
    Left = 288
    Top = 256
  end
end
