@AbapCatalog.sqlViewName: 'ZOB_VW_ST_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering:{status: #ACTIVE,
type: #GENERIC,
numberOfKeyFields: 2}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mein allererster CDS View'
define view ZOB_CDS_ST_Carrier
with parameters p_currcode : s_currcode, p_text : abap.char ( 10 )
  as select from    scarr
    left outer join spfli on spfli.carrid = scarr.carrid
{
  key scarr.carrid   as Carrid,
  key spfli.connid   as Connid,
      scarr.carrname as Carrname,
      scarr.currcode as Currcode @< Semantics.currencyCode: true,
      spfli.cityfrom as Cityfrom,
      spfli.cityto   as Cityto,
      @EndUserText:{
      label: 'Test',
      quickInfo: 'Nur zu Testzwecken'
      }
      $parameters.p_text         as Testfield 
}
where
  scarr.currcode = $parameters.p_currcode
