@AbapCatalog.sqlViewName: 'ZFB_VIEWS_BU_GP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEWS - Übung Extra GP-Beziehungen'
define view ZOB_FB_BU_PARTNER as select from but050
  left outer join but000 as BP01
    on but050.partner1 = BP01.partner
  left outer join but000 as BP02
    on but050.partner2 = BP02.partner
  inner join tbz9a as relationtype
    on but050.reltyp = relationtype.reltyp
    and relationtype.spras = 'D'
{

key but050.relnr as Relnr,
key but050.partner1 as Partner1,
key but050.partner2 as Partner2,
key but050.date_to as DateTo,
key but050.reltyp as RelationTypeID,

BP01.name_org1 as P1NameOrg1,
BP01.name_last as P1NameLast,
BP02.name_org1 as P2NameOrg1,
BP01.name_last as NameLast,

relationtype.bez50 as RelationText
}
