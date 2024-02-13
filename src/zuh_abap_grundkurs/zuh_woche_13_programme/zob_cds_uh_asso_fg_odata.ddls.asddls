@AbapCatalog.sqlViewName: 'ZUH_FG_ODAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung ODATA'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_UH_ASSO_FG_ODATA as select from Z_I_Fluggesellschaft
{
  key CarrierID,
  CarrierName,
  CurrencyCode,
  CarrierUrl
}
