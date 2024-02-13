@AbapCatalog.sqlViewName: 'ZOB_VW_ST_CRLIST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flugumsätze'
define view ZOB_CDS_ST_CARR_List as select from Z_I_FLUG
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
 @Semantics.amount.currencyCode: 'LocalCurrencyAirline'
  case LocalCurrencyAirline
  when 'EUR' then FlightPrice
  else FlightPrice * division (85, 100, 2)
  end as PriceinEuro,
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
