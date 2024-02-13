*&---------------------------------------------------------------------*
*& Report zfd_extra_uebung2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_extra_uebung2.

*******************************
*EXTRA: Zahlen
*******************************
DATA lv_decimalzahl TYPE p DECIMALS 2 VALUE '15.55'.
DATA lv_integerzahl TYPE i VALUE 4.
DATA lv_summe TYPE p DECIMALS 2.
DATA lv_produkt TYPE p DECIMALS 4.
lv_summe = lv_decimalzahl + lv_integerzahl.
lv_produkt = lv_decimalzahl * lv_integerzahl.
WRITE: / lv_summe, ' ' , lv_produkt.

*******************************
*EXTRA: String Manipulation 1
*******************************
DATA  LV_string1 TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit.'.
*DO 6 TIMES.
*  REPLACE 'e' IN lv_string1 WITH '' .
*ENDDO.
REPLACE ALL OCCURRENCES OF 'e' IN lv_string1 WITH '' .
WRITE / lv_string1.

*******************************
*EXTRA: Systemwerte
*******************************
WRITE: / sy-sysid, sy-mandt.

*******************************
*EXTRA: Systemwerte 2
*******************************
WRITE: / 'Die aktuelle Uhrzeit ist ', sy-uzeit, ' Uhr'.

*******************************
*EXTRA: Kontrollstruktur
*******************************

DATA lv_zahl TYPE i VALUE 1.
WHILE lv_zahl <= 100.
  IF lv_zahl MOD 3 EQ 0.
    WRITE / lv_zahl.
  ENDIF.
  lv_zahl = lv_zahl + 1.
ENDWHILE.
*******************************
*EXTRA:  Typdeklaration
*******************************
TYPES: ty_integer_3 TYPE int1.

*******************************
* EXTRA Struktur
*******************************
TYPES: BEGIN OF lty_s_teilnehmer,
         id              TYPE ty_integer_3,
         vorname         TYPE string,
         ersterBuchstabe TYPE c LENGTH 1,
         alter           TYPE i,
         softskills      TYPE string,
       END OF lty_s_teilnehmer.

DATA ls_struktur TYPE lty_s_teilnehmer.
ls_struktur-id = 001.
ls_struktur-vorname = 'Frank'.
ls_struktur-ersterBuchstabe = 'D'.
ls_struktur-alter = 44.
ls_struktur-softskills = 'ich kann Lesen!'.

*oder


*******************************
* EXTRA Tabellen
*******************************
DATA lt_tabelle TYPE TABLE OF lty_s_teilnehmer.

APPEND ls_struktur TO lt_tabelle.
CLEAR ls_struktur.

APPEND VALUE #( id = 002 vorname = 'Maureen' ersterBuchstabe = 'B' alter = 37 softskills = 'gründen' ) TO lt_tabelle.
APPEND VALUE #( id = 003 vorname = 'Uli' ersterBuchstabe = 'HH' alter = 55 softskills = 'Pool' ) TO lt_tabelle.
APPEND VALUE #( id = 004 vorname = 'Tea' ersterBuchstabe = 'L' alter = 20 softskills = 'Führerschein' ) TO lt_tabelle.
APPEND VALUE #( id = 005 vorname = 'Thea' ersterBuchstabe = 'W' alter = 24 softskills = 'ALLES' ) TO lt_tabelle.

ls_struktur = VALUE #( id = 6 vorname = 'Heinz' ersterBuchstabe = 'B' alter = 60 softskills = '-').
APPEND ls_struktur TO lt_tabelle.
CLEAR ls_struktur.

*cl_demo_output=>display( lt_tabelle ).


*******************************
* EXTRA Tabelle 2
*******************************
*DATA: BEGIN OF ls_struktur2,
*        euro   TYPE p DECIMALS 2,
*        dollar TYPE p DECIMALS 2,
*              END OF ls_struktur2.
*
*Data lt_tabelle2 like TABLE OF ls_struktur2.
*
*ODER
*
TYPES: BEGIN OF lty_s_struktur2,
         euro   TYPE i,
         dollar TYPE p DECIMALS 2,
       END OF lty_s_struktur2.

TYPES: lty_t_tabelle2 TYPE TABLE OF lty_s_struktur2.

CONSTANTS lc_eurodollar TYPE p DECIMALS 2 VALUE '1.09'.

PARAMETERS p_umrech TYPE p DECIMALS 2 OBLIGATORY.

INITIALIZATION.
  p_umrech = lc_eurodollar.

  DATA lt_tabelle2 TYPE lty_t_tabelle2.
  DATA ls_struktur2 TYPE lty_s_struktur2.
  DATA lv_zahl2 TYPE i VALUE 1.

