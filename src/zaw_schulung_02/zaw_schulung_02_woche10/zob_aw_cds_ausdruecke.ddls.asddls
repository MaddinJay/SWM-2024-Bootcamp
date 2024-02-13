@AbapCatalog.sqlViewName: 'ZAW_VW_AUSD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Ausdrücke'
define view ZOB_AW_CDS_AUSDRUECKE
  as select from sbook
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Flugdatum,
  key bookid as Buchung,
      case custtype
      when 'B' then 'Geschäftskunde'
      when 'P' then 'Privatkunde'
      else 'n/a'
      end    as Kundenart,    // Es wird eine neue Spalte mit diesem Namen und den entsprechenden Einträgen angezeigt.
      case class
      when 'F' then 'First'
      when 'Y' then 'Economy'
      when 'C' then 'Business'
      else 'n/a'
      end    as Klasse,
      case
      when class = 'F' then ''
      when wunit = 'KG' and luggweight > 20 then 'X'
      when wunit = 'LB' and luggweight > 44 then 'X'
      else ''
      end    as Uebergepaeck
//      case class
//      when 'F' then ''
//      else case
//      when ( wunit = 'KG' and luggweight > 20 )
//      or ( wunit = 'LB' and luggweight > 44 ) then 'X'
//      else ''
//      end
//      end    as Uebergepaeck2
}


/*Erstellen Sie eine neue View mit dem Namen ZOB_CDS_$$_AUSDRUECKE und dem SQL View Namen ZOB_VW_$$_AUSD, die die Tabelle SBOOK liest,
den gesamten Schlüssel, einen Text anhand der Klasse CLASS (Y = Economy, F = First, C = Business), sowie ein X, falls das Gepäck mehr
als 20kg oder 44lb wiegt und der Kunde nicht erste Klasse fliegt (class F), zurückgibt.
*/
