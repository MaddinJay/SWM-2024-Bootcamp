@AbapCatalog.sqlViewName: 'Z_CDS_FB_FLYINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEWS - ExtraÜbung Fluginfos'
define view ZOB_CDS_FB_FLGHTINFO
  as select from sflight
{
  key carrid                          as Carrid,
  key connid                          as Connid,
      cast(price  as abap.fltp)       as Price_Euro,
      currency                        as Currency,
      planetype                       as Planetype,
      @Semantics.amount.currencyCode: 'currency'
      case currency when 'EUR' then price
      else price * division(85, 100, 2)
      end                             as Euro_price

}
