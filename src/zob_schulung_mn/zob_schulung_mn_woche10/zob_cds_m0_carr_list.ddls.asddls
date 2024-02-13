@AbapCatalog.sqlViewName: 'ZOB_VW_M0_CRLST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flugumsätze'
define view ZOB_CDS_M0_CARR_LIST as select from Z_I_FLUG
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  @Semantics.amount.currencyCode: 'LocalCurrencyAirline'
  case LocalCurrencyAirline
    when 'EUR' then FlightPrice
    else FlightPrice * division(85, 100, 2)
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
