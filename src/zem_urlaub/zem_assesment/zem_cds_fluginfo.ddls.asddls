@AbapCatalog.sqlViewName: 'ZEM_SQL_FLUGINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluginformationen'
define view ZEM_CDS_Fluginfo as select from sflight
{
 key carrid as Carrid,
 key connid as Connid,
 key fldate as Fldate,
 cast( price as abap.fltp ) as Price,
 currency as Currency,
 planetype as Planetype,
 
 

 
case 
when currency = 'USD' then cast(price as abap.fltp) * 0.85
when currency = 'EUR' then cast(price as abap.fltp) * 1.00

end as Preis_EUR,

case 
when currency = 'USD' then cast( 0.85 as abap.fltp)
when currency = 'EUR' then cast( 1.0 as abap.fltp )

end as Wechselkurs










}
