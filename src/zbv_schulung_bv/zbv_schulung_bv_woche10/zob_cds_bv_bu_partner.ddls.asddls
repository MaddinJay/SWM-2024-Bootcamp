@AbapCatalog.sqlViewName: 'ZOB_VW_BV_PAR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Partner'
define view ZOB_CDS_BV_BU_PARTNER 

with parameters
p_spras: sylangu,
p_datu: abap.dats


as select from but050

  left outer join but000 as Partner1          //Alias ist wichtig, da But000 zweimal verwendet wird
    on Partner1.partner = but050.partner1
  left outer join but000 as Partner2
    on Partner2.partner  = but050.partner2
    
   inner join tbz9a as relationtype 
    on but050.reltyp = relationtype.reltyp
    and relationtype.spras = $parameters.p_spras
    
    /*
    Kommentar
    */
{
  key but050.relnr as Relnr,
  key but050.partner1 as Partner1,
  key but050.partner2 as Partner2,
  key but050.date_to as DateTo,
  but050.reltyp as RelationTypeId,
  
Partner1.name_org1 as P1NameOrg1,
Partner1.name_last as P1NameLast,
Partner2.name_org1 as P2NameOrg1,
Partner2.name_last as P2NameLast,

relationtype.bez50 as RelationText
}
where but050.date_from <= $parameters.p_datu
 and but050.date_to >= $parameters.p_datu
