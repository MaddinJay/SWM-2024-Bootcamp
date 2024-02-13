@AbapCatalog.sqlViewName: 'ZOB_VW_ST_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregation'
define view ZOB_CDS_ST_AGGREGATES
  as select from sflight
{
  key carrid          as Carrid,
  key connid          as Connid,
      count(*)        as FlightCount,
      avg( seatsocc ) as AverageSeatsOcc,
      avg( seatsocc_b ) as AverageSeatsOcc_B,
      avg( seatsocc_f ) as AverageSeatsOcc_F
}
group by
  carrid,
  connid
