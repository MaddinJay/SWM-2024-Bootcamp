@AbapCatalog.sqlViewName: 'ZOB_VW_ST_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vereinigung'
define view ZOB_CDS_ST_Union as select from scustom
{
  key id
}
where city = 'Walldorf'
union all

select from sbook

{
key customid as id
}

where agencynum = '00000100'
