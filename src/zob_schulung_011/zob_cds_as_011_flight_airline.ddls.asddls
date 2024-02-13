@AbapCatalog.sqlViewName: 'ZOB_VW_AS_FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Airline View'
define view ZOB_CDS_AS_011_FLIGHT_AIRLINE
  as select from    sflight
    inner join scarr on sflight.carrid = scarr.carrid
    inner join spfli on scarr.carrid = spfli.carrid and spfli.connid = sflight.connid
{
  key scarr.carrid as Carrid,
  key sflight.carrid as Carrid2,
  key sflight.connid as Connid,
  key sflight.fldate as Fldate,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode,
  spfli.airpfrom as Abflugflughafen,
 spfli.airpto as Zielflughafen
 

}
