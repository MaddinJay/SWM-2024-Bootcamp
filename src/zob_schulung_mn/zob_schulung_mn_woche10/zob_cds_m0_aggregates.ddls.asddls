@AbapCatalog.sqlViewName: 'ZOB_VW_M0_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregation'
define view ZOB_CDS_M0_AGGREGATES
  as select from sflight
{
  key carrid          as Carrid,
  key connid          as Connid,
      count(*)        as FlightCount,
      avg( seatsocc ) as AverageSeatsOcc,
      avg( seatsocc as  abap.dec( 20, 2 ) )  as AverageSeatsOcc2
}

group by
  carrid,
  connid
