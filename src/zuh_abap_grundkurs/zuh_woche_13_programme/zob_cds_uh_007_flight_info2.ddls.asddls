@AbapCatalog.sqlViewName: 'ZOB_VW_UH2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Extra Fluginformation'
define view ZOB_CDS_UH_007_FLIGHT_INFO2
  as select from ZOB_CDS_UH_007_FLIGHT_INFO
{
  key Carrid,
  key Connid,
  key fldate,
      Price,
      Currency,
      Planetype,
      priceEUR,
      case
      when priceEUR < 500 then 'Low Cost'
      when priceEUR >= 500 and Price <= 1000 then 'Medium Cost'
      when priceEUR > 1000 then 'High Cost'
      else 'Ohne kosten'
      end as Flight_Category
}
