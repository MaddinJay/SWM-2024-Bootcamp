@AbapCatalog.sqlViewName: 'ZOB_VW_AS_GRP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Gruppenarbeit'
define view
  //with parameters
  ZOB_CDS_AS_GRUPPENARBEIT
  as select from sflight
  
{
  key carrid                            as Carrid,
  key connid                            as Connid,
  key fldate                            as Fldate,
      price                             as Price,
      currency                          as Currency,
      planetype                         as Planetype,
      seatsmax                          as Seatsmax,
      seatsocc                          as Seatsocc,
//      paymentsum                        as Paymentsum,
//      seatsmax_b                        as SeatsmaxB,
//      seatsocc_b                        as SeatsoccB,
//      seatsmax_f                        as SeatsmaxF,
//      seatsocc_f                        as SeatsoccF,

      div(seatsmax , seatsocc)          as divZahl, //Seatsmax durch Seatsocc = gerundetes Ergebnis ==> Wie oft passt Seatsocc nochmal in Seatsmax rein? Economy
      mod(seatsmax , seatsocc)          as modZahl, //385 durch 32 --> 32 passt in 385, 12 mal rein. 12 x 32 = 384. 385-384 = 1 --> modZahl = 1
      division(seatsmax , seatsocc , 2) as divisionZahl //einfache Division mit Angabe der Nachkommastellen
//  cast
//     cast (seatsmax as abap.decfloat34[(34)]) as seatsmax1,
//     cast (seatsocc as abap.decfloat34[(34)]) as seatsocc1,

//      seatsmax / seatsocc               as slashZahl


//ZOB_AW_CDS_KANGEROOS

}


//  dats_days_between( order_date, fldate ) as Tage,            //Rechnet die Tage zwischen 2 Datums aus.
//  
//  dats_is_valid(fldate) as Check1,                             //prüft ob die Form des Datums korrekt ist.
//  dats_add_days( order_date, 30, 'FAIL' ) as  Addday,         //Rechnet eine vorgegegben Anzahl von Tagen auf eine Datum
//  
//  dats_add_months( order_date, 3, 'INITIAL' ) as Addmonat,    //Rechnet eine vorgegebene Anzahl von Monaten auf ein Datum


//  seatsmax as seatsmax, // wurde zum Vergleichen hinzugefügt
//  round(seatsmax,-2) as seatsmax_Round_1, //Mit '-1' auf die letzte Zahl gerundet
//  
//  price as Price, // wurde zum Vergleichen hinzugefügt
//  currency as currency, 
//  
//  cast(floor(price) as abap.dec(6,2) ) as price_floor, //'floor' ist abrunden
// 
//  cast(ceil(price) as abap.dec(6,2) ) as price_ceil, //'Ceil' ist aufrunden - 'Cast', um von curr 15,2 auf Dec 6,2
//  
//  abs(price - 1000) as Price_min //Absoluten Wert einer Zahl berechnen
//concat(stravelag.street,
//        concat_with_space(',',
//                              concat_with_space(stravelag.postcode,
//                                concat(stravelag.city,
//                                  concat_with_space(',', stravelag.country, 1)
//                                )
//                              ,1)
//                           , 1))      as Adress
