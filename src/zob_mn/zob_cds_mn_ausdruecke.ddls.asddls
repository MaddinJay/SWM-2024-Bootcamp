@AbapCatalog.sqlViewName: 'ZOB_VW_MN_AUSDR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ausdrücke'
define view ZOB_CDS_MN_AUSDRUECKE as select from sbook
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  key bookid as Bookid,
  case class
    when 'F' then 'First'
    when 'Y' then 'Economy'
    when 'C' then 'Business'
    else 'n/a'
  end as ClassText,
  case
    when class = 'F' then ' '
    when wunit = 'KG' and luggweight > 20 then 'X'
    when wunit = 'LB' and luggweight > 44 then 'X'
    else ' '
  end as ExcessLuggage,
  case class
    when 'F' then ' '
    else case
      when ( wunit = 'KG' and luggweight > 20)
        or ( wunit = 'LB' and luggweight > 44) then 'X'
      else ' '
    end
  end as ExcessLuggage2
}
