@AbapCatalog.sqlViewName: 'ZOB_VW_BV_AUS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Ausdrücke 2'
define view ZOB_CDS_BV_AUSDRUECKE2 as select from sflight
{
  
  key carrid as Carrid,
  key connid as Connid,
  key fldate as FlDate,
  seatsmax - seatsocc as SeatsFree
}
