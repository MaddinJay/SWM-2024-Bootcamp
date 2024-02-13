@AbapCatalog.sqlViewName: 'ZOB_AW_VW_FUNK2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Weitere View'
define view ZOB_AW_CDS_FLIGHT_INFO2
  as select from ZOB_AW_CDS_FLIGHT_INFO
{
  key Carrid,
  key Verbindungsnummer,
  key Flugdatum,
      Preis,
      Waehrung,
      @Semantics.amount.currencyCode: 'Waehrung'
      Preis_EUR,
      Flugzeugtyp,
      case
           when Preis_EUR < 500 then 'Low Cost'
           when Preis_EUR between 500 and 1000 then 'Medium Cost'
           else 'High Cost'
           end as Flugkategorie
}

//Eine weitere berechnete Spalte namens Flight_Category hinzu. Diese Spalte soll basierend auf dem Preis die Flüge in verschiedene
//Kategorien einordnen:
//Flüge mit einem Preis unter 500 EUR sollen als "Low Cost"
//Flüge mit einem Preis zwischen 500 und 1000 EUR als "Medium Cost" 
//Flüge mit einem Preis über 1000 EUR als "High Cost"
