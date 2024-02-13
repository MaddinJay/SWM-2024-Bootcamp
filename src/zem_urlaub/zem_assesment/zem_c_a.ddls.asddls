@AbapCatalog.sqlViewName: 'ZEM_C_A2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS auf ASSO'
@VDM.viewType: #CONSUMPTION // -> Systeminfo, dass es sich um eine Consumption View handelt
@OData.publish: true
define view zem_c_a
  as select from Z_I_Flugplan
  association [1] to ZEM_CDS_ASSO2_ODATA as _Carrier on  Z_I_Flugplan.CarrierID = _Carrier.CarrierID
  association [*] to Zem_cds_asso3_odata as _Flight  on  Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
                                                          and Z_I_Flugplan.CarrierID    = _Flight.CarrierID
                                                          
 association [*] to ZEM_VIEW_SBOOK as _Sbook on Z_I_Flugplan.CarrierID = _Sbook.Carrid
 
 
 
                                                          
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
      _Carrier,
      _Sbook
   
     
      
      
}
