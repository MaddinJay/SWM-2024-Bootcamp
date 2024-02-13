@AbapCatalog.sqlViewName: 'ZOB_VW_FB_JOIN2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Erweiterung Join'
define view ZOB_CDS_FB_CARRIER_02
as select from scarr
  left outer join spfli
    on spfli.carrid = scarr.carrid
{
 key scarr.carrid as Carrid,
 key spfli.connid,
 scarr.carrname as Carrname,
 scarr.currcode as Currcode,
 spfli.cityfrom as CityFrom,
 spfli.cityto   as CityTo
}
where scarr.currcode = 'EUR'
