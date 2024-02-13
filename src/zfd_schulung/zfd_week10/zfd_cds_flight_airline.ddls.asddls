@AbapCatalog.sqlViewName: 'ZFD_VW_FLAIRLINE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung'
define view ZFD_CDS_FLIGHT_AIRLINE as select from sflight left outer join scarr on scarr.carrid = sflight.carrid
                                                          left outer join spfli on spfli.carrid = sflight.carrid and spfli.connid = sflight.connid
{
  key sflight.carrid as Carrid,
  key sflight.connid as Connid,
  key sflight.fldate as Fldate,
  scarr.carrname as Carrname,
  scarr.currcode as Currcode,
  scarr.url as Url,
  sflight.price as Price,
  sflight.currency as Currency,
  sflight.planetype as Planetype,
  sflight.seatsmax as Seatsmax,
  sflight.seatsocc as Seatsocc,
  sflight.paymentsum as Paymentsum,
  sflight.seatsmax_b as SeatsmaxB,
  sflight.seatsocc_b as SeatsoccB,
  sflight.seatsmax_f as SeatsmaxF,
  sflight.seatsocc_f as SeatsoccF,
  spfli.airpfrom as airpfrom,
  spfli.airpto as airpto
  
}
where scarr.carrname = 'Lufthansa'
