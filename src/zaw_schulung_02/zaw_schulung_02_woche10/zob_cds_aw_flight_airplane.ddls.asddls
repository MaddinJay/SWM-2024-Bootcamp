@AbapCatalog.sqlViewName: 'Z_AW_VW_AIRPLANE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FLuggesellschaft'
define view ZOB_CDS_AW_FLIGHT_AIRPLANE
  as select from    sflight
    left outer join scarr on scarr.carrid = sflight.carrid
    left outer join spfli on spfli.connid = sflight.connid
{
  key scarr.carrid       as Carrid,
  key sflight.connid     as Connid,
  key sflight.fldate     as Fldate,
      scarr.carrname     as Carrname,
      scarr.currcode     as Currcode,
      scarr.url          as Url,
      spfli.airpfrom     as Abflughafen,
      spfli.airpto       as Zielflughafen,
      sflight.price      as Price,
      sflight.currency   as Currency,
      sflight.planetype  as Planetype,
      sflight.seatsmax   as Seatsmax,
      sflight.seatsocc   as Seatsocc,
      sflight.paymentsum as Paymentsum,
      sflight.seatsmax_b as SeatsmaxB,
      sflight.seatsocc_b as SeatsoccB,
      sflight.seatsmax_f as SeatsmaxF,
      sflight.seatsocc_f as SeatsoccF
}
