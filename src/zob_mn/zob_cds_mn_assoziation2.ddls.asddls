@AbapCatalog.sqlViewName: 'ZOB_VW_MN_ASS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OData'
@OData.publish: true
define view ZOB_CDS_MN_ASSOZIATION2 as 
select from spfli
association [1] to scarr as _Carrier
  on spfli.carrid = _Carrier.carrid
association [*] to sflight as _Flight
  on  spfli.carrid = _Flight.carrid
  and spfli.connid = _Flight.connid
{
  key spfli.carrid as Carrid,
  key spfli.connid as Connid,
  _Carrier,
  _Flight
}
