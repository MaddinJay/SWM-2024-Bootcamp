@AbapCatalog.sqlViewName: 'ZOB_AW_VW_FUNK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Funktionen'
define view ZOB_AW_CDS_FLIGHT_INFO
  as select from sflight
{
  key carrid    as Carrid,
  key connid    as Verbindungsnummer,
  key fldate    as Flugdatum,
      price     as Preis,
      currency  as Waehrung,
      @Semantics.amount.currencyCode: 'Waehrung'
      case currency
      when 'EUR' then price
      else price * division(85, 100, 2)  // -> 85 geteilt durch 100 
      end       as Preis_EUR,
      planetype as Flugzeugtyp
}

//Erstellen Sie einen CDS View. Dieser View sollte auf der Tabelle SFLIGHT basieren und folgende Spalten 
//enthalten:
//- Carrier ID,
//- Verbindungsnummer,
//- Preis,
//- Währung,
//- Flugzeugtyp
//- eine berechnete Spalte Preis_EUR.
//Sie soll den Preis in Euro darstellen. Nehmen Sie an, dass alle Preise, die nicht bereits in Euro sind, in US-Dollar 
//angegeben sind und dass der aktuelle Wechselkurs 1 USD = 0,85 EUR ist. Nutzen Sie hierfür eine geeignete Fallunterscheidung (CASE)
