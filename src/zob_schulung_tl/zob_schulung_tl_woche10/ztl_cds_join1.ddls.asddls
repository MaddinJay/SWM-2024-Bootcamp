@AbapCatalog.sqlViewName: 'ZTL_SQL_JOIN1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join1 Übung'
define view ZTL_CDS_JOIN1
with parameters p_name: s_agncynam
  as select from sbook
    inner join   stravelag on sbook.agencynum = stravelag.agencynum

{

key sbook.carrid as Carrid,
key sbook.connid as Connid,
key sbook.fldate as Fldate,
key sbook.bookid as Bookid,
key stravelag.agencynum as Agencynum,
//sbook
sbook.customid as Customid,
sbook.custtype as Custtype,
sbook.smoker as Smoker,
sbook.cancelled as Cancelled,
sbook.luggweight as Luggweight,
sbook.wunit as Wunit,
sbook.order_date as OrderDate,
//stravelag
stravelag.name as Name,
stravelag.street as Street,
stravelag.city as City,
stravelag.country as Country,
stravelag.langu as Language,
stravelag.currency as Currency,
stravelag.telephone as Telephone,

//Funktionen Übung:
concat(stravelag.street,
 concat_with_space(',',
 concat_with_space(stravelag.postcode,
 concat(stravelag.city,
 concat_with_space(',', stravelag.country, 1)
 )
 , 1 )
 , 1)) as Adress

  }
where
  stravelag.name = $parameters.p_name
