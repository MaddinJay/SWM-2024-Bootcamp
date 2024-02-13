@AbapCatalog.sqlViewName: 'ZOB_VW_BV_FLGH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight CDS View'
define view ZOB_CDS_BV_FLIGHT 

with parameters

@Environment.systemField: #SYSTEM_LANGUAGE
p_lang: spras
as select from sflight
inner join I_Currency on I_Currency.Currency = sflight.currency
inner join I_CurrencyText on 
    I_CurrencyText.Currency = I_Currency.Currency
   and I_CurrencyText.Language = $parameters.p_lang
{
  key sflight.carrid as Carrid,
  key sflight.connid as Connid,
  key sflight.fldate as Fldate,
  sflight.price as Price,
  sflight.currency as Currency,
  I_Currency.CurrencyISOCode as ISOCode,
  I_CurrencyText.CurrencyName
}
