@AbapCatalog.sqlViewName: 'ZOB_VW_BV_LIST2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Carr List 2'
define view ZOB_CDS_BV_CARR_LIST2 as select from ZOB_CDS_BV_CARR_LIST
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  PriceInEuro,
  @Semantics.amount.currencyCode: 'CurrencyEuro'
  PriceInEuro * SeatsOccupiedEconomyClass as FlightAmount,
  @Semantics.currencyCode: true
  #S_CURR.'EUR' as CurrencyEuro,
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
