@AbapCatalog.sqlViewName: 'ZFD_VW_JOIN1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung JOIN'
define view ZFD_CDS_JOIN1 
with parameters 
  p_name: s_agncynam
//  p_date: syst_datum
//  @Environment.systemField: #SYSTEM_DATE
 
as select from sbook inner join stravelag on sbook.agencynum = stravelag.agencynum
{
key sbook.carrid as Carrid,
key sbook.connid as Connid,
key sbook.fldate as Fldate,
key sbook.bookid as Bookid,
key stravelag.agencynum as Agencynum,
sbook.customid as Customid,
sbook.custtype as Custtype,
sbook.smoker as Smoker,
sbook.luggweight as Luggweight,
sbook.wunit as Wunit,
sbook.invoice as Invoice,
sbook.class as Class,
sbook.forcuram as Forcuram,
sbook.forcurkey as Forcurkey,
sbook.loccuram as Loccuram,
sbook.loccurkey as Loccurkey,
sbook.order_date as OrderDate,
sbook.counter as Counter,
sbook.cancelled as Cancelled,
sbook.reserved as Reserved,
sbook.passname as Passname,
sbook.passform as Passform,
sbook.passbirth as Passbirth,
right(concat(stravelag.street, Concat(', ', concat( stravelag.city, concat(', ',stravelag.country)))),15) as Address,

stravelag.name as AgencyName,
stravelag.street as Street,
stravelag.postbox as Postbox,
stravelag.postcode as Postcode,
stravelag.city as City,
stravelag.country as Country,
stravelag.region as Region,
stravelag.telephone as Telephone,
stravelag.url as Url,
stravelag.langu as Langu,
stravelag.currency as Currency
}
where stravelag.name = $parameters.p_name // and sbook.fldate >= $parameters.p_date
