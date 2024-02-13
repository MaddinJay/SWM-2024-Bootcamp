@AbapCatalog.sqlViewName: 'ZOB_VW_MB_FLGH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung View on View'
define view ZOB_CDS_MB_FLIGHT 
with parameters
@Environment.systemField: #SYSTEM_LANGUAGE

p_lang : spras
as select from sflight

left outer join I_Currency
on sflight.currency = I_Currency.Currency

inner join I_CurrencyText 
on I_CurrencyText.Currency = I_Currency.Currency
and I_CurrencyText.Language = $parameters.p_lang
{
  key sflight.carrid as Carrid,
  key sflight.connid as Connid,
  key sflight.fldate as Fldate,
  key I_Currency.Currency,
  sflight.price as Price,
 I_Currency.CurrencyISOCode as ISOCode,
 I_CurrencyText.CurrencyName
 
}
