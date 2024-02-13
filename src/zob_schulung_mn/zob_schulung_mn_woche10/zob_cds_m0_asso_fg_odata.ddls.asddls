@AbapCatalog.sqlViewName: 'ZOB_VW_M0_ASOD3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluggesellschaften OData'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_M0_ASSO_FG_ODATA as select from Z_I_Fluggesellschaft
{
  key CarrierID,
  CarrierName,
  CurrencyCode,
  CarrierUrl
}
