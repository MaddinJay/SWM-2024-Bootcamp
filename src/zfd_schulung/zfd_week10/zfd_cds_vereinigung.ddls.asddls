@AbapCatalog.sqlViewName: 'ZFD_VW_VEREINIG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Vereinigung aka UNION'
define view ZFD_CDS_Vereinigung
  as select from scustom
{
  key id as id
}
where
  city = 'walldorf'
union all select from sbook
{
  key customid as id
}
where
  agencynum = '00000100'
