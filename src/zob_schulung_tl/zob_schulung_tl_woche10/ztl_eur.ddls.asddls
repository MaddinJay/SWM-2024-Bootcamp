@AbapCatalog.sqlViewName: 'ZTL_VW_EUR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung CDS Views Präsi'
define view ZTL_EUR
  as select from scarr
{

  key carrid    as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url

}
where
  currcode = 'EUR'
