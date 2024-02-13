@AbapCatalog.sqlViewName: 'ZOB_FB_FLIGHTAIR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEWS - Übung Extra Fluggesellschaft'
define view ZOB_CDS_FB_EXTRA_1 as select from sflight
  inner join scarr
    on sflight.carrid = scarr.carrid
    
  inner join spfli
    on spfli.carrid = scarr.carrid
    and spfli.connid = sflight.connid
{
key scarr.carrid as Carrid,
key sflight.carrid as Fluggesellschaft,
key sflight.connid as Connid,
key sflight.fldate as Fldate,
scarr.carrname as Carrname,
scarr.currcode as Currcode,
scarr.url as Url,
sflight.price as Price,
sflight.currency as Currency,
sflight.planetype as Planetype,

spfli.airpfrom as Abflughafen,
spfli.airpto as Zielflughafen

}
