@AbapCatalog.sqlViewName: 'ZEM_ASSO2_ODATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS auf ASSO ODATA'
@VDM.viewType: #CONSUMPTION
define view ZEM_CDS_ASSO2_ODATA
  as select from Z_I_Fluggesellschaft
    association [0..1] to I_Currency as _currency on Z_I_Fluggesellschaft.CurrencyCode = _currency.CurrencyISOCode
    and $projection.CurrencyCode = _currency.Currency
     
{
  key CarrierID,
      CarrierName,
      CurrencyCode,
      CarrierUrl,
      _currency
}

