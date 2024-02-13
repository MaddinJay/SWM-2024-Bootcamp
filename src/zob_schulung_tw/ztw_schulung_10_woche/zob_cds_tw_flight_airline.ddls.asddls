@AbapCatalog.sqlViewName: 'ZOB_VW_TW_AIR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Flight Airline'
define view ZOB_CDS_TW_FLIGHT_AIRLINE as select from sflight
left outer join scarr on sflight.carrid = scarr.carrid
left outer join spfli on spfli.carrid = scarr.carrid
{
   key scarr.carrid as Carrid,
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
   spfli.airpfrom as Airpfrom,
   spfli.airpto as Airpto
}
//where sflight.fldate is null
