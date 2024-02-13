@AbapCatalog.sqlViewName: 'ZLV_VW_CONCAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'concatinate funktionen'
define view ZOB_LV_CONCATINATE
with parameters
p_name : s_agncynam,
@Environment.systemField: #SYSTEM_DATE
p_date : s_date

as select from sbook
  inner join  stravelag on sbook.agencynum = stravelag.agencynum
{key sbook.carrid as Carrid,
 key sbook.connid as Connid,
 key sbook.fldate as Fldate,
 key sbook.bookid as Bookid,
 key stravelag.agencynum as Agencynum,
 substring (sbook.fldate, 5, 2 ) as FlMonat, // extrahiert die bestimmte Anzahl an Stellen --> die ersten vier stellen von links nach rechts
// sbook.customid as Customid,
// sbook.custtype as Custtype,
// sbook.smoker as Smoker,
// sbook.luggweight as Luggweight,
// sbook.wunit as Wunit,
// sbook.invoice as Invoice,
// sbook.class as Class,
// sbook.forcuram as Forcuram,
// sbook.forcurkey as Forcurkey,
// sbook.loccuram as Loccuram,
// sbook.loccurkey as Loccurkey,
// sbook.order_date as OrderDate,
// sbook.counter as Counter,
// sbook.cancelled as Cancelled,
// sbook.reserved as Reserved,
 sbook.passname as Passname,
 length (sbook.passname) as LaengePassname, // zählt die länge des passnamens/ der anzahl der Leichen
// sbook.passform as Passform,
// sbook.passbirth as Passbirth,
 stravelag.name as Name,
 replace (stravelag.name, 'g', 'K') as newName, // ersetzt den namen der agentur, wegen unfirmierung
// stravelag.street as Street,
// stravelag.postbox as Postbox,
// stravelag.postcode as Postcode,
// stravelag.city as City,
// stravelag.country as Country,
// stravelag.region as Region,
// stravelag.telephone as Telephone,
// stravelag.url as Url,
// stravelag.langu as Langu,
// stravelag.currency as Currency,

concat(stravelag.street,
        concat_with_space(',',
                              concat_with_space(stravelag.postcode,
                                concat(stravelag.city,
                                  concat_with_space(',', stravelag.country, 1)
                                )
                              ,1)
                           , 1))      as Adress
 
} // Zusammenfügung von Zeichenketten. bzw Verkettung von verschiedenen Spalten zu EINEM

where
  stravelag.name = $parameters.p_name
and sbook.fldate >= $parameters.p_date
