@AbapCatalog.sqlViewName: 'ZOB_VW_MN999'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test'
define view ZOB_CDS_M0_001X
  with parameters p_test : abap.char(7)
as select from scarr
{
  key carrid as Carrid,
  carrname as Carrname,
  currcode as Currcode,
  url as Url
}
