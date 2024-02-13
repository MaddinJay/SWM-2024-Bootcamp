@AbapCatalog.sqlViewName: 'ZOB_VW_M0_FLINF2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluginformationen Extra'
define view ZOB_CDS_M0_FLIGHT_INFO2 as 
select from ZOB_CDS_M0_FLIGHT_INFO
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
