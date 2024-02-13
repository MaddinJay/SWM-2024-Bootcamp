@AbapCatalog.sqlViewName: 'ZOB_VW_AS_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Aggregates'
define view ZOB_CDS_AS_AGGREGATES
  as select from sflight
{
  key carrid        as Carrid,
  key connid        as Connid,
      count(*)      as anzahlFluege,
      avg( seatsocc ) as avgSeatsocc
}

group by
  carrid,
  connid
