@AbapCatalog.sqlViewName: 'ZOB_VW_BV_FINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Flight Info'
define view ZOB_CDS_BV_FLIGHT_INFO 

as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Flydate,
  cast( price as abap.fltp ) as Price,
  currency as Currency,
  planetype as Planetype,
  
  case
  when currency = 'USD'
  then cast(price as abap.fltp) * 0.85
  else price
  end as Preis_EUR,
  
  case
  when price > 1000
  then 'High Cost'
  when price > 500
  then 'Meidum Cost'
  else 'Low Cost'
  end as Flight_Category

}
