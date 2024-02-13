@AbapCatalog.sqlViewName: 'ZEM_ASSO_CO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OData Flgz'
@VDM.viewType: #CONSUMPTION
define view Zem_cds_asso3_odata
  as select from Z_I_FLUG
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
