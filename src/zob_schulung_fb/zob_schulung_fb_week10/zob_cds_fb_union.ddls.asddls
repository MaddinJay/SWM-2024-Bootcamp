@AbapCatalog.sqlViewName: 'ZOB_VW_FB_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UNION'
define view ZOB_CDS_FB_UNION as
  select from scustom
{
  key id as ID
} where city = 'Walldorf'
union all
  select from sbook
{
  key customid as id
} where agencynum = '00000100'
