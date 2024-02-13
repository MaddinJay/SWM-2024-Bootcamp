@AbapCatalog.sqlViewName: 'ZOB_VW_BV_LIST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Carr List'
define view ZOB_CDS_BV_CARR_LIST
  as select from Z_I_FLUG
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  @Semantics.amount.currencyCode: 'LocalCurrencyAirline'
  case LocalCurrencyAirline
   when 'EUR' then FlightPrice
   else FlightPrice * division(100, 85, 2)
  end as PriceInEuro,
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
