@AbapCatalog.sqlViewName: 'ZOB_VW_TW_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 1
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mein allererster CDS View'
define view ZOB_CDS_TW_Carrier
with parameters p_currcode : s_currcode,
p_text : abap.char( 10 )

  as select from scarr
    inner join   spfli on spfli.carrid = scarr.carrid
{

  key scarr.carrid   as Carrid,
  key spfli.connid,
      scarr.carrname as Carrname,
      scarr.currcode as Currcode @<Semantics.currencyCode: true,
      spfli.cityfrom,
      spfli.cityto,
      @EndUserText:{
      label: 'Test',
      quickInfo: 'Nur zu Testzwecken'
      }
      'Test'         as Testfield,
      $parameters.p_text as Textfeld
}
where
  scarr.currcode = $parameters.p_currcode
