@AbapCatalog.sqlViewName: 'ZOB_VW_BV_ASOD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumtion VIew OData'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZOB_CDS_BV_ASSO_ODATA as select from Z_I_Flugplan
  association [1] to ZOB_CDS_BV_ASSO_FG_ODATA as _Carrier
    on Z_I_Flugplan.CarrierID = _Carrier.CarrierID
  association [*] to ZOB_CDS_BV_ASSO_FL_ODATA as _Flight
  on Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
    and Z_I_Flugplan.CarrierID = _Flight.CarrierID
{
key CarrierID,
key ConnectionID,
CountryFrom,
CityFrom,
AirportFrom,
CountryTo,
CityTo,
AirportTo,
FlightTime,
DepartureTime,
ArrivalTime,
Distance,
DistanceUnit,
FlightType,
ChangeOfDays,

_Carrier,
_Flight

}
