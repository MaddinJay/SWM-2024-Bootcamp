@AbapCatalog.sqlViewName: 'ZOB_VW_OD_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Mein aller erster CDS View'
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2
@EndUserText.label: 'Annotationen'

define view ZOB_CDS_OD_CARRIER
with parameters 
P_CURR: s_curr,
p_text: abap.char(10) as select from scarr
inner join spfli on spfli.carrid = scarr.carrid
{
  key scarr.carrid as Carrid,
  key spfli.connid as connid,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode @<Semantics.currencyCode: true,
  spfli.cityfrom,
  spfli.cityto,
  @EndUserText:{label: 'test',
  quickInfo: 'Nur zu Testzwecken'
  }
  $parameters.p_text as Paratext
  }
where scarr.currcode = $parameters.P_CURR
