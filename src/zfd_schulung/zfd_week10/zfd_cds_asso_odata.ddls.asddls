@AbapCatalog.sqlViewName: 'ZFD_VW_AS_FP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumption View Odata'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZFD_CDS_Asso_ODATA as select from Z_I_Flugplan
  association [1] to ZFD_CDS_Asso_FG_ODATA as _Carrier
    on Z_I_Flugplan.CarrierID = _Carrier.CarrierID
  association [*] to ZFD_CDS_Asso_FLUG_ODATA as _Flight
    on Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
    and Z_I_Flugplan.CarrierID = _Flight.CarrierID
//  association [*] to ZFD_CDS_Asso_Buch_ODATA as _Book
//    on Z_I_Flugplan.ConnectionID = _Book.ConnectionID
//    and Z_I_Flugplan.CarrierID = _Book.CarrierID
//  association [1] to I_Currency as _Curr
//    on Z_I_BUCHUNG.Currency = _Curr.Currency
    
{
  key CarrierID,
  key ConnectionID,
  CountryFrom,
  CityFrom,
  AirportFrom,
  CountryTo,
  CityTo,
  AirportTo,
//  FlightTime,
  DepartureTime,
  ArrivalTime,
  Distance,
  DistanceUnit,
  FlightType,
  ChangeOfDays,
  _Carrier,
  _Flight
}
