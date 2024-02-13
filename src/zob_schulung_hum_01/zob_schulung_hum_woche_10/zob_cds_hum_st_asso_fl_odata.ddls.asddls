@AbapCatalog.sqlViewName: 'ZOB_HUM_ST_ASOD2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ODATA Flug'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_HUM_ST_Asso_FL_ODATA as select from Z_I_FLUG
{
 key CarrierID,
 key ConnectionID,
 key FlightDate,
 FlightPrice,
 LocalCurrencyAirline,
 PlaneType,
 SeatsMaxEconomyClass,
 SeatsOccupiedEconomyClass,
 PaymentSum,
 SeatsMaxBusinessClass,
 SeatsOccupiedBusinessClass,
 SeatsMaxFirstClass,
 SeatsOccupiedFirstClass
}
