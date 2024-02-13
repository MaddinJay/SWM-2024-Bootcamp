@AbapCatalog.sqlViewName: 'ZFD_VW_AS_FG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumption View Odata Fluggesellschaft'
@VDM.viewType: #CONSUMPTION
define view ZFD_CDS_Asso_FG_ODATA as select from Z_I_Fluggesellschaft
{
  key CarrierID,
  CarrierName,
  CurrencyCode,
  CarrierUrl
}
