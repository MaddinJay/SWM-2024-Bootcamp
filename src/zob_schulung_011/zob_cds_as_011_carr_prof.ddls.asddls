@AbapCatalog.sqlViewName: 'ZOB_VW_AS_CRPRF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Carr Prof'
define view ZOB_CDS_AS_011_CARR_PROF
  with parameters
    p_date1 : s_date,
    p_date2 : s_date
  as select from sflight
{
  key carrid             as Carrid,
  key connid             as Connid,
  key fldate             as Fldate,
      price              as Price,
      currency           as Currency,
      planetype          as Planetype,
      seatsocc           as Seatsocc,
      paymentsum         as Paymentsum,
      seatsocc_b         as SeatsoccB,
      seatsocc_f         as SeatsoccF,
      
      price * seatsocc_b as umsatz_b,
      price * seatsmax_f as umsatz_f
//      case
//      when $parameters.p_date1 > '20230101' and $parameters.p_date2 < '20231231' then price * seatsocc
//      end as umsatz
} 
