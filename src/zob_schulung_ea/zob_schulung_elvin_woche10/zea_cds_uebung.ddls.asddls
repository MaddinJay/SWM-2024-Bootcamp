@AbapCatalog.sqlViewName: 'ZEA_CDS_UEBUNG01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS UEBUNG'
define view ZEA_CDS_UEBUNG as select from sbook inner join stravelag on stravelag.agencynum = sbook.agencynum

{

  key sbook.carrid as Carrid,
  key sbook.connid as Connid,
  key sbook.fldate as Fldate,
  key sbook.bookid as Bookid,
  key stravelag.agencynum as Agencynum,
  sbook.customid as Customid,
  sbook.custtype as Custtype,
  sbook.smoker as Smoker,
  stravelag.langu as Langu,
  stravelag.currency as Currency 
}

where stravelag.name = 'Kangeroos'
