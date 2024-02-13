@AbapCatalog.sqlViewName: 'ZEM_CDS_AVG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra cDS mit AVG'
define view ZEM_CDS_EXTRA_AVG 

with parameters
//@Environment.systemField: #SYSTEM_DATE
p_von:abap.dats,

//@Environment.systemField: #SYSTEM_DATE
p_bis : abap.dats

as select from zem_cds_extra 
inner join scarr as s 
on s.carrid = zem_cds_extra.Carrid


{
  
  key s.carrid as Carrid,
  s.carrname as Carrname,
  avg(zem_cds_extra.Kosten as abap.dec(31,2) ) as Preisschnitt
  
  
}
where zem_cds_extra.Fldate between $parameters.p_von and $parameters.p_bis
group by s.carrid, s.carrname
