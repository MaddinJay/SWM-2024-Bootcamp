@AbapCatalog.sqlViewName: 'Z_AW_VW_CURR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Währung'
define view ZOB_AW_CDS_CURRENCY
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang : spras
  as select from    sflight
    left outer join I_Currency     on sflight.currency = I_Currency.Currency
    inner join      I_CurrencyText on  I_CurrencyText.Currency = I_Currency.Currency
                                   and I_CurrencyText.Language = $parameters.p_lang
{
  key sflight.connid             as Connid,
  key sflight.fldate             as Fldate,
      sflight.price              as Price,
      sflight.currency           as Currency,
      I_Currency.CurrencyISOCode as ISOCode,
      I_CurrencyText.CurrencyName
}
