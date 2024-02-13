@AbapCatalog.sqlViewName: 'ZOB_VW_M0_FLGH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flüge mit Währung'
define view ZOB_CDS_M0_FLIGHT 
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
