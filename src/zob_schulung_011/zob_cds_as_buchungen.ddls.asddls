@AbapCatalog.sqlViewName: 'ZOB_VW_AS_KAN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View - Reisebüro'
define view ZOB_CDS_AS_BUCHUNGEN
  with parameters
    p_name : s_agncynam,
    @Environment.systemField: #SYSTEM_DATE
    p_date : s_date
  as select from    sbook
    left outer join stravelag on sbook.agencynum = stravelag.agencynum
{

  key sbook.carrid        as Carrid,
  key sbook.connid        as Connid,
  key sbook.fldate        as Fldate,
  key sbook.bookid        as Bookid,
  key stravelag.agencynum as Agencynum,
  key stravelag.name      as Name
}
where
      stravelag.name = $parameters.p_name
  and sbook.fldate   >= $parameters.p_date
