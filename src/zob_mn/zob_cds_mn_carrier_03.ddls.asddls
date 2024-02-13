@AbapCatalog.sqlViewName: 'ZOB_VW_MN_SCAR03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Annotationen'
define view ZOB_CDS_MN_CARRIER_03 as select from scarr
  inner join spfli
    on spfli.carrid = scarr.carrid
{
  key scarr.carrid as Carrid,
  key spfli.connid,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode @<Semantics.currencyCode: true, 
  spfli.cityfrom,
  spfli.cityto,
  @EndUserText:{
    label: 'Test',
    quickInfo: 'Nur zu Testzwecken'
  }
  'Test' as Testfield
}
where scarr.currcode = 'EUR'
