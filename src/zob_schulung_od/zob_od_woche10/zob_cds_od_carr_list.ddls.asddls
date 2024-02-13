@AbapCatalog.sqlViewName: 'ZOB_VW_CARRLIST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Liste Flugumsätze'
define view ZOB_CDS_OD_CARR_LIST as select from Z_I_FLUG
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  case LocalCurrencyAirline
  when 'EUR' then FlightPrice
  else FlightPrice * division(85, 100, 2) 
  end as PriceInEuro,
  PlaneType,
  SeatsMaxEconomyClass,
  SeatsOccupiedEconomyClass,
  PaymentSum,
  SeatsMaxBusinessClass,
  SeatsOccupiedBusinessClass,
  SeatsMaxFirstClass,
  SeatsOccupiedFirstClass
}
