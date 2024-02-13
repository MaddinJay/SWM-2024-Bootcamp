*&---------------------------------------------------------------------*
*& Report zob_programm_bl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_programm_bl.

WRITE 'Hello World'.

DATA(lv_test) = 'test'.
WRITE: /'Heute ist der', SY-DATUM.

WRITE: /'Meine Systemsprache ist',SY-LANGU.
WRITE: /'Das ist der Anwendungsserver:' ,sy-host.
WRITE: / 'Das ist der Datenbankserver:' ,sy-dbsys.
*Dies ist eine Erklärung/Kommentar.

*************************************************
*Mit strg Leerzeichen kann man diese Kommentarsternchen als Template einfügen.
*************************************************
DATA(lv_text) = 'Ich bin ein Text'.
DATA(lv_zahl) = 3.
*************************************************
*Alternative_ Elementare Felddefinition:
*************************************************
DATA: lv_text2 TYPE string.
lv_text = |Ich bin ein Text|.
DATA: lv_zahl2 TYPE int2.
lv_zahl = 3.

lv_text = 'Hello World. ' && lv_text.

DATA(lv_zahl3) = '000123'.
lv_zahl3 = |{ lv_zahl3 ALPHA = OUT }|.
WRITE: / lv_zahl3.

DATA: BEGIN OF ls_struktur,
 kundennr TYPE int2,
 kundenname TYPE string,
 datum TYPE dats VALUE '20230807',
 END OF ls_struktur,
 lt_tabelle LIKE TABLE OF ls_struktur.
 WRITE lv_text.
WRITE lv_zahl.
ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Tobias Bachmeier'.
ls_struktur-datum = sy-datum.
APPEND ls_struktur To lt_tabelle.
APPEND VALUE #( kundennr = 2

 kundenname = 'Jonas Schuster'
 datum = sy-datum
 ) TO lt_tabelle.
cl_demo_output=>display(
DATA = lt_tabelle ).

TYPES t_lieblings_farbe TYPE c LENGTH 20.
DATA lv_lieblings_farbe TYPE t_lieblings_farbe VALUE 'black'.
WRITE lv_lieblings_farbe.

DATA(lv_zaehler) = 0.
DO 9 TIMEs.
 WRITE lv_zaehler.
 lv_zaehler = lv_zaehler + 1.
ENDDO.
IF lv_zaehler DIV 2 EQ 0.
 WRITE 'even'.
ELSE.
 WRITE 'odd'.
ENDIF.
