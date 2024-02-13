@AbapCatalog.sqlViewName: 'Z_AW_VW_ASSO_CO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumption View Odata'
@VDM.viewType: #CONSUMPTION // -> Systeminfo, dass es sich um eine Consumption View handelt
@OData.publish: true
define view ZOB_AW_CDS_ASSO_ODATA
  as select from Z_I_Flugplan
  association [1] to ZOB_AW_CDS_ASSO_FG_ODATA as _Carrier on  Z_I_Flugplan.CarrierID = _Carrier.CarrierID
  association [*] to ZOB_AW_CDS_ASSO_FL_ODATA as _Flight  on  Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
                                                          and Z_I_Flugplan.CarrierID    = _Flight.CarrierID
{
  key CarrierID,
  key ConnectionID,
      CountryFrom,
      CityFrom,
      AirportFrom,
      CountryTo,
      CityTo,
      AirportTo,
//      FlightTime,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      _Flight,
      _Carrier
}
