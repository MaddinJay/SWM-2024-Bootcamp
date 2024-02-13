@AbapCatalog.sqlViewName: 'Z_I_SPFLI_BC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic-Interface-View der Tabelle SPFLI'
@VDM.viewType: #BASIC
define view Z_I_Flugplan as select from spfli
{
  key carrid as CarrierID,
  key connid as ConnectionID,
  countryfr as CountryFrom,
  cityfrom as CityFrom,
  airpfrom as AirportFrom,
  countryto as CountryTo,
  cityto as CityTo,
  airpto as AirportTo,
  fltime as FlightTime,
  deptime as DepartureTime,
  arrtime as ArrivalTime,
  distance as Distance,
  distid as DistanceUnit,
  fltype as FlightType,
  period as ChangeOfDays
}
