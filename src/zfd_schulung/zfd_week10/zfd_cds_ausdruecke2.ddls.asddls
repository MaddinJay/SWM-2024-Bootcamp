@AbapCatalog.sqlViewName: 'ZFD_VW_AUS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Ausdrücke 2'
define view ZFD_CDS_AUSDRUECKE2 as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  
  seatsmax - seatsocc + seatsmax_b - seatsocc_b + seatsmax_f - seatsocc_f as Freie_Sitzplaetze_aC // Ganzzahlen Ausdruck
  
  
}
