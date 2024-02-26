@AbapCatalog.sqlViewName: 'ZABFS_VW_I_DBMON'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View auf ZABFS_DB_MON'
@VDM.viewType: #BASIC
define view ZABFS_I_DBMON
  as select from zabfs_db_mon
{
  key kundennummer   as Kundennummer,
  key auftragsnummer as Auftragsnummer,
      zaehlernummer  as Zaehlernummer,
      zaehlerstand   as Zaehlerstand,
      verbrauch      as Verbrauch,
      preis          as Preis,
      datum          as Datum,
      bestaetigung   as Bestaetigung
}
