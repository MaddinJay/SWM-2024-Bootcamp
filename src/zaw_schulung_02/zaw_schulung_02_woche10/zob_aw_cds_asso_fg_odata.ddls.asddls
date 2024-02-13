@AbapCatalog.sqlViewName: 'Z_AW_VW_ASSO_CO3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OData Flgz'
@VDM.viewType: #CONSUMPTION
define view ZOB_AW_CDS_ASSO_FG_ODATA
  as select from Z_I_Fluggesellschaft
    association [*] to I_Currency as _currency on $projection.CarrierID = Z_I_Fluggesellschaft.CarrierID

  
{
  key CarrierID,
      CarrierName,
      CurrencyCode,
      CarrierUrl,
      _currency
}
