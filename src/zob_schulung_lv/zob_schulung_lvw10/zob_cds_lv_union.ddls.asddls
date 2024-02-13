@AbapCatalog.sqlViewName: 'ZOB_VW_LV_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'uebung vereinigung union'
define view ZOB_CDS_LV_Union as select from scustom
{
  key id as ID
}
where city = 'Walldorf'
union all
select from sbook
{
key sbook.customid as ID
}
where sbook.agencynum = '00000100'
