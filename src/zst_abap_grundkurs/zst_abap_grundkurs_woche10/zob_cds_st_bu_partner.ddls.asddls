@AbapCatalog.sqlViewName: 'ZOB_VW_ST_BU'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung 2'
define view ZOB_CDS_ST_BU_PARTNER
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang : spras,
    @Environment.systemField: #SYSTEM_DATE
    p_date : s_date
  as select from    but050
    left outer join but000 as but1 on but050.partner1 = but1.partner
    left outer join but000 as but2 on but050.partner2 = but2.partner
    left outer join tbz9a          on but050.reltyp = tbz9a.reltyp


{
  key but050.relnr     as Relnr,
  key but050.partner1  as Partner1,
  key but050.partner2  as Partner2,
      but050.date_from as Datum,
      but1.bu_sort1    as GP1_1,
      but1.bu_sort2    as GP1_2,
      but2.bu_sort1    as GP2_1,
      but2.bu_sort2    as GP2_2,
      tbz9a.reltyp     as Beziehung,
      tbz9a.spras      as Sprache

}
where
      tbz9a.spras      = $parameters.p_lang
  and but050.date_from = $parameters.p_date
