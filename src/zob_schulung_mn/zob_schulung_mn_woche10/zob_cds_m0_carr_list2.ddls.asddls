@AbapCatalog.sqlViewName: 'ZOB_VW_M0_CRLS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Umsatz aggr.'
define view ZOB_CDS_M0_CARR_LIST2
with parameters
  p_from : dats,
  p_to : dats

as select from ZOB_CDS_M0_CARR_LIST
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
where FlightDate <= $parameters.p_to and FlightDate >= $parameters.p_from
