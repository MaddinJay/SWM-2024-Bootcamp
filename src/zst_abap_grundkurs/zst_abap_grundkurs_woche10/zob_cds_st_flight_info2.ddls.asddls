@AbapCatalog.sqlViewName: 'ZOB_VW_ST_FLINF2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung 3 Teil 2'
define view ZOB_CDS_ST_FLIGHT_INFO2 as select from ZOB_CDS_ST_FLIGHT_INFO
{
   key Carrid,
  key Connid,
  key Fldate,
  Price,
  Currency,
  Planetype,
  EuroPrice,
  case when EuroPrice < 500 then  'Low Cost'
       when EuroPrice < 1000 then 'Medium Cost'
       else 'High Cost'
  end as FlightCategory
}
