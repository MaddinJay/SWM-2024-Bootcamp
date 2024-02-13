@AbapCatalog.sqlViewName: 'ZTL_SQL_AUSDR2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung 2 Ausdrücke Tea'
define view ZTL_CDS_AUSDR2 as select from sflight
{
  
  key carrid as Carrid,
  key connid as Connid,
  key fldate as FlDate,
  seatsmax - seatsocc as SeatsFree
}
