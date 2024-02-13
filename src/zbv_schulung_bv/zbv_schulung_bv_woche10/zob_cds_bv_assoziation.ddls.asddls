@AbapCatalog.sqlViewName: 'ZOB_VW_BV_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Assoziation'
define view ZOB_CDS_BV_ASSOZIATION as select from spfli
  association [1] to scarr as _Carrier
    on spfli.carrid = _Carrier.carrid
  association [*] to sflight as _Flight
    on spfli.carrid = _Flight.carrid
    and spfli.connid = _Flight.connid
   association [*] to ZOB_CDS_BV_ASSO_BOOK as _SBook //Auf Consumption-View beziehen
    on spfli.carrid = _SBook.CarrierID
    and spfli.connid = _SBook.ConnectionID
{
  key spfli.carrid as Carrid,
  key spfli.connid as Connid,
  _Carrier,
  _Flight,
  _SBook
}
