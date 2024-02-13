@AbapCatalog.sqlViewName: 'ZFG_ODATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FG_ODATA'
define view ZOB_CDS_EA_ASSO_FG_ODATA as select from Z_I_Fluggesellschaft
{
  key CarrierID,
  CarrierName,
  CurrencyCode,
  CarrierUrl
}
