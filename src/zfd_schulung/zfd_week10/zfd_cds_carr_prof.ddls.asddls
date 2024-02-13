@AbapCatalog.sqlViewName: 'ZFD_VW_CARR_PROF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra: Auswertung über Fluggesellschaften in einem Zeitraum'
@VDM.viewType: #CONSUMPTION
define view ZFD_CDS_CARR_PROF 
  with parameters
    p_from : dats,
    p_to : dats

as select from ZFD_CDS_CARR_List2

association [1] to ZFD_CDS_CARR_PROF_AS_FP2 as _AvgKmPC // Average Kilometer Per Carrier
on  $projection.CarrierID = _AvgKmPC.CarrierID

{

key CarrierID,
@Semantics.amount.currencyCode: 'CurrencyEuro'
sum(FlightAmount) as Umsatz,
CurrencyEuro,
_AvgKmPC  
}

where FlightDate >= $parameters.p_from 
  and FlightDate <= $parameters.p_to
group by CarrierID, CurrencyEuro
