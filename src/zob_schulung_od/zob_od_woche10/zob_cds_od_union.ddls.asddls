@AbapCatalog.sqlViewName: 'ZOB_VW_OD_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View für Union'
define view ZOB_CDS_OD_UNION as select from scustom
{
  key id,
  name
}
where city = 'Walldorf'
union all
select from sbook 
{
key customid as id,
passname as Name
}
where agencynum = '00000100'
