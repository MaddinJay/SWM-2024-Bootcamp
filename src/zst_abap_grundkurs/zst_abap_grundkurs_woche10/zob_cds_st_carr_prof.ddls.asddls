@AbapCatalog.sqlViewName: 'ZOB_ST_VW_CAPROF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Auswertung über Fluggesellschaften in einem Zeitraum'
define view ZOB_CDS_ST_CARR_PROF 
with parameters p_from : dats,
p_to : dats

as select from ZOB_CDS_ST_CARR_List2

{
key CarrierID,
@Semantics.amount.currencyCode: 'CurrencyEuro'
sum( FlightAmount ) as Umsatz,
CurrencyEuro

}
where FlightDate >= $parameters.p_from
and FlightDate <= $parameters.p_to
group by CarrierID, CurrencyEuro
