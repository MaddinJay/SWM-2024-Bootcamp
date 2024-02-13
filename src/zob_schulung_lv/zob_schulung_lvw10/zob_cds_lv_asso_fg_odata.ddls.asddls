@AbapCatalog.sqlViewName: 'ZOB_VW_LV_ASOD3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'aölkdsjhgs'
define view ZOB_CDS_LV_Asso_fg_odata as select from Z_I_Fluggesellschaft
{
  key CarrierID,
  CarrierName,
  CurrencyCode,
  CarrierUrl
}
