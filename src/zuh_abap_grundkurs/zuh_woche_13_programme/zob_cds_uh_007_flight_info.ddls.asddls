@AbapCatalog.sqlViewName: 'ZUH_UH_FLIGHTI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Extra Fluginformation'
define view ZOB_CDS_UH_007_FLIGHT_INFO as select from sflight
{
key carrid as Carrid,
key connid as Connid,
key fldate,
price as Price,
currency as Currency,
planetype as Planetype,
@Semantics.amount.currencyCode: 'currency'
case 
when currency = 'USD' then 
price * division(85, 100, 2)
when currency = 'EUR' then price
else price
end as priceEUR

}
