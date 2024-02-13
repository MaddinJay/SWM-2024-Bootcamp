@AbapCatalog.sqlViewName: 'ZFD_VW_FL_INFO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View auf View Info'
define view ZFD_CDS_FLIGHT_INFO2
  as select from ZFD_CDS_FLIGHT_INFO
{
  key Carrid    as Carrid,
  key Connid    as Connid,
  key Fldate    as Fldate,
      Price     as Price,
      Currency  as Currency,
      Planetype as Planetype,
      Preis_EUR as Preis_EUR,
      case
        when Preis_EUR < 500 then 'LOW COST'
        when Preis_EUR < 1000 then 'MED COST'
        when Preis_EUR > 1000 then 'HIGH COST'
        else 'N/A'
      end       as Flight_Category



}
