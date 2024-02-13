@AbapCatalog.sqlViewName: 'ZOB_VW_ODASO02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluggeselschaft'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_OD_ASSO_FG_ODATA as select from Z_I_Fluggesellschaft
{
  
key CarrierID,
CarrierName,
CurrencyCode,
CarrierUrl
}
