@AbapCatalog.sqlViewName: 'Z_I_SCARR_BC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic-Interface-View der Tabelle SCARR'
@VDM.viewType: #BASIC
define view Z_I_Fluggesellschaft
  as select from scarr
{
  key carrid   as CarrierID,
      carrname as CarrierName,
      currcode as CurrencyCode,
      url      as CarrierUrl
}
