@AbapCatalog.sqlViewName: 'ZAW_VW_BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View'
@VDM.viewType: #CONSUMPTION
define view ZAW_AW_CDS_CV_BOOK
  as select from Z_I_Flugplan
  association [1] to ZOB_AW_CDS_ASSO_FG_ODATA as _Carrier on  Z_I_Flugplan.CarrierID = _Carrier.CarrierID
  association [*] to ZOB_AW_CDS_ASSO_FL_ODATA as _Flight  on  Z_I_Flugplan.ConnectionID = _Flight.ConnectionID
                                                          and Z_I_Flugplan.CarrierID    = _Flight.CarrierID
  association [*] to Z_I_BOOK                 as _Book    on  Z_I_Flugplan.CarrierID    = _Book.Carrid
                                                          and Z_I_Flugplan.ConnectionID = _Book.Connid
{
  key Z_I_Flugplan.CarrierID,
  key Z_I_Flugplan.ConnectionID,
      Z_I_Flugplan.CountryFrom,
      Z_I_Flugplan.CityFrom,
      Z_I_Flugplan.AirportFrom,
      Z_I_Flugplan.CountryTo,
      Z_I_Flugplan.CityTo,
      Z_I_Flugplan.AirportTo,
      Z_I_Flugplan.FlightTime,
      Z_I_Flugplan.DepartureTime,
      Z_I_Flugplan.ArrivalTime,
      Z_I_Flugplan.Distance,
      Z_I_Flugplan.DistanceUnit,
      Z_I_Flugplan.FlightType,
      Z_I_Flugplan.ChangeOfDays,
      _Carrier,
      _Flight,
      _Book
}
