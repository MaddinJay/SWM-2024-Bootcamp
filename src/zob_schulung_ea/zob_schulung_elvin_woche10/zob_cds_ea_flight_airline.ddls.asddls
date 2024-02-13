@AbapCatalog.sqlViewName: 'ZOB_CDS_EA_FL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Uebung'
define view ZOB_CDS_EA_FLIGHT_AIRLINE
  as select from sflight                // Tabellen Joinen, welche wir lt. Aufgabenstellung brauchen
    inner join   scarr on sflight.carrid = scarr.carrid
    inner join   spfli on  spfli.carrid  = scarr.carrid
                       and spfli.connid  = sflight.connid
  /******************************************************************************************************/
  /******************************************************************************************************/

{

  key scarr.carrid   as carrid,         //welche Felder brauchen wir genau
  key spfli.carrid   as carrid2,
  key spfli.connid   as connid,
      scarr.carrname as carname,
      scarr.currcode as currcode,
      scarr.url      as url,
      spfli.airpfrom as airpfrm,
      spfli.airpto   as airpto
}
