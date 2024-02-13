@AbapCatalog.sqlViewName: 'Z_UH_AUSW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Extra Auswertung Fluggesellschaften'
define view ZOB_CDS_UH_007_CARR_PROF
  as select from Z_I_FLUG
{
key CarrierID,
key ConnectionID,
key FlightDate,
@Semantics.amount.currencyCode: 'LocalCurrencyAirline'
      case
      when LocalCurrencyAirline = 'EUR' then FlightPrice
      else FlightPrice* division(85, 100, 2)
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
SeatsOccupiedFirstClass,
SeatsOccupiedEconomyClass + SeatsOccupiedBusinessClass + SeatsOccupiedFirstClass as SeatBesetzt


}

