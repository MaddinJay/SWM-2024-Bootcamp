@AbapCatalog.sqlViewName: 'Z_AW_VW_ASSO_CO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OData Flgz'
@VDM.viewType: #CONSUMPTION
define view ZOB_AW_CDS_ASSO_FL_ODATA
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
