@AbapCatalog.sqlViewName: 'ZOB_VW_LV_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds test'
define view ZLV_datadefinition_CDS as select from scarr
  left outer join spfli
  on spfli.carrid = scarr.carrid
{
  key scarr.carrid as Carrid,
  key spfli.connid as Connid,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode,
  scarr.url as Url,
  spfli.cityfrom as Cityfrom,
  spfli.cityto as Cityto
}
where scarr.currcode = 'EUR'
