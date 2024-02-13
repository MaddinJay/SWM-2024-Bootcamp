@AbapCatalog.sqlViewName: 'ZFD_VW_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Aggregation'
define view ZFD_CDS_AGGREGATES
  as select from sflight
{
  key carrid          as Carrid,
  key connid          as Connid,

     count(*)        as FlightsCount,

     avg( seatsocc ) as AVG_Seatsocc,
     avg( seatsocc as abap.dec( 20,2 ) ) as AVG_Seatsocc2

}
group by  carrid,connid
