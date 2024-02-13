@AbapCatalog.sqlViewName: 'Z_VW_LV_FLUGINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FLUGINFORMATIONASDKN'
define view ZOB_CDS_LV_FLIGHT_INFO as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  price as Price,
  currency as Currency,
  planetype as Planetype,
  
  case
  when currency = 'USD' then cast(price as abap.fltp) * 0.85 else price
  end as NeueWaehrung,
  
  case
  when currency = 'EUR' and price < 500 then 'low cost'
  when currency = 'EUR' and price >= 500 and price <1000 then 'medium cost'
  when currency = 'EUR' and price >=1000 then 'high cost'
  else 'test'
  end as Preiskategorie
    
//  seatsmax as Seatsmax,
//  seatsocc as Seatsocc,
  
//  seatsmax_b as SeatsmaxB,
//  seatsocc_b as SeatsoccB,
//  seatsmax_f as SeatsmaxF,
//  seatsocc_f as SeatsoccF

}
