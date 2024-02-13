@AbapCatalog.sqlViewName: 'ZFD_VW_FL_INFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung 2'
define view ZFD_CDS_FLIGHT_INFO
  as select from sflight
{
  key carrid    as Carrid,
  key connid    as Connid,
  key fldate    as Fldate,
      price     as Price,
      currency  as Currency,
      planetype as Planetype,

      @Semantics.amount.currencyCode: 'currency'

      case currency
        when 'EUR' then price
        else round(price * division(85, 100, 2),2)
      end       as Preis_EUR


}
