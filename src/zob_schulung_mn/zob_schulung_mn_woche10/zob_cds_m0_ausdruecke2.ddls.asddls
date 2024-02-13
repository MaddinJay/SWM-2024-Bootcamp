@AbapCatalog.sqlViewName: 'ZOB_VW_M0_AIS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'arithmetische Ausdrücke'
define view ZOB_CDS_M0_AUSDRUECKE2 as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  seatsmax - seatsocc as SeatsFree
}
