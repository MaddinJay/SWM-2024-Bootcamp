@AbapCatalog.sqlViewName: 'ZABFS_VW_EMON'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View für Energiemonitor'
@VDM.viewType: #CONSUMPTION
define view ZABFS_CDS_ENERMON as select from ZABFS_I_DBMON
  association [1] to ZABFS_I_DBKUND as _Kund
  on ZABFS_I_DBMON.Kundennummer = _Kund.Kundennummer

{
  key ZABFS_I_DBMON.Kundennummer,
  key ZABFS_I_DBMON.Auftragsnummer,
  ZABFS_I_DBMON.Zaehlernummer,
  ZABFS_I_DBMON.Zaehlerstand,
  ZABFS_I_DBMON.Verbrauch,
  ZABFS_I_DBMON.Preis,
  ZABFS_I_DBMON.Datum,
  ZABFS_I_DBMON.Bestaetigung,
  _Kund
}
