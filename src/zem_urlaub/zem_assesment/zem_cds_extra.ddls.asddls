@AbapCatalog.sqlViewName: 'ZEM_CDS_EX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extra CDS'
define view zem_cds_extra 


//with parameters
//@Environment.systemField: #SYSTEM_DATE
//p_von : abap.dats,
//
//@Environment.systemField: #SYSTEM_DATE
//p_bis : abap.dats


as select from sflight


{
  
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  
price,
  
  currency as Currency,
  
//  @Semantics.amount.currencyCode: 'CurrencyEuro'
  seatsocc + seatsocc_b + seatsocc_f * ( price ) as Kosten  
  
}



