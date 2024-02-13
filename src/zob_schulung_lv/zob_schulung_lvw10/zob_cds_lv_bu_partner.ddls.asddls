@AbapCatalog.sqlViewName: 'ZOB_VW_BU_PART'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'partner test übung'
define view ZOB_CDS_LV_BU_PARTNER as select from but050
inner join but000 as Partner1 on but050.partner1 = Partner1.partner
inner join but000 as Partner2 on but050.partner2 = Partner2.partner
inner join tbz9a as relationtype on but050.reltyp = relationtype.reltyp
and relationtype.spras = 'D' //interne mapping nur 1 char statt DE

{
key but050.relnr as Relnr,
key but050.partner1 as Partner1,
key but050.partner2 as Partner2,
key but050.date_to as DateTo,
but050.reltyp as RelationTypeID,


Partner1.name_org1 as P1NameOrg1,
Partner1.name_last as P1NameLast,
Partner2.name_org1 as P2NameLorg1,
Partner2.name_last as P2NameLast,

relationtype.bez50 as RelationText
}
