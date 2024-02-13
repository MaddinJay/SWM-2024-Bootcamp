@AbapCatalog.sqlViewName: 'ZOB_AW_VW_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View'
define view ZOB_AW_CDS_UNION as select from scustom
{
  key id
} where city = 'Walldorf' 
union // Es werden Duplikate aussortiert. Union all zeigt alles an. 
select from sbook
{
  key customid as id
} where agencynum = '00000100'
