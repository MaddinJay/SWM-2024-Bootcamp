@AbapCatalog.sqlViewName: 'ZOB_VW_FB_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEWS - Übung Aggregation'
define view ZOB_CDS_FB_AGGREGATES as
select from sflight
{
    key carrid as Carrid,
    key connid as Connid,
    count(*) as FlightCount,
    avg( seatsocc ) as AverageSeatsOcc
}
group by
    carrid, connid
