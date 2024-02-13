@AbapCatalog.sqlViewName: 'ZOB_VW_MN_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregation'
define view ZOB_CDS_MN_AGGREGATES as 
select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  count(*) as FlightCount,
  avg( seatsocc ) as AverageSeatsOcc
}
group by
  carrid,
  connid
