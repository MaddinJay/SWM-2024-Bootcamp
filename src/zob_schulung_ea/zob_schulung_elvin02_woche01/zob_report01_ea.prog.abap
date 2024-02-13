
REPORT zob_report01_ea.

"Dies ist die erste Übung"

WRITE 'Hello World'.

SKIP.
ULINE.
SKIP.

WRITE:   'Datum', sy-datum. "fügt das aktuelle Datum ein"
WRITE: / 'sprache', sy-langu.
WRITE: / 'Anwendungsserver', sy-host. "Zeigt den Anwendungsserver"
WRITE: / 'Datenbankserver', sy-dbsys. "Zeigt den Datenbankserver"
SKIP.
ULINE.


DATA(lv_text) = 'ich bin ein Text'.
DATA(lv_zahl) = 3.

WRITE lv_text.
WRITE / lv_zahl.

DATA: lv_text2 TYPE string VALUE 'ich bin ein Text 2',
      lv_zahl2 TYPE i VALUE 3.

WRITE / lv_text2.
WRITE / lv_zahl2.
SKIP 2.
ULINE.

IF 'das ist ein Satz' CA 'bx'.
WRITE 'Wahr'.
ELSE.
WRITE 'Falsch'.
ENDIF.

SKIP.
ULINE.

lv_text = 'Hello Word' && lv_text.
WRITE Lv_text.

SKIP.
lv_zahl = lv_zahl + 5.
WRITE lv_zahl.

SKIP.
IF lv_text CA 'abc'.
WRITE 'WAHR'.
ELSE.
WRITE 'Falsch'.
ENDIF.

DATA(lv_zahl3) = '000123'.
SHIFT lv_zahl3 LEFT DELETING LEADING '0'.
WRITE lv_zahl3.

SKIP.
DATA(lv_zahl4) = '0001234'.
SKIP.
ULINE.
*********************************************
* Struktuern und Tabellen.
*********************************************

DATA: BEGIN OF ls_mitarbeiter, "Hier eine Andere Art eine Struktur zu definieren, direkt mit DATA".
      vorname TYPE string,
      nachname TYPE string,
      persnr TYPE i,
      END OF LS_MITARBEITER,
      lt_tabelle LIKE TABLE OF ls_mitarbeiter.

ls_mitarbeiter-vorname = 'Elvin'.
ls_mitarbeiter-nachname = 'Alioski'.
ls_mitarbeiter-persnr = 9.

APPEND ls_mitarbeiter TO lt_tabelle.
APPEND VALUE #( vorname = 'Lionel' nachname = 'Messi' persnr = 10 ) TO lt_tabelle.


*cl_demo_output=>display( lt_tabelle ).

*******************************************************************************************
LOOP AT lt_tabelle INTO ls_mitarbeiter. "Hier wird über die Tabelle geloopt, jedes mal wird nur der Nachname ausgegeben.
WRITE ls_mitarbeiter-nachname.
ENDLOOP.
*******************************************************************************************
DATA: BEGIN OF st_farben,
      farbe TYPE C LENGTH 20,
      code  TYPE C LENGTH 2,
      END OF st_Farben.

SKIP.
ULINE.

DATA(lv_zaehler) = 0.
DO 10 TIMES.
  lv_zaehler = lv_zaehler + 1.
  WRITE lv_zaehler.
ENDDO.

ULINE.



DATA(lv_zaehler2) = 0.
  WHILE lv_zaehler2 < 10.
  lv_zaehler2 = lv_zaehler2 + 1.
  WRITE lv_zaehler2.
ENDWHILE.

ULINE.


**************************************************************************************************************************

*********************************************
*AUFGABE ZAHLEN
*********************************************
DATA gv_dezimalzahl TYPE p DECIMALS 2 VALUE '15.55'.
DATA gv_integer TYPE i VALUE 4.

DATA:gv_addition TYPE p DECIMALS 2.
     gv_addition = gv_dezimalzahl + gv_integer.

DATA gv_multipli TYPE p DECIMALS 2.
     gv_multipli = gv_dezimalzahl * gv_integer.

WRITE: / 'SUMME ADDITION', gv_addition.
WRITE: / 'SUMME MULTIPLIKATION', gv_multipli.

ULINE.

*********************************************
*AUFGABE STRINGMANIPLULATION
*********************************************

DATA gv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit'.

