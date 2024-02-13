@AbapCatalog.sqlViewName: 'ZOB_VW_OD_FLGH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flüge'
define view ZOB_CDS_OD_FLIGHT
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang : spras
  as select from sflight
    inner join   I_Currency     on I_Currency.Currency = sflight.currency
    inner join   I_CurrencyText on  I_CurrencyText.Currency = I_CurrencyText.Currency
                                and I_CurrencyText.Language = $parameters.p_lang
{
  key sflight.carrid   as carrid,
  key sflight.connid   as connid,
  key sflight.fldate   as Flugdatum,
  key I_Currency.Currency,
  key sflight.currency as Waehrung,
      I_Currency.Decimals,
      I_Currency.CurrencyISOCode,
      I_Currency.AlternativeCurrencyKey,
      I_CurrencyText.CurrencyName,
      /* Associations */
      I_Currency._Text
}
