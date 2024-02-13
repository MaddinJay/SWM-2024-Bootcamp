@AbapCatalog.sqlViewName: 'ZFD_VW_CARR_FP2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Composite View Flugplan2'
@VDM.viewType: #COMPOSITE
define view ZFD_CDS_CARR_PROF_AS_FP2
  as select from ZFD_CDS_CARR_PROF_AS_FP
{
  key CarrierID,


      count(*) as FlightsCount,
      avg(Distance_KM) as AVG_Distance_KM


}
group by CarrierID
