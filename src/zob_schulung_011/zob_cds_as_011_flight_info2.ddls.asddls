@AbapCatalog.sqlViewName: 'ZOB_VW_AS_FINFO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Fluginfo2'
define view ZOB_CDS_AS_011_FLIGHT_INFO2
  as select from ZOB_CDS_AS_011_FLIGHT_INFO
{
  key Carrid,
  key Connid,
      price,
      Currency,
      Planetype,
      neueWaehrung,

      case
          when neueWaehrung < 500 then 'Low Cost'
          when neueWaehrung >= 500 and price <= 1000 then 'Medium Cost'
          when neueWaehrung > 1000 then 'High Cost'
          else ''
          end as Flight_category
}
