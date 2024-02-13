@AbapCatalog.sqlViewName: 'Z_OB_CDS_HUM_001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Join 1'

define view ZOB_CDS_HUM_001
  with parameters
    p_name : s_agncynam,
    @Environment.systemField: #SYSTEM_DATE
    p_date: s_date
  as select from sbook

    inner join   stravelag on sbook.agencynum = stravelag.agencynum
{
  key sbook.carrid        as Carrid,
  key sbook.connid        as Connid,
  key sbook.fldate        as Fldate,
  key sbook.bookid        as Bookid,
  key stravelag.agencynum as Agencynum,
      sbook.customid      as Customid,
      sbook.custtype      as Custtype,
      sbook.smoker        as Smoker,
      sbook.luggweight    as Luggweight,
      sbook.wunit         as Wunit,
      sbook.invoice       as Invoice,
      sbook.class         as Class,
      sbook.forcuram      as Forcuram,
      sbook.forcurkey     as Forcurkey,
      sbook.loccuram      as Loccuram,
      sbook.loccurkey     as Loccurkey,
      sbook.order_date    as OrderDate,
      sbook.counter       as Counter,
      sbook.agencynum     as Agencynum1,
      sbook.cancelled     as Cancelled,
      sbook.reserved      as Reserved,
      sbook.passname      as Passname,
      sbook.passform      as Passform,
      sbook.passbirth     as Passbirth,
      stravelag.name      as Name,
      stravelag.street    as Street,
      stravelag.postbox   as Postbox,
      stravelag.postcode  as Postcode,
      stravelag.city      as City,
      stravelag.country   as Country,
      stravelag.region    as Region,
      stravelag.telephone as Telephone,
      stravelag.url       as Url,
      stravelag.langu     as Langu,
      stravelag.currency  as Currency
}
where
  stravelag.name = $parameters.p_name and sbook.fldate = $parameters.p_date
  
