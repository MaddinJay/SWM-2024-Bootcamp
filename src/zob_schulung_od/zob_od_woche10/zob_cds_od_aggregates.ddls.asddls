@AbapCatalog.sqlViewName: 'ZOB_VW_OD_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Woche 10'
define view ZOB_CDS_OD_AGGREGATES as select from sflight 
{
  key connid as connid,
  key carrid as carrid,
  count(*) as FlightCount,
  avg( seatsocc ) as AverageSeatsOcc
}
group by
carrid,
connid
