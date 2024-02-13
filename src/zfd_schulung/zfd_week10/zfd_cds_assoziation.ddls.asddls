@AbapCatalog.sqlViewName: 'ZFD_VW_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Assoziationen'
define view ZFD_CDS_Assoziation
  as select from spfli
  association [0..1] to scarr   as _Carrier // oder association [1] to scarr as _Carrier (Kurzschreibweise)
  on  spfli.carrid = _Carrier.carrid
  association [0..*] to sflight as _Flight // oder association [*]  (Kurzschreibweise)
  on  $projection.Carrid = _Flight.carrid
  and $projection.Connid = _Flight.connid // alternative mit $projection

{
  key spfli.carrid as Carrid,
  key spfli.connid as Connid,
      _Carrier,
      _Flight

}
