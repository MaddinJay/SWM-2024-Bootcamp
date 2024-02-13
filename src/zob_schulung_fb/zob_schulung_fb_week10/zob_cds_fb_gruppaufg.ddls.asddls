@AbapCatalog.sqlViewName: 'ZOB_CDS_FB_FUNKT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEWS - Übung Funktionen'
define view ZOB_CDS_FB_GRUPPAUFG
  as select from sbook
{
  key carrid                                      as Carrid,
  key connid                                      as Connid,
  key fldate                                      as Fldate,
  key bookid                                      as Bookid,
      order_date                                  as OrderDate,
      

  dats_is_valid( fldate )                     as Check1,   //prüft, ob die Form des Datum korrekt ist.
  dats_days_between( order_date, fldate )     as Tage,    // Rechnet die Tage zwischen 2 Daten aus
  dats_add_days( order_date, 30, 'FAIL' )     as Adday,  //  Rechnet eine vorgegebene Anzahl von Tagen auf ein Datum 
  dats_add_months( order_date, 3, 'INITIAL' ) as Month1 //   Rechnet eine vorgegebene Anzahl von Monaten auf ein Datum
}
