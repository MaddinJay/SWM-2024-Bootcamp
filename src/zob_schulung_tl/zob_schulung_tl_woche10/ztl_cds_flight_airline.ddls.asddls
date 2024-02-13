@AbapCatalog.sqlViewName: 'ZTL_SQL_FGHT_AIR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Fluggesellschaft Übung Tea'
define view ZTL_CDS_FLIGHT_AIRLINE
  as select from    sflight
    inner join      scarr on sflight.carrid = scarr.carrid
    left outer join spfli on sflight.carrid = spfli.carrid
{
  key spfli.carrid     as Carrid,
  key spfli.connid     as Connid,
  //SFLIGHT Tabele
      sflight.fldate   as Fldate,
      sflight.price    as Price,
      sflight.currency as Currency,
      sflight.planetype as Planetype,
      sflight.seatsocc as SeatsOcc,
      sflight.seatsocc_b as SeatsOccB,
      sflight.seatsocc_f as SeatsOccF,
      sflight.paymentsum as PaymentSum,
    
  //SCARR Tabelle
      scarr.carrname as Carrname,
      scarr.currcode as Currcode,
  //SPFLI Tabelle
      spfli.airpfrom as AbflugFlughafen,
      spfli.airpto as ZielFlughafen
}
