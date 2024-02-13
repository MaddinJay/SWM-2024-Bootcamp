@AbapCatalog.sqlViewName: 'ZEA_AGGREGATES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AGGREGATES'
define view ZOB_CDS_EA_AGGREGATES 
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

