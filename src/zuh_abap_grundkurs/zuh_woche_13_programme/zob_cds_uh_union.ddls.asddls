@AbapCatalog.sqlViewName: 'ZOB_VW_UH_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mein erster CDS View'
define view ZOB_CDS_UH_UNION // es wird eine Spalte aus zwei Tabellen dargestellt.
  as select from scustom // erste Tabelle
{
  key id as Id
}
where
  city = 'Walldorf'
union all
select from sbook // zweite Tabelle
{
  key customid as ID
}
where
  agencynum = '00000100'
