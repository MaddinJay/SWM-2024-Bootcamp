@AbapCatalog.sqlViewName: 'ZFD_VW_BU_PART'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra: Geschäftspartnerbeziehung'
define view ZFD_CDS_BU_PARTNER 

with parameters
@Environment.systemField: #SYSTEM_LANGUAGE
p_lang : spras,
p_date : dats // es ginge auch bu_datto oder budatfrom aber es muss eigentlich nur ein Datum eingegeben werden.

as select from but050

left outer join but000 as bp1 on but050.partner1 = bp1.partner  // Alias ist wichtig, da But000 zweimal verwendet wird
left outer join but000 as bp2 on but050.partner2 = bp2.partner

inner join tbz9a as relationtype on but050.reltyp = relationtype.reltyp 
                                 and relationtype.spras = $parameters.p_lang

/*
Kommentar
*/

{ // ERstellen der Fields mit STRG + Leertaste und dann die nicht benötigten rauslöschen.
  key but050.relnr as relnr,
  key but050.partner1 as partner1,
  key but050.partner2 as partner2,
  key but050.date_from as DateFrom,
  key but050.date_to as DateTo,
  
  bp1.name_org1 as P1name_org1 ,
  bp1.name_last as P1name_last ,
  bp2.name_org1 as P2name_org,
  bp2.name_last as P2name_last,

  relationtype.bez50 as RelationText
  
}
where but050.date_from <= $parameters.p_date and but050.date_to >= $parameters.p_date
/* 
 zur Where Bedingung: Wir geben nur ein Datum über Parameters mit.
 Daher benötigen wir 2 Where Bedingunge:
 einmal Vergleichen wir p_date mit date_from und einmal mit date_to
 Die Ergebnismenge dazwischen ist der Berech den wir haben wollen.
*/
