@AbapCatalog.sqlViewName: 'ZOB_VW_MB_AIR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung'
define view ZOB_CDS_MB_001_Flight_Airline as select from sflight
left outer join  scarr  
on sflight.carrid = scarr.carrid 
left outer join  spfli 
 on spfli.carrid = scarr.carrid
 and spfli.connid = sflight.connid
 
 
{ key sflight.carrid as Carrid,
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
  spfli.airpfrom as airpfrom,
  spfli.airpto as airpto 
  
}
