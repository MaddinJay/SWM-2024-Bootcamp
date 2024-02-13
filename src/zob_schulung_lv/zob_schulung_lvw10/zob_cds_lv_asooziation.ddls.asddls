@AbapCatalog.sqlViewName: 'Z_VW_LV_ASSOZI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'asooziaöslkfjut'
define view ZOB_CDS_LV_ASOOZIATION
  as select from spfli
  association [1] to scarr   as _Carrier on  spfli.carrid = _Carrier.carrid
  association [*] to sflight as _Flight  on  spfli.carrid = _Flight.carrid
                                         and spfli.connid = _Flight.connid
{
  key carrid as Carrid,
  key connid as Connid,
      _Carrier,
      _Flight
}
