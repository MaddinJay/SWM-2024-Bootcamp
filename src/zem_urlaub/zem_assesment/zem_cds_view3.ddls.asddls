@AbapCatalog.sqlViewName: 'ZEM_CDS_ASS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View on View'
define view Zem_Cds_ASS1
with parameters 
@Environment.systemField: #SYSTEM_LANGUAGE
p_lang : spras,

@Environment.systemField: #SYSTEM_DATE
p_heut : dats



as select 

from sflight
inner join  I_Currency on  I_Currency.Currency = sflight.currency

inner join  I_CurrencyText  on I_CurrencyText.Currency = I_Currency.Currency
and         I_CurrencyText.Language = $parameters.p_lang 

inner join  I_CurrencyText as B on B.Currency = I_Currency.Currency
and         B.Language = $session.system_language 

inner join  I_CurrencyText  as C on I_CurrencyText.Currency = C.Currency
and          C.Language = $session.system_language 
{

key sflight.carrid   as Carrid,
key sflight.connid   as Connid,
key sflight.fldate   as Fldate,

//dats_days_between($session.system_date, sflight.Fldate) as Verbleibend,

dats_days_between( sflight.fldate, $parameters.p_heut ) as uebrig,


sflight.price        as Price,
sflight.currency     as ISO,


I_CurrencyText.CurrencyShortName as Kurz,
I_CurrencyText.CurrencyName as Lang,
$parameters.p_lang    as Waehrungssprache,

B.CurrencyName as Haussprache_lang,
B.CurrencyShortName as Haussprache_kurz,


$session.system_date as Heutiges_Datum

}



where sflight.price > 1000 or sflight.currency <> 'EUR'





