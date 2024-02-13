@AbapCatalog.sqlViewName: 'ZCDS_EA_PARTNER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PARTNER'
define view ZOB_CDS_EA_BU_PARTNER
with parameters 
        p_sprach: sylangu, 
        p_dat: abap.dats


  as select from    but050
    left outer join but000 as Partner1 on Partner1.partner = but050.partner1
    left outer join but000 as Partner2 on Partner2.partner = but050.partner2
    
    


{
  key but050.relnr      as GP_BzhNr,
  key but050.partner1   as Partner1,
  key but050.partner2   as Partner2,
  key Partner1.partner  as Geschaeftspartner,
      Partner1.mc_name1 as Nachname,
      Partner2.mc_name2 as Vorname,
      Partner1.prefix1,
      Partner1.perno    as Personalnr,
      Partner2.prefix2
}

where but050.date_to = $parameters. p_dat
