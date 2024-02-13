@AbapCatalog.sqlViewName: 'ZEM_CDS_DATE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Daten Funktionen'



define view ZEM_CDS_Datefunktionen with parameters p_test : dats 
as select from sbook

{
 

  key carrid as Carrid,
  key connid as Connid,
  key bookid as Bookid,  
  key fldate as Fldate,  
  order_date as OrderDate,
  
  dats_days_between( order_date, fldate ) as Tage,            //Rechnet die Tage zwischen 2 Datums aus.
  
  dats_is_valid(fldate) as Check1,                             //prüft ob die Form des Datums korrekt ist.
  dats_is_valid($parameters.p_test) as Check2,                             //prüft ob die Form des Datums korrekt ist.
  dats_add_days( order_date, 30, 'FAIL' ) as  Addday,         //Rechnet eine vorgegegben Anzahl von Tagen auf eine Datum
  
  dats_add_months( order_date, 3, 'INITIAL' ) as Addmonat,    //Rechnet eine vorgegebene Anzahl von Monaten auf ein Datum
  
  //  FAIL = macht gar nichts????
  //  INITIAL = Initialwert
  //  Unchanged = ungeändert.. alter Wert
  
  '30' as ADDTage,
  '3' as ADDMonth
  
  
  
  
}
