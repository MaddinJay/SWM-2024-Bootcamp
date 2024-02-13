@AbapCatalog.sqlViewName: 'ZOB_AS_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Union'
define view ZOB_CDS_AS_UNION as select from scustom
{
  key id as Id
}
where city = 'Walldorf'
union all
select from sbook
{
key sbook.customid as Id
}
where sbook.agencynum = '00000100'
