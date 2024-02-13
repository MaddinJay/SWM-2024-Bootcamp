@AbapCatalog.sqlViewName: 'ZAW_VW_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung zu Assoziationen'
define view ZOB_AW_CDS_ASSOZIATION
  as select from spfli
  association [1] to scarr   as _Carrier on  spfli.carrid = _Carrier.carrid // Assoziation zu scarr über die ID der Fluggesellschaft
  association [*] to sflight as _Flight  on  $projection.Carrid = _Flight.carrid // Assoziation zu sflight über die ID der Fluggesellschaft
                                         and spfli.connid       = _Flight.connid // und über die ID der Verbindung
  association [*] to sbook   as _Book    on  spfli.carrid = _Book.carrid
                                         and spfli.connid = _Book.connid
{
  key spfli.carrid as Carrid,
  key spfli.connid as Connid,
      _Carrier, // Exponierung der Assoziation in der Projektionsliste
      _Flight, // Exponierung der Assoziation in der Projektionsliste
      _Book

}
