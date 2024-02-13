


@AbapCatalog.sqlViewName: 'ZEM_CDS_UEBEN1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Üben'

define view Zem_Cds_ueben 
with parameters 
//@Environment.systemField: #SYSTEM_DATE 
//p_dat : syst_datum,     
//
//@Environment.systemField: #SYSTEM_TIME
//p_zeit : syst_uzeit,
//
p_name: s_agncynam
//p_text : zem_de_name  

     
as select from scarr 
right outer join spfli
on spfli.carrid = scarr.carrid

{ 

key scarr.carrid as Carrid,

key spfli.connid as Connid,
    scarr.carrname as Carrname,
    scarr.currcode as Currcode,
    scarr.url as Url,
    spfli.countryfr as Countryfr,
    spfli.cityfrom as Cityfrom,
    spfli.cityto as Cityto, 
    spfli.distance as Distanz,
    spfli.distid as einheit,

    spfli.deptime as Abflugzeit,
    spfli.arrtime as Ankunftszeit,
    
    @EndUserText:
    {
    label: 'Testfeld',
    quickInfo: [ 'Text' ]     
    }
    
//   $parameters.p_text as Testfeld,
   
   cast(spfli.distance + 100 as int4 ) as Distanz100
   
  // $parameters.p_zeit as systemzeit,   

  // $parameters.p_dat as datum
   
   
   
    
    } 
     
 where spfli.carrid = $parameters.p_name
 
 
