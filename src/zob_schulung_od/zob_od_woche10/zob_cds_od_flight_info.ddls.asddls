@AbapCatalog.sqlViewName: 'ZOB_VW_OD_FLINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluginformationen'
define view ZOB_CDS_OD_FLIGHT_INFO as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  price as Price,
  currency as Currency,
  planetype as Planetype,
  case 
  when currency = 'EUR' then price
       else cast(price as abap.fltp)  * cast(0.85 as abap.fltp)
  end 
  as Preis_Euro
}

//- eine berechnete Spalte Preis_EUR, Sie soll den Preis in Euro darstellen.
//Nehmen Sie an, dass alle Preise, die nicht bereits in Euro sind, in US-Dollar
//angegeben sind und dass der aktuelle Wechselkurs 1 USD = 0,85 EUR ist.
//Nutzen Sie hierfür eine geeignete Fallunterscheidung (CASE).
//- eine weitere berechnete Spalte namens Flight_Category hinzu. Diese Spalte
//soll basierend auf dem Preis die Flüge in verschiedene Kategorien einordnen:
//Flüge mit einem Preis unter 500 EUR sollen als "Low Cost" eingestuft werden.
//Flüge mit einem Preis zwischen 500 und 1000 EUR sollen als "Medium Cost"
//eingestuft werden.
//Flüge mit einem Preis über 1000 EUR sollen als "High Cost" eingestuft werden.
