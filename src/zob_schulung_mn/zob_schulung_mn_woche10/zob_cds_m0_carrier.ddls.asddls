@AbapCatalog.sqlViewName: 'ZOB_VW_M0_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mein allererster CDS View'
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2
define view ZOB_CDS_M0_CARRIER 
with parameters
  p_curr : s_curr,
  p_text : abap.char(10)
as 
select from scarr
  left outer join spfli
    on spfli.carrid = scarr.carrid
{
  key scarr.carrid as Carrid,
  key spfli.connid as Connid,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode @<Semantics.currencyCode: true,
  scarr.url as Url,
  spfli.cityfrom as CityFrom,
  spfli.cityto as CityTo,
  @EndUserText: { label: 'Test',
                  quickInfo: 'Nur ein Test'
                }
    $parameters.p_text as test2
}
where scarr.currcode = $parameters.p_curr
