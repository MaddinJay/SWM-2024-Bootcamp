@AbapCatalog.sqlViewName: 'ZOB_VW_OASOD1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumtion View Odata'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZOB_CDS_OD_ASSO_ODATA as select from Z_I_Flugplan
association[1] to ZOB_CDS_OD_ASSO_FG_ODATA as _Carrier
on Z_I_Flugplan.CarrierID = _Carrier.CarrierID
association [*] to ZOB_CDS_OD_ASSO_FL_ODATA as _Flight
on Z_I_Flugplan.CarrierID = _Flight.CarrierID
and Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
{
  key CarrierID,
  key ConnectionID,
  CountryFrom,
  CityFrom,
  AirportFrom,
  CountryTo,
  CityTo,
  AirportTo,
cast (FlightTime as int4) as FlightTime,
  DepartureTime,
  ArrivalTime,
  Distance,
  DistanceUnit,
  FlightType,
  ChangeOfDays,
  _Carrier,
  _Flight
}
