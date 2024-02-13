@AbapCatalog.sqlViewName: 'ZEM_VIEW_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View1 für CDS Spiel'
define view ZEM_CDS_VIEW1_Spiel as select from zem_fixpreis

{

avg( centkwh as abap.dec(31,3))  as durchschnitt,
preisid

}
group by preisid








