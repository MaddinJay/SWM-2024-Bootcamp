@AbapCatalog.sqlViewName: 'ZOB_VW_MN_SCAR02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Erweiterung Join'
define view ZOB_CDS_MN_CARRIER_02 as
select from scarr
  inner join spfli
    on spfli.carrid = scarr.carrid
{
  key scarr.carrid as Carrid,
  key spfli.connid,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode,
  spfli.cityfrom,
  spfli.cityto
}
where scarr.currcode = 'EUR'

