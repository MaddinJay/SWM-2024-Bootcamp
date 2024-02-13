@AbapCatalog.sqlViewName: 'ZTL_SQL_PARTNER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Aufgabe Geschäftspartnerbzh Tea'
//but050 ist Geschäftspartnerbzh Tabelle
define view ZTL_CDS_BU_PARTNER
  with parameters
    p_spras : abap.lang, //sprache Typ
    p_date  : abap.dats //datum Typ
  as select from    but050
    left outer join but000 as Partner1     on Partner1.partner = but050.partner1
    left outer join but000 as Partner2     on Partner2.partner = but050.partner2
  //Der Type der Beziehung soll als Text ausgegeben werden (TBZ9A) für die Sprache deutsch (D).
    inner join      tbz9a  as relationtype on  but050.reltyp      = relationtype.reltyp
                                           and relationtype.spras = $parameters.p_spras
{
  key but050.relnr       as GP_BzhNr,
  key but050.partner1    as Partner1,
  key but050.partner2    as Partner2,
  key but050.date_to     as DateTo,

      //Tabelle: BUT050
      but050.reltyp      as BzhTyp,
      //Tabelle: TBZ9A
      relationtype.spras as Sprache,
      relationtype.bez50 as RelationText,
      //Tabelle: BUT000
      Partner1.name_org1 as P1Vorname,
      Partner2.name_last as P1Nachname,
      Partner2.name_org1 as P2Vorname,
      Partner2.name_last as P2Nachname
}
where
  but050.date_from <= $parameters.p_date and but050.date_to >= $parameters.p_date
