@AbapCatalog.sqlViewName: 'Z_AW_VW_BUT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Businesspartner'
define view ZOB_CDS_AW_BU_PARTNER
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_spras : spras,
    @Environment.systemField: #SYSTEM_DATE
    p_date  : abap.dats

  as select from    but050
    left outer join but000 as Part1 on but050.partner1 = Part1.partner
    left outer join but000 as Part2 on but050.partner2 = Part2.partner
    inner join      tbz9a           on  but050.reltyp = tbz9a.reltyp
                                    and tbz9a.spras   = $parameters.p_spras

{
  key but050.relnr     as Relnr,
  key but050.partner1  as Partner1,
  key but050.partner2  as Partner2,
      but050.reltyp    as RelationTypeId,
      but050.date_from as Von_Datum,
      but050.date_to   as Bis_Datum,
      tbz9a.bez50      as Bezeichnung,
      tbz9a.bez50_2    as Bezeichnung_2,
      Part1.name_org1  as NameOrg1,
      Part1.name_org2  as NameOrg2,
      Part1.name_last  as NameLast,
      Part1.name_first as NameFirst,
      Part2.name_org1  as NameOrg1_2,
      Part2.name_org2  as NameOrg2_2,
      Part2.name_last  as NameLast_2,
      Part2.name_first as NameFirst_2
}
where
      but050.date_from <= $parameters.p_date
  and but050.date_to   >= $parameters.p_date


/* Erstellen Sie eine CDS View. Diese View soll aus der Tabelle Geschäftspartnerbeziehungen (BUT050) die Id
sowie Namensinformationen (jeweils BUT000) der beiden Geschäftspartner ausgeben.
Der Type der Beziehung soll als Text ausgegeben werden (TBZ9A) für die Sprache deutsch (DE).
*/