REPLACE ALL OCCURRENCES OF 'e' IN gv_text WITH ' '.
REPLACE ALL OCCURRENCES OF 'E' IN gv_text WITH ' '. "Wichtig, weil er wirklich auf Groß- und Kleinschreibung achtet"

WRITE / gv_text.

ULINE.


WRITE: 'Mandant', sy-mandt.
WRITE: / 'System', sy-sysid.
WRITE: / 'es ist', sy-uzeit, 'Uhr'.


ULINE.
DATA(lv_zahl6) = 1.

WHILE lv_zahl6 <= 100.
  IF lv_zahl6 MOD 3 EQ 0.
  WRITE : / , 'DREIER ZAHL', lv_zahl6.
ENDIF.
lv_zahl6 = lv_zahl6 + 1.
ENDWHILE.

TYPES lt_int Type int1.


DATA: BEGIN OF ls_struktur,
      ID         TYPE lt_int,
      vorname    TYPE string,
      nachname   TYPE c LENGTH 1,
      alter      TYPE i,
      softskills TYPE string,
      END OF LS_STRUKtUR,
      lt_tabelle1 LIKE TABLE OF ls_struktur.

ls_struktur-id         = 100.
ls_struktur-vorname    = 'E'.
ls_struktur-nachname   = 'ALIOSKI'.
ls_struktur-alter      = 24.
ls_struktur-softskills = 'Kreativ'.

APPEND ls_struktur TO lt_tabelle1.

APPEND VALUE #( id = 101 vorname = 'Lionel' nachname = 'M' alter = 36 softskills = 'FUSSBALL' ) TO lt_tabelle1.
APPEND VALUE #( id = 102 vorname = 'Max' nachname = 'H' alter = 40 softskills = 'KEINE' ) TO lt_tabelle1.
APPEND VALUE #( id = 103 vorname = 'MANFRED' nachname = 'S' alter = 30 softskills = 'BAUEN' ) TO lt_tabelle1.
APPEND VALUE #( id = 104 vorname = 'CRISTIANO' nachname = 'R' alter = 38 softskills = 'FUSSBALL' ) TO lt_tabelle1.
APPEND VALUE #( id = 105 vorname = 'BENJAMIN' nachname = 'V' alter = 21 softskills = 'BOSANAC' ) TO lt_tabelle1.
APPEND VALUE #( id = 106 vorname = 'DENIS' nachname = 'A' alter = 16 softskills = 'HS' ) TO lt_tabelle1.

*cl_demo_output=>display(  DATA = lt_tabelle1 ).


SKIP.
ULINE.

*PARAMETERS p_geld TYPE p DECIMALS 2 OBLIGATORY.

*DATA: BEGIN OF ls_geld,
*          EURO   TYPE p DECIMALS 2,
*          DOLLAR TYPE p DECIMALS 2,
*      END OF ls_geld,
**lt_geld LIKE TABLE OF ls_geld.
*
*ls_geld-EURO =   '1.00'.
*ls_geld-DOLLAR = '1.09'.


*DO 100 TiMES.
*APPEND ls_geld TO lt_geld.
*     ls_geld-Euro   = ls_geld-EURO   + 1.
*     ls_geld-DOLLAR = ls_geld-DOLLAR + p_geld.
*ENDDO.
*cl_demo_output=>display(  DATA = lt_geld ).


SKIP.
ULINE.


DATA: gv_a TYPE i VALUE 2,
      gv_b TYPE i VALUE 3,
      gv_C TYPE i.

gv_c = gv_a + gv_b.

WRITE: 'Die SUMME aus ' , gv_a, 'und', gv_b, 'ist', gv_c, '.'.


SKIP.
ULINE.

TYPES: BEGIN OF lty_s_struktur2,
  Sprachkuerzel TYPE c LENGTH 2,
  Text TYPE string,
END OF LTY_S_STRUKTUR2.

DATA ls_struktur2 TYPE lty_s_struktur2.

ls_struktur2-sprachkuerzel = 'DE'.
ls_struktur2-text = 'Deutschland'.

TYPES tab_tabelle
    TYPE STANDARD TABLE OF lty_s_struktur2.

DATA lt_t_tabelle TYPE tab_tabelle.

APPEND ls_struktur2 TO lt_t_tabelle.

cl_demo_output=>display( data = lt_T_tabelle ).