START-OF-SELECTION.

  DO 100 TIMES.
    ls_struktur2-euro = lv_zahl2.
    APPEND ls_struktur2 TO lt_tabelle2.
    lv_zahl2 = lv_zahl2 + 1.
  ENDDO.

*CONSTANTS lc_eurodollar TYPE p DECIMALS 2 VALUE '1.09'.
*cl_demo_output=>display( lt_tabelle2 ).

  LOOP AT lt_tabelle2 INTO ls_struktur2.
    ls_struktur2-dollar = ls_struktur2-euro * p_umrech.
    MODIFY lt_tabelle2 FROM ls_struktur2.
  ENDLOOP.

*  cl_demo_output=>display( lt_tabelle2 ).

*******************************
*EXTRA Literale, Konstanten
*******************************
*
*
*
*******************************
*EXTRA Einsetzen
*******************************
  ULINE.
  DATA lv_zahla TYPE i VALUE 33.
  DATA lv_zahlb TYPE i VALUE 66.
  DATA lv_zahlc TYPE i.

  lv_zahlc = lv_zahla + lv_zahlb.
  WRITE: 'Die Summe aus ', lv_zahla, ' und ', lv_zahlb,' ist ', lv_zahlc,'.'.

*******************************
*EXTRA Typdeklaration2
*******************************
  TYPES: BEGIN OF lty_s_sprache,
           sprachkuerzel TYPE c LENGTH 2,
           text          TYPE string,
         END OF lty_s_sprache.

  DATA lt_sprache TYPE TABLE OF lty_s_sprache.
  APPEND VALUE #( sprachkuerzel = 'DE' text = 'deutsch'  ) TO lt_sprache.
  APPEND VALUE #( sprachkuerzel = 'EN' text = 'english'  ) TO lt_sprache.

*******************************
*EXTRA: Komplexe Tabelle
*******************************
*TYPES: BEGIN OF lty_s_farben,
*         sprache    TYPE string,
*         farbenname TYPE string,
*       END OF lty_s_farben.

* WICHTIG:  im Typ einen weiteren eigenen Typen angeben.




*******************************
* Kontrollstrukturen2
*******************************
  DATA lv_zahld TYPE i VALUE 1.
  DATA lv_zahle TYPE i VALUE 1.
  DATA lv_zahlf TYPE i.

  ULINE.
  WRITE 'Das kleine 1x1 ausgeben:'.

  DO 10 TIMES.
    WHILE lv_zahle <= 10.
      lv_zahlf = lv_zahld * lv_zahle.
      WRITE: /, lv_zahld, '*', lv_zahle, '=', lv_zahlf.
      lv_zahle = lv_zahle + 1.
    ENDWHILE.
    lv_zahld = lv_zahld + 1.
    lv_zahle = 1.
  ENDDO.

*******************************
* EXTRA MAX und Min
*******************************
  DATA: BEGIN OF ls_struktur3,
          zahlen TYPE i,
        END OF ls_struktur3.
  DATA lt_tabelle3 LIKE TABLE OF ls_struktur3.
  DATA lv_zahl3 TYPE i VALUE 1.
  DATA lv_zahlmax TYPE i.
  DATA lv_zahlmin TYPE i.

  DO 100 TIMES.
    ls_struktur3-zahlen = lv_zahl3.
    APPEND ls_struktur3 TO lt_tabelle3.
    lv_zahl3 = lv_zahl3 + 1.
  ENDDO.

*  cl_demo_output=>display( lt_tabelle3 ).

  SORT lt_tabelle3 BY zahlen DESCENDING.
  READ TABLE lt_tabelle3 INTO ls_struktur3 INDEX 1.
  WRITE: /,'Höchster Wert: ', ls_struktur3-zahlen.

*  cl_demo_output=>display( lt_tabelle3 ).

  SORT lt_tabelle3 BY zahlen ASCENDING.
  READ TABLE lt_tabelle3 INTO ls_struktur3 INDEX 1.
  WRITE: /,'niedrigster Wert: ', ls_struktur3-zahlen.

*  cl_demo_output=>display( lt_tabelle3 ).

*******************************
* EXTRA Kontrollstruktur3  Fibonacci
*******************************
  lv_zahl = 50. " Geben Sie die Fibonacci-Sequenz bis zu der lv_zahl Zahl aus.
  DATA: lv_fibo1 TYPE i VALUE 0,
        lv_fibo2 TYPE i VALUE 1,
        lv_fibo3 TYPE i VALUE 0.

  WRITE: 'Die Fibonacci-Sequenz bis', lv_zahl,':'.
  WRITE lv_fibo2.
  WHILE lv_fibo3 <= lv_zahl.
    lv_fibo3 = lv_fibo1 + lv_fibo2.
    lv_fibo1 = lv_fibo2.
    lv_fibo2 = lv_fibo3.
    WRITE lv_fibo3.
  ENDWHILE.
