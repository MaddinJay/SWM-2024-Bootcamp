@AbapCatalog.sqlViewName: 'ZOB_VW_AS_FINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Fluginfo'
define view ZOB_CDS_AS_011_FLIGHT_INFO
  as select from sflight
{
  key carrid    as Carrid,
  key connid    as Connid,
      price     as price,
      //      cast(price  as abap.fltp) as Price_Euro,
      currency  as Currency,
      planetype as Planetype,

      
      case currency
      when 'EUR' then price
      else cast(price as abap.fltp) * 0.85
      end       as neueWaehrung

      
      
      
      //end as ergebnis

}
