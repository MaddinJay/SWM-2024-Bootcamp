@AbapCatalog.sqlViewName: 'ZOB_CDS_LV_VW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TEST'
define view ZOB_CDS_LV_FLIGHT_AIRLINE as select from sflight
inner join scarr
on scarr.carrid = sflight.carrid
inner join spfli
on  scarr.carrid = spfli.carrid
and sflight.connid = spfli.connid
{ key sflight.carrid as Carrid,
  key sflight.connid as Connid,
  key sflight.fldate as Fldate,
//  key scarr.carrid as Carrid,
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
  scarr.url as Url
  
}
//where scarr.carrid = 'LH'
//select from scarr
//{
//key carrid as Carrid,
//carrname as Carrname,
//currcode as Currcode,
//url as Url,
//key scarr.carrid as ID
//}
