@AbapCatalog.sqlViewName: 'ZEM_CDS_V4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true


@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agg'
define view ZEM_CDS_VIEW4 

as select 
from sbook
inner join stravelag on sbook.agencynum = stravelag.agencynum

{
  key sbook.carrid as Carrid,
  sbook.luggweight as Gewicht,
  sbook.wunit as Einheit,
  
  concat(stravelag.street, Concat_with_space(',', 
                           concat_with_space(stravelag.postcode, 
                          
                          concat(stravelag.city, 
                          concat_with_space(',', stravelag.country, 1) ),
                          1), 1 )) as Adresse,     

  sbook.class as Kurz,   
  
  case sbook.class
    when 'F' then '1.Klasse'
    when 'Y' then 'Economy'
    when 'C' then 'Business'
    else 'keene Ahnung'
  end as Klasse,
  
  
  case 
    when sbook.class = 'F' and sbook.luggweight > 40 then 'da geht geld drauf'
      else case   
        when (  sbook.wunit = 'KG' and sbook.luggweight > 30 ) 
        or ( sbook.wunit = 'LB ' and sbook.luggweight > 90 ) then 'hier ggf. '
      else 'kurztripp'
    end
  end as Kommentar,  
  
//  @Aggregation.referenceElement: ['Aggregar']
//  count(*) as Anzahl_Eintraege,
//  avg(sbook.luggweight) as Durchschnittsgewicht,  
//sum(sbook.luggweight) as Summe,
  
  sbook.luggweight * 1000 as X1000,
  sbook.wunit as Einheit2,

division( sbook.luggweight, 3 , 2 ) as Teilen

  
  }

where sbook.luggweight > 10 and sbook.carrid = 'LH'
//group by sbook.wunit


