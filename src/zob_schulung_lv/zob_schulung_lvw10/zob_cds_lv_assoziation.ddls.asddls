@AbapCatalog.sqlViewName: 'ZOB_VW_M0ASOD2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DÖAKVJRSE'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZOB_CDS_LV_ASSOZIATION
  as select from Z_I_Flugplan
  association [1] to ZOB_CDS_LV_Asso_fg_odata as _Carrier on  Z_I_Flugplan.CarrierID = _Carrier.CarrierID
  association [*] to ZOB_CDS_LV_ASSO_FL_ODATA as _Flight  on  Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
                                                          and Z_I_Flugplan.CarrierID    = _Flight.CarrierID
  association [*] to Z_I_BUCHUNG              as _Buchung on  Z_I_Flugplan.CarrierID    = _Buchung.CarrierID
                                                          and Z_I_Flugplan.ConnectionID = _Buchung.ConnectionID
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
      _Flight,
      _Carrier,
      _Buchung
}
