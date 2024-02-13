@AbapCatalog.sqlViewName: 'ZOB_VW_ST_ASOD4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziation Book'
define view ZOB_CDS_ST_Asso_Book as select from sbook
association [1] to I_Currency as _Currency
on sbook.loccurkey = _Currency.Currency

{
key carrid as Carrid,
key connid as Connid,
key fldate as Fldate,
key bookid as Bookid,
customid as Customid,
custtype as Custtype,
smoker as Smoker,
luggweight as Luggweight,
wunit as Wunit,
invoice as Invoice,
class as Class,
forcuram as Forcuram,
forcurkey as Forcurkey,
loccuram as Loccuram,
loccurkey as Loccurkey,
order_date as OrderDate,
counter as Counter,
agencynum as Agencynum,
cancelled as Cancelled,
reserved as Reserved,
passname as Passname,
passform as Passform,
passbirth as Passbirth,  
_Currency
}
