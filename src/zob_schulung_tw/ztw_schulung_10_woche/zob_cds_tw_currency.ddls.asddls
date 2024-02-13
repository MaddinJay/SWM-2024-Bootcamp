@AbapCatalog.sqlViewName: 'Z_TW_CURR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Currency'
define view ZOB_CDS_TW_Currency
with parameters
@Environment.systemField: #SYSTEM_LANGUAGE
  p_lang : spras
as select from sflight
left outer join I_Currency
  on sflight.currency = I_Currency.Currency
inner join I_CurrencyText on
  I_CurrencyText.Currency = I_Currency.Currency
  and I_CurrencyText.Language = $parameters.p_lang
{
  key sflight.carrid as Carrid,
  key sflight.connid as Connid,
  key sflight.fldate as Fldate,
  key I_Currency.Currency,
  sflight.price as Price,
  I_Currency.CurrencyISOCode,
  I_CurrencyText.CurrencyName
}
