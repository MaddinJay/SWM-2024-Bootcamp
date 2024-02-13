@AbapCatalog.sqlViewName: 'ZOB_VW_UH_AUS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Ausdrücke 2ter Teil'
define view ZOB_CDS_UH_AUSDRUECKE2_1 as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
(seatsmax + seatsmax_b + seatsmax_f) - (seatsocc + seatsocc_b + seatsocc_f)  as SeatsFree
}
