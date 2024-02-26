@AbapCatalog.sqlViewName: 'ZABFS_VW_I_KUND'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View auf ZABFS_DB_KUND'
@VDM.viewType: #BASIC
define view ZABFS_I_DBKUND
  as select from zabfs_db_kund
{
  key kundennummer     as Kundennummer,
      vorname          as Vorname,
      nachname         as Nachname,
      verbrauchsstelle as Verbrauchsstelle,
      telefon          as Telefon
}
