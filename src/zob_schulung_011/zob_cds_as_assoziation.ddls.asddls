@AbapCatalog.sqlViewName: 'ZOB_VW_AS_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View ASSOZIATION'
define view ZOB_CDS_AS_ASSOZIATION
  as select from spfli
  association [1] to scarr   as _Carrier on  spfli.carrid = _Carrier.carrid //0..1 Assoziation
  association [*] to sflight as _Sflight on  spfli.carrid = _Sflight.carrid //1..* Assoziation
                                         and spfli.connid = _Sflight.connid

{ //Projektionsliste
  key carrid as Carrid,
  key connid as Connid,
      _Carrier,
      _Sflight

}
