@AbapCatalog.sqlViewName: 'Z_UH_VW_PR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Extra Auswertung Fluggesellschaften'
define view ZOB_CDS_UH_007_CARR_PROF3 

with parameters
p_from : dats,
p_to : dats

as select from ZOB_CDS_UH_007_CARR_PROF2
{
  key CarrierID,
  @Semantics.amount.currencyCode: 'LocalCurrencyAirline'
  sum( Umsatz ) as EndUmsatz,
  LocalCurrencyAirline
}
where FlightDate >= $parameters.p_from
and FlightDate <= $parameters.p_to
group by CarrierID, LocalCurrencyAirline
