@AbapCatalog.sqlViewName: 'ZOB_VW_AS_AUSD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Ausdrücke'
define view ZOB_CDS_AS_AUSDRUECKE
  as select from sbook
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  key bookid as Bookid,
  luggweight as luggweight,
  wunit as wunit,

      case class
      when 'F' then 'First'
      when 'Y' then 'Economy'
      when 'C' then 'Business'
      else 'Nein'
      end    as ClassText,
      case
      when class = 'F' then ' '
      when wunit = 'KG' and luggweight > 20 then 'X'
      when wunit = 'LB' and luggweight > 44 then 'X'
      else ' '
      end    as LuggageText,
      case class when 'F' then ' '
      else case
      when (  wunit = 'KG' and luggweight > 20  ) or (  wunit = 'LB' and luggweight > 44  ) then 'X'
      else ' '
      end
      end    as LuggageText2
}


//einen Text anhand der Klasse CLASS (Y = Economy, F = First, C = Business), sowie ein X, falls das Gepäck mehr als 20kg oder 44lb wiegt und der Kunde nicht erste Klasse fliegt (class F), zurückgibt.
