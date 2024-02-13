@AbapCatalog.sqlViewName: 'ZOB_VW_UH_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Assoziation'
define view ZOB_CDS_UH_ASSOZIATION as select from spfli
association [1] to scarr as _Carrier on spfli.carrid = _Carrier.carrid
association [*] to sflight as _Flight on $projection.Carrid = _Flight.carrid 
and $projection.Connid = _Flight.connid
//association [*] to sflight as _Flight on spfli.carrid = _Flight.carrid
//and spfli.connid = _Flight.connid
{
  key carrid as Carrid,
  key connid as Connid,
  _Carrier,
  _Flight

}
