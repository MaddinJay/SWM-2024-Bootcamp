@AbapCatalog.sqlViewName: 'ZOB_VW_ST_FLINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung 3'
define view ZOB_CDS_ST_FLIGHT_INFO as select from sflight
{
 key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  price as Price,
  currency as Currency,
  planetype as Planetype,
  @Semantics.amount.currencyCode: 'currency'
  case currency when 'EUR' then price
    else price * division(85, 100, 2)  
  end as EuroPrice
    
  
}
