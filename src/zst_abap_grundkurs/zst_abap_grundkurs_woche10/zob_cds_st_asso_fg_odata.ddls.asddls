@AbapCatalog.sqlViewName: 'ZOB_VW_ST_ASOD3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluggesellschaften'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_ST_Asso_FG_ODATA as select from Z_I_Fluggesellschaft
{
  key CarrierID,
  CarrierName,
  CurrencyCode,
  CarrierUrl
  }
