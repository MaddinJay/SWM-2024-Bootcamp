@AbapCatalog.sqlViewName: 'ZOB_VW_TW_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Union'
define view ZOB_CDS_TW_UNION
  as select from scustom
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
