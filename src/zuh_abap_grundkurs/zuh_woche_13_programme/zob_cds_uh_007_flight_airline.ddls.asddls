@AbapCatalog.sqlViewName: 'ZOB_UH_FLIGHT2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Extra Fluggesellschaft'
define view ZOB_CDS_UH_007_FLIGHT_AIRLINE
  as select from    sflight
    left outer join scarr on sflight.carrid = scarr.carrid
    inner join      spfli on  scarr.carrid = spfli.carrid
                          and spfli.connid = sflight.connid
{
  key scarr.carrid       as Carrid,
  key sflight.connid     as Connid,
  key sflight.fldate     as Fldate,
      scarr.carrname     as Carrname,
      scarr.currcode     as Currcode,
      scarr.url          as Url,
      sflight.price      as Price,
      sflight.currency   as Currency,
      sflight.planetype  as Planetype,
      sflight.seatsmax   as Seatsmax,
      sflight.seatsocc   as Seatsocc,
      sflight.paymentsum as Paymentsum,
      sflight.seatsmax_b as SeatsmaxB,
      sflight.seatsocc_b as SeatsoccB,
      sflight.seatsmax_f as SeatsmaxF,
      sflight.seatsocc_f as SeatsoccF,
      spfli.cityfrom     as Abflughafen,
      spfli.cityto       as Zielflughafen
}
