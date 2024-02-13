@AbapCatalog.sqlViewName: 'ZOB_VW_OASOD3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flugplan'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_OD_ASSO_FL_ODATA as select from Z_I_FLUG
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
