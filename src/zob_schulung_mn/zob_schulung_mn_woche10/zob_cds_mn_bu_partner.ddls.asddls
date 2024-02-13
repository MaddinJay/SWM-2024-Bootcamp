@AbapCatalog.sqlViewName: 'ZOB_VW_MN_BUP01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Geschäftspartnerbeziehungen'
define view ZOB_CDS_MN_BU_PARTNER

with parameters p_langu : spras @<Environment.systemField: #SYSTEM_LANGUAGE,
  p_date : bu_datfrom

  as select from    but050

    left outer join but000 as bp1 //Alias ist wichtig, da BUT000 zweimal verwendet wird
                                           on but050.partner1 = bp1.partner

    left outer join but000 as bp2          on but050.partner2 = bp2.partner

    inner join      tbz9a  as relationtype on  but050.reltyp      = relationtype.reltyp
                                           and relationtype.spras = $parameters.p_langu

{
  key but050.relnr       as Relnr,
  key but050.partner1    as Partner1,
  key but050.partner2    as Partner2,
  key but050.date_to     as DateTo,
      but050.reltyp      as RelationTypeId,

      bp1.name_org1      as P1NameOrg1,
      bp1.name_last      as P1NameLast,
      bp2.name_org1      as P2NameOrg1,
      bp2.name_last      as P2NameLast,

      relationtype.bez50 as RelationText
}
where but050.date_from <= $parameters.p_date
  and but050.date_to >= $parameters.p_date
