@AbapCatalog.sqlViewName: 'ZOB_VW_ST_FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extraübung'
define view ZOB_CDS_ST_FLIGHT_AIRLINE as select from sflight
left outer join scarr on sflight.carrid = sflight.carrid
left outer join spfli on spfli.carrid = sflight.carrid and spfli.connid = sflight.connid
{
 key sflight.carrid as Carrid,
 key sflight.connid as Connid,
 key sflight.fldate as Fldate,
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
 scarr.carrname as Carrname,
 scarr.currcode as Currcode,
 spfli.cityfrom as Cityfrom,
 spfli.cityto as Cityto
}
