@AbapCatalog.sqlViewName: 'ZOB_VW_AS_AUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Ausdrücke 2'
define view 

ZOB_CDS_AS_AUSDRUECKE2 as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  seatsmax - seatsocc as freeSeats,
  seatsmax_b - seatsocc_b as freeSeats_b,
  seatsmax_f - seatsocc_f as freeSeats_f,
  
  dats_days_between(20200101 , 20200110 ) as dayss
  
//  unit_conversion
//(
//quantity => dec3,
//source_unit => cast( 'MI' as abap.unit (3) ),
//target_unit => $parameters.to_unit,
//error_handling => 'SET_TO_NULL' ) as
//converted_value,
//
//  currency_conversion (
//amount => amount,
//source_currency => currency,
//round => 'X',
//target_currency => $parameters.to_currency,
//exchange_rate_date => $parameters.exc_date,
//error_handling => 'SET_TO_NULL' ) as amount  
}
