@AbapCatalog.sqlViewName: 'ZTL_SQL_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Aggregation Tea'
define view ZTL_CDS_AGGREGATES
  as select from sflight
{

  key carrid          as Carrid,
  key connid          as Connid,
      count(*)        as FlightCount,
      avg( seatsocc ) as AverageSeatsOcc

}
group by
carrid,
connid
