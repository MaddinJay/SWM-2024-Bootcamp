@AbapCatalog.sqlViewName: 'Z_TW_VW_BUT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Butt Partner'
define view ZOB_CDS_TW_BU_Partner as select from but050
left outer join but000 on but050.partner1 = but000.partner 
left outer join but000 as But00 on but050.partner2 = but000.partner
{
  key but050.partner1 as Partner1,
  key but050.partner2 as Partner2,
  key but000.partner as Partner,
  but000.name_org1 as NameOrg1,
  but000.name_org2 as NameOrg2,
  but000.name_org3 as NameOrg3,
  but000.name_org4 as NameOrg4,
  but000.name_last as NameLast,
  but000.name_first as NameFirst,
  
  But00.name_org1 as NameOrg1_00,
  But00.name_org2 as NameOrg2_00,
  But00.name_org3 as NameOrg3_00,
  But00.name_org4 as NameOrg4_00,
  But00.name_last as NameLast_00,
  But00.name_first as NameFirst_00
}
