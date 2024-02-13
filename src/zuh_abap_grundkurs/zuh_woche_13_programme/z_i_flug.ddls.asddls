@AbapCatalog.sqlViewName: 'Z_I_SFLIGHT_BC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic-Interface-View der Tabelle SFLIGHT'
@VDM.viewType: #BASIC
define view Z_I_FLUG
  as select from sflight
{
  key carrid     as CarrierID,
  key connid     as ConnectionID,
  key fldate     as FlightDate,
      price      as FlightPrice,
      currency   as LocalCurrencyAirline,
      planetype  as PlaneType,
      seatsmax   as SeatsMaxEconomyClass,
      seatsocc   as SeatsOccupiedEconomyClass,
      paymentsum as PaymentSum,
      seatsmax_b as SeatsMaxBusinessClass,
      seatsocc_b as SeatsOccupiedBusinessClass,
      seatsmax_f as SeatsMaxFirstClass,
      seatsocc_f as SeatsOccupiedFirstClass
}
