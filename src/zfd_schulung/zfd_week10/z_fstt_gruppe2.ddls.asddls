@AbapCatalog.sqlViewName: 'Z_VW_FSTT_GR2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Gruppe2'
define view Z_FSTT_Gruppe2 as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  
  seatsmax as seatsmax, // wurde zum Vergleichen hinzugefügt
  round(seatsmax,-2) as seatsmax_Round_1, //Mit '-1' auf die letzte Zahl gerundet
  
  price as Price, // wurde zum Vergleichen hinzugefügt
  currency as currency, 
  
  cast(floor(price) as abap.dec(6,2) ) as price_floor, //'floor' ist abrunden
 
  cast(ceil(price) as abap.dec(6,2) ) as price_ceil, //'Ceil' ist aufrunden - 'Cast', um von curr 15,2 auf Dec 6,2
  
  abs(price - 1000) as Price_min //Absoluten Wert einer Zahl berechnen

  
}
