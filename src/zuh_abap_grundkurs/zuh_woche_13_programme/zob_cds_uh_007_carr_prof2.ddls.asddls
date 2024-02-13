@AbapCatalog.sqlViewName: 'Z_UH_VW_CAR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Extra Auswertung Fluggesellschaften'
define view ZOB_CDS_UH_007_CARR_PROF2 as select from ZOB_CDS_UH_007_CARR_PROF
{
key CarrierID,
key ConnectionID,
key FlightDate,
PriceInEuro,
FlightPrice,
LocalCurrencyAirline,
PlaneType,
SeatsMaxEconomyClass,
SeatsOccupiedEconomyClass,
PaymentSum,
SeatsMaxBusinessClass,
SeatsOccupiedBusinessClass,
SeatsMaxFirstClass,
SeatsOccupiedFirstClass,
SeatBesetzt,
@Semantics.amount.currencyCode: 'LocalCurrencyAirline'
SeatBesetzt * PriceInEuro as Umsatz
 
}
