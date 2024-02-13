@AbapCatalog.sqlViewName: 'ZOB_VW_M0_AUSD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Verwendung von Azsdrücken'
define view ZOB_CDS_M0_AUSDRUECKE as select from sbook
{
  connid,
  carrid,
  fldate,
  bookid,
  case class
    when 'F' then 'First'
    when 'Y' then 'Economy'
    when 'C' then 'Business'
    else 'n/a'
  end as ClassText,
  luggweight,
  wunit,
  case 
    when class = 'F' then ' '
    when wunit = 'KG' and luggweight > 20 then 'X'
    when wunit = 'LB' and luggweight > 44 then 'X'
    else ' '
  end as ExcessLuggage
}
