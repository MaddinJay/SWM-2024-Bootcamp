@AbapCatalog.sqlViewName: 'ZTL_SQL_FLINFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra Übung Fluginformationen Tea'

define view ZTL_CDS_FLIGHT_INFO
  //with parameters p_usd : abap.decfloat16
  as select from sflight
{
  key carrid    as Carrid,
  key connid    as Connid,
  key fldate    as FlDate,
      price     as Price,
      currency  as Currency,
      planetype as Planetype,

      //eine berechnete Spalte Preis_EUR, Sie soll den Preis in Euro darstellen.
      //Nehmen Sie an, dass alle Preise, die nicht bereits in Euro sind, in US-Dollar angegeben sind und dass der aktuelle Wechselkurs
      // 1 USD = 0,85 EUR ist.
      //Nutzen Sie hierfür eine geeignete Fallunterscheidung (CASE).

      //Variante 1 mit Parameter
      //      case
      //          when currency = 'USD' then (price * $parameters.p_usd)
      //          else price
      //      end       as Preis_EUR,

      //Variante 2 Wenn USD dann in EUR
//      case
//      whencurrency='USD'
//      thencast(priceasabap.fltp)*0.85
//      elseprice
//      endasPreis_EUR,

      //Variante 3 Alle Valuten werden in EUR umberechnet
      @Semantics.amount.currencyCode: 'currency'
      case
      when currency = 'EUR' then price
      else cast(price as abap.fltp) * 0.85
      end       as Preis_EUR,

      //eine weitere berechnete Spalte namens Flight_Category hinzu. Diese Spalte soll basierend auf dem Preis die Flüge in verschiedene Kategorien einordnen:
      //Flüge mit einem Preis unter 500 EUR sollen als "Low Cost" eingestuft werden.
      //Flüge mit einem Preis zwischen 500 und 1000 EUR sollen als "Medium Cost" eingestuft werden.
      //Flüge mit einem Preis über 1000 EUR sollen als "High Cost" eingestuft werden
      case
      when price < 500 then 'Low Cost'
      when price between 500 and 100 then 'Medium Cost'
      else 'High Cost'
      end       as Flight_Category

}
