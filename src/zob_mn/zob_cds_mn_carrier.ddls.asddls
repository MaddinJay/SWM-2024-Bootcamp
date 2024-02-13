@AbapCatalog.sqlViewName: 'ZOB_VW_MN_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mein allererster CDS View'
define view ZOB_CDS_MN_CARRIER as select from scarr
{
  key carrid as Carrid,
  carrname as Carrname,
  currcode as Currcode,
  url as Url
}
where currcode = 'EUR'
