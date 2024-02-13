@AbapCatalog.sqlViewName: 'ZOB_VW_FB_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung 1 CDS Views'
define view ZOB_CDS_FB_CARRIER
with parameters p_curr: s_currcode,
                p_text: abap.char(10)
as select from scarr
  inner join spfli
    on spfli.carrid = scarr.carrid
{
 key scarr.carrid as Carrid,
 key spfli.connid as connid,
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
