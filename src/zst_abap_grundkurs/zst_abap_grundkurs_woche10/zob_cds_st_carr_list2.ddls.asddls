@AbapCatalog.sqlViewName: 'ZOB_VW_ST_CRLS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Umsatz aggr.'
define view ZOB_CDS_ST_CARR_List2 as select from ZOB_CDS_ST_CARR_List
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  PriceinEuro,
  @Semantics.amount.currencyCode: 'LocalCurrencyAirline'
  PriceinEuro * SeatsOccupiedEconomyClass as FlightAmount,
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
