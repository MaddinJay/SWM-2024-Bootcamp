@AbapCatalog.sqlViewName: 'ZOB_UH_PARTNER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung Extra Geschäftspartnerbeziehung'
define view ZOB_CDS_UH_BU_PARTNER
with parameters
p_langu : spras @<Environment.systemField: #SYSTEM_LANGUAGE, // Vorbelegung
p_date : bu_datfrom @<Environment.systemField: #SYSTEM_DATE  // Vorbelegung


  as select from    but050
    inner join but000 as bp1         on but050.partner1 = bp1.partner
    inner join but000 as bp2 on but050.partner2 = bp2.partner
    inner join tbz9a as relationtype on but050.reltyp = relationtype.reltyp and relationtype.spras = $parameters.p_langu
{
  key bp1.partner  as ID1,
  key but050.partner2 as ID2,
  key but050.relnr,
  but050.reltyp as Relationstyp,
  bp1.name_org1 as Name1,
  bp2.name_org1 as Name2,
  bp1.name_last as Name3,
  bp2.name_last as Name4,
  but050.date_from as vonDatum,
  but050.date_to as bisDatum,
  relationtype.spras as Sprache,
  relationtype.bez50 as Text,
  $parameters.p_date as Datum
}
where but050.date_from <= $parameters.p_date and but050.date_to >= $parameters.p_date
