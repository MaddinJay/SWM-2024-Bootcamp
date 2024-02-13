@AbapCatalog.sqlViewName: 'ZOB_VW_LV_AUS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ausdruecke'
define view ZOB_LV_ausdruecke as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  seatsmax - seatsocc as SeatsFree
}
