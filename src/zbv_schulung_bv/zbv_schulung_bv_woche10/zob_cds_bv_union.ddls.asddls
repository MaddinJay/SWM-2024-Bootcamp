@AbapCatalog.sqlViewName: 'ZOB_VW_BV_UNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union CDS View'
define view ZOB_CDS_BV_UNION as select from scustom
  {
  key id 
  } where city = 'Walldorf'
  union all               //union all zeigt alle ergebnisse (auch doppelte) an, union sortiert doppelte ergebnisse aus
  select from sbook
{
  key customid as id
} where agencynum = '00000100'
