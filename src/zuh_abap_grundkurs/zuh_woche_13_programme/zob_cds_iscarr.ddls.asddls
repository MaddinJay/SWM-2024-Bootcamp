@AbapCatalog.sqlViewName: 'ZOB_UH_ISCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basis-View SCARR'
define view ZOB_CDS_ISCARR as select from scarr
{
  key carrid as Carrid,
  carrname as Carrname,
  currcode as Currcode,
  url as Url
}
