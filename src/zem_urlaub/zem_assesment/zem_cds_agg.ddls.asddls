@AbapCatalog.sqlViewName: 'ZEM_SQL_AGG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'aggregation'
define view zem_cds_agg as select from sflight
inner join scarr on scarr.carrid = sflight.carrid



{
  key sflight.carrid as Carrid,
  key sflight.connid as Connid,
  scarr.carrname as Name,
  count(*) as Zaehler,
  
  
  
  
  avg( sflight.seatsocc ) as Durchschnitt
  
  
  
 
}

group by sflight.carrid, sflight.connid, scarr.carrname
