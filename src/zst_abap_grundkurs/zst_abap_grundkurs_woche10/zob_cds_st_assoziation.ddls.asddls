@AbapCatalog.sqlViewName: 'ZOB_VW_ST_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziation'
define view ZOB_CDS_ST_ASSOZIATION as select from spfli
association [1] to scarr as _Carrier
on $projection.Carrid = _Carrier.carrid
association [*] to sflight as _Flight
on $projection.Carrid = _Flight.carrid
and $projection.Connid = _Flight.connid
{
  key spfli.carrid as Carrid,
  key spfli.connid as Connid,
  _Carrier,
  _Flight
  }
