@AbapCatalog.sqlViewName: 'ZOB_CDS_OD_AUS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ausdrücke 2'
define view ZOB_CDS_OD_AUSDRUECKE2 as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  seatsmax - seatsocc as Seatsfree

}
