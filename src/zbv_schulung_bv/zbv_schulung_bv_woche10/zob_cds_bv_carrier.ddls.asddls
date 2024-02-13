@AbapCatalog.sqlViewName: 'ZOB_VW_BV_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 1
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Annotationen'
define view ZOB_CDS_BV_CARRIER 
with parameters
p_curr: s_currcode,
p_text: abap.char( 10 )
as select from scarr
left outer join spfli on spfli.carrid = scarr.carrid
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
    $parameters.p_text as Testfield
}
where scarr.currcode = $parameters.p_curr
