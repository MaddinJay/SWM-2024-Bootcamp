@AbapCatalog.sqlViewName: 'ZOB_VW_M0_CARPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Auswertung Fluggesellschaften.'
define view ZOB_CDS_M0_CARR_PROF
with parameters
  p_from : dats,
  p_to : dats
as 

select from ZOB_CDS_M0_CARR_LIST2(p_from : $parameters.p_from, p_to : $parameters.p_to)
{
  key CarrierID,
  @Semantics.amount.currencyCode: 'CurrencyEuro'
  sum( FlightAmount ) as Umsatz,
  CurrencyEuro
  }
 
  group by CarrierID, CurrencyEuro
