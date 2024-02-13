@AbapCatalog.sqlViewName: 'ZOB_VW_LV_ASOD4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ASLKDJFLS'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_LV_ASSO_FL_ODATA
  as select from Z_I_FLUG
  association [*] to ZOB_CDS_M0_ASSO_BK_ODATA as _Booking  on  $projection.CarrierID    = _Booking.CarrierID
                                                           and $projection.ConnectionID = _Booking.ConnectionID
                                                           and $projection.FlightDate   = _Booking.FlightDate
  association [1] to I_Currency               as _Currency on  Z_I_FLUG.LocalCurrencyAirline = _Currency.Currency
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
      _Currency,
      _Booking
}
