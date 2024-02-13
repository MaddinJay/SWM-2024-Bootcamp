@AbapCatalog.sqlViewName: 'ZTL_SQL_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@OData.publish: true
@EndUserText.label: 'Assoziation Übung Tea'
define view ZTL_CDS_ASSO
  as select from spfli
  association [1] to scarr   as _Carrier on  spfli.carrid = _Carrier.carrid
  association [*] to sflight as _Flight  on  spfli.carrid = _Flight.carrid
                                         and spfli.connid = _Flight.connid
  association [*] to ZTL_CDS_SBOOK as _Sbook on spfli.carrid = _Sbook.CarrierID
  and spfli.connid = _Sbook.ConnectionID
{
  key spfli.carrid as Carrid,
  key spfli.connid as Connid,
      _Carrier,
      _Flight,
      _Sbook
}
