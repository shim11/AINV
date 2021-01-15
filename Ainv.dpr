program Ainv;

uses
  Vcl.Forms,
  Windows,
  CountdownUnit in 'CountdownUnit.pas' {fmCountDown},
  DBUnit in 'DBUnit.pas' {DM: TDataModule},
  EditItemUnit in 'EditItemUnit.pas' {fmEditItem},
  EditPoUnit in 'EditPoUnit.pas' {fmPo},
  EditReceivePoUnit in 'EditReceivePoUnit.pas' {fmReceiver},
  EditVendorUnit in 'EditVendorUnit.pas' {fmEditVendor},
  InventoryForm in 'InventoryForm.pas' {fmInventory},
  PurchaseOrdersUnit in 'PurchaseOrdersUnit.pas' {fmPurchaseOrders},
  SkuPurchaseOrdersUnit in 'SkuPurchaseOrdersUnit.pas' {fmSkuPurchaseOrders},
  VendorsUnit in 'VendorsUnit.pas' {fmVendors},
  WarehousesUnit in 'WarehousesUnit.pas' {fmWarehouses},
  Vcl.Themes,
  Vcl.Styles,
  SendMailUnit in 'SendMailUnit.pas' {fmSendMail},
  SplashForm in 'SplashForm.pas' {fmSplash},
  CreatePOLinesUnit in 'CreatePOLinesUnit.pas' {fmCreatePoLines},
  ProblemQtyUnit in 'ProblemQtyUnit.pas' {fmShipQtyProblem},
  AdressSearchUnit in 'AdressSearchUnit.pas' {fmAdressSearch};

{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}
{$R *.res}

begin
  if (FindWindow('TfmInventory', nil) > 0) then
    begin
      // Application.showmessage();
      exit
    end;

  Application.Initialize;
  fmSplash := TfmSplash.Create(nil);
  fmSplash.Show;
  fmSplash.Update;
  fmSplash.mmText.lines.Insert(0,'Ainv application started');
  Application.MainFormOnTaskbar := True;
  fmSplash.mmText.lines.Insert(0,'Create main form');
  Application.CreateForm(TfmInventory, fmInventory);
  Application.CreateForm(TfmShipQtyProblem, fmShipQtyProblem);
  Application.CreateForm(TfmAdressSearch, fmAdressSearch);
  fmSplash.mmText.lines.Insert(0,'Create data module');
  Application.CreateForm(TDM, DM);
  fmSplash.mmText.lines.Insert(0,'Create items edit form');
  Application.CreateForm(TfmEditItem, fmEditItem);
  fmSplash.mmText.lines.Insert(0,'Create purchase orders form');
  Application.CreateForm(TfmPo, fmPo);
  fmSplash.mmText.lines.Insert(0,'Create items receiver');
  Application.CreateForm(TfmReceiver, fmReceiver);
  fmSplash.mmText.lines.Insert(0,'Create edit vendors form');
  Application.CreateForm(TfmEditVendor, fmEditVendor);
  fmSplash.mmText.lines.Insert(0,'Create purchase orders editor');
  Application.CreateForm(TfmPurchaseOrders, fmPurchaseOrders);
  fmSplash.mmText.lines.Insert(0,'Create vendors form');
  Application.CreateForm(TfmVendors, fmVendors);
  fmSplash.mmText.lines.Insert(0,'Create warehouses form');
  Application.CreateForm(TfmWarehouses, fmWarehouses);
  fmSplash.mmText.lines.Insert(0,'Create countdown unit');
  Application.CreateForm(TfmCountDown, fmCountDown);
  fmSplash.mmText.lines.Insert(0,'Create sendmail unit');
  Application.CreateForm(TfmSendMail, fmSendMail);
  Application.CreateForm(TfmSkuPurchaseOrders, fmSkuPurchaseOrders);
  Application.CreateForm(TfmCreatePoLines, fmCreatePoLines);
  fmSplash.mmText.lines.Insert(0,'Finish loading. Start AINV');
  fmSplash.close;
  fmSplash.Free;
  Application.Run;

end.
