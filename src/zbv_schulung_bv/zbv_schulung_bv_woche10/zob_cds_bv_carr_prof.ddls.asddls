@AbapCatalog.sqlViewName: 'ZOB_VW_BV_CARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Carr Prof'
define view ZOB_CDS_BV_CARR_PROF 
with parameters
  p_from: dats,
  p_to: dats
as select from ZOB_CDS_BV_CARR_LIST2
{
key CarrierID,
@Semantics.amount.currencyCode: 'CurrencyEuro'
sum( FlightAmount ) as Umsatz,
CurrencyEuro
}
where FlightDate >= $parameters.p_from
and FlightDate <= $parameters.p_to
group by CarrierID, CurrencyEuro
