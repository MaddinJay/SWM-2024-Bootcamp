@AbapCatalog.sqlViewName: 'ZFL_ODATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FL_ODATA'
define view ZOB_CDS_EA_ASSO_FL_ODATA as select from Z_I_FLUG
{
  
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  FlightPrice,
  LocalCurrencyAirline,
  PlaneType,
  SeatsMaxEconomyClass,
  SeatsOccupiedEconomyClass,
  PaymentSum,
  SeatsMaxBusinessClass,
  SeatsOccupiedBusinessClass,
  SeatsMaxFirstClass,
  SeatsOccupiedFirstClass
}
