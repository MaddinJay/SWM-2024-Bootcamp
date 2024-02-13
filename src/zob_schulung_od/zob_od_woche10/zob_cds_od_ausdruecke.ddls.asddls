@AbapCatalog.sqlViewName: 'ZOB_VW_OD_AUSD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View mit Ausdrücke'
define view ZOB_CDS_OD_AUSDRUECKE as select from sbook
{
  key connid as connid, 
  key carrid as carrid, 
  key fldate as fldate, 
  key bookid as bookid,
  case class
  when 'F' then 'First'
  when 'Y' then 'Economy'
  when 'C' then 'Businesss'
  else 'n/a'
  end as Flugklassen,
  case
  when class = 'F' then ' '
  when class = 'KG' and luggweight > 20 then 'X'
  when class = 'LB' and luggweight > 44 then 'X'
  else ' '
  end as ExcessLuggage,
  case class
  when 'F' then ' '
  else case
  when (wunit = 'KG' and luggweight > 20)
      or(wunit = 'LB' and luggweight > 44) then 'X'
   else ' '
   end
   end as ExcessLuggage2
}
where carrid = 'AA'
