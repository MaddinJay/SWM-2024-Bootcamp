@AbapCatalog.sqlViewName: 'ZOB_VW_CONTACTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Geschäftspartner'
define view ZOB_CDS_OD_BU_PARTNER
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang : spras,
    p_dats : bu_datfrom

  as select from but050
    inner join   but000 as Join1 on but050.partner1 = Join1.partner //Join1 = BUT050 = BUT000 über Partner1
    inner join   but000 as Join2 on but050.partner2 = Join2.partner //Join2 = BUT050 = BUT000 über Partner2
    inner join   tbz9a  as Join3 on  but050.reltyp = Join3.reltyp //Join3 = Join2 = TBZ9A über reltyp
                                 and Join3.spras   = $parameters.p_lang
{

  key but050.partner1  as Partner1,

      Join1.name_org1  as NameOrg1,
      Join1.name_org2  as NameOrg2,
      Join1.name_org3  as NameOrg3,
      Join1.name_org4  as NameOrg4,
      Join3.reltyp     as Beziehungstyp,
      Join3.bez50      as Text1,
      Join3.bez50_2    as Text2,
      but050.date_from as datumAb,
      but050.date_to   as datumBis

}
where
      but050.date_from <= $parameters.p_dats
  and but050.date_to   >= $parameters.p_dats


//Passen Sie den Report zur Ausgabe der CDS View an. Untersuchen Sie, ob ein Anpassung erforderlich ist. Verwenden Sie Eingabeparameter im Report zur Übergabe der Parameter an die CDS View.
