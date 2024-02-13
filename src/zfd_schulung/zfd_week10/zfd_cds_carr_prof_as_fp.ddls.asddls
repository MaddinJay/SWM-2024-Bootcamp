@AbapCatalog.sqlViewName: 'ZFD_VW_CARR_FP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Composite View Flugplan'
@VDM.viewType: #COMPOSITE
define view ZFD_CDS_CARR_PROF_AS_FP
  as select from Z_I_Flugplan


{
  key CarrierID,
  key ConnectionID,
      Distance,
      DistanceUnit,

      case DistanceUnit
      when 'KM' then cast(round(Distance, 0) as abap.dec(15,0))
      else cast(round(Distance, 0) as abap.dec(15,0)) * division(161,100,2)
      end         as Distance_KM,

      'Kilometer' as DistanceUnitKM

}
