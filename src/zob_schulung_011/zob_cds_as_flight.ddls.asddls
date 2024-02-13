@AbapCatalog.sqlViewName: 'ZOB_VW_AS_FLGH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View on View'
define view ZOB_CDS_AS_FLIGHT
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang : spras
  as select from sflight
    inner join   I_Currency     on I_Currency.Currency = sflight.currency
    inner join   I_CurrencyText on  I_CurrencyText.Currency = I_Currency.Currency
                                and I_CurrencyText.Language = $parameters.p_lang
{
  key sflight.carrid   as Carrid,
  key sflight.connid   as Connid,
  key sflight.fldate   as Fldate,
      sflight.price    as Price,
      sflight.currency as Currency,
      I_CurrencyText.CurrencyName

}
