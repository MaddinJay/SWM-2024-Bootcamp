@AbapCatalog.sqlViewName: 'ZTL_SQL_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vereinigung Übung Tea'
define view ZTL_CDS_UNION
  as select from scustom //data_source mit Tabelle geändert
{
  key id
}
where
  city = 'Walldorf'
union all select from sbook
{
  key customid as id
}
where
  agencynum = '00000100'
