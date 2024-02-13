@AbapCatalog.sqlViewName: 'ZFD_VW_AS_FLUG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumption View Odata Flug'
@VDM.viewType: #CONSUMPTION
define view ZFD_CDS_Asso_FLUG_ODATA as select from Z_I_FLUG
  association [*] to ZFD_CDS_Asso_Buch_ODATA as _Booking
    on $projection.CarrierID = _Booking.CarrierID
    and $projection.ConnectionID = _Booking.ConnectionID
    and $projection.FlightDate = _Booking.FlightDate
  association [1] to I_Currency as _Currency
    on Z_I_FLUG.LocalCurrencyAirline = _Currency.Currency
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
  SeatsOccupiedFirstClass,
  _Booking,
  _Currency
}
