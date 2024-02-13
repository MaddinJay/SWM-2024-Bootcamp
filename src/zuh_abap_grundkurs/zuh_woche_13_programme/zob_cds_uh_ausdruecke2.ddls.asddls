@AbapCatalog.sqlViewName: 'ZOB_VW_AUSD2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Ausdrücke View in View'
define view ZOB_CDS_UH_AUSDRUECKE2 as select from ZOB_CDS_UH_AUSDRUECKE
{
  key Carrid,
  key Connid,
  key Fldate,
  key Bookid,
  Gewicht,
  Einheit,
  ClassText,
  ExcessLuggage,
  ExcessLuggage2
}

where ExcessLuggage = 'X'
