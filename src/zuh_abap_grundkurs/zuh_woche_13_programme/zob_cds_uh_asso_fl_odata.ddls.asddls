@AbapCatalog.sqlViewName: 'ZOB_UH_ODAFL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung ODATA'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_UH_ASSO_FL_ODATA as select from Z_I_FLUG
association [*] to ZOB_CDS_UH_ASSO_BU_ODATA as _Buchung on Z_I_FLUG.CarrierID = _Buchung.CarrierID and Z_I_FLUG.ConnectionID = _Buchung.ConnectionID 
association [1] to I_Currency as _Waehrung on Z_I_FLUG.LocalCurrencyAirline = _Waehrung.Currency
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
SeatsOccupiedFirstClass,
_Buchung,
_Waehrung

}
