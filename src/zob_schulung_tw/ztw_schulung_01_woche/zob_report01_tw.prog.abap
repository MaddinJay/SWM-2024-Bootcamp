*&---------------------------------------------------------------------*
*& Report zob_report01_tw
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report01_tw.

*WRITE 'Hello World'.
*ULINE.
*
**DATA(lv_test) = 'Tst'.
*
*DATA lv_eclipse TYPE string VALUE 'Vordefiniert'.
*DATA lv_zahl TYPE i VALUE 9.
*
**vordefinierter Wert wird überschrieben
*lv_eclipse = 'Test'.
*lv_zahl = 45000.
*
*WRITE lv_test.
*
*WRITE: / 'Tagesdatum:',sy-datum.
*WRITE: / 'Sprache:', sy-langu.
*WRITE: / 'Anwendungsserver:', sy-host.
*WRITE: / 'Systemserver:', sy-dbsys.

**********************************
*
**********************************
*DATA lv_hello Type string.
*Data lv_text Type string.
*Data lv_zusammen Type string.
*
*lv_hello = 'Hello World'.
*lv_text = 'Ich bin ein Text'.
*
*CONCATENATE lv_hello lv_text Into lv_zusammen separated by ' '.
*WRITE / lv_zusammen.

**********************************************************************
*DATA: BEGIN OF ls_struktur,
*        kundennr   TYPE int2,
*        kundenname TYPE string,
*        datum      TYPE dats,
*        Zeit       TYPE t,
*      END OF ls_struktur,
*      lt_tabelle LIKE TABLE OF ls_struktur.
*
*ls_struktur-kundennr = 1.
*ls_struktur-kundenname = 'Thea Waldhauser'.
*ls_struktur-datum = sy-datum.
*ls_struktur-zeit = sy-timlo.
*
*APPEND ls_struktur TO lt_tabelle.
*
*APPEND VALUE #( kundennr = 2 kundenname = 'Antje Weiland' datum = sy-datum zeit = sy-timlo ) TO lt_tabelle.
*APPEND VALUE #( kundennr = 3 kundenname = 'Bernd Loettrich' datum = sy-datum zeit = sy-timlo ) TO lt_tabelle.
*
*cl_demo_output=>display(
*data = lt_tabelle
*).

*TYPES: t_favourite_color TYPE c LENGTH 5.
*
*DATA lv_fav_color TYPE t_favourite_color VALUE 'PINK'.
*WRITE lv_fav_color.

*
*DATA: lv_zahl TYPE i VALUE 1.
*
*WHILE lv_zahl < 11.
*  WRITE lv_zahl.
*  lv_zahl = lv_zahl + 1.
*ENDWHILE.

*ULINE.

DATA: lv_zahl1 TYPE i VALUE 1.

DO 10 TIMES.
  WRITE lv_zahl1.
   IF lv_zahl1 MOD 2 EQ 0.
  WRITE 'even'.
  ELSE.
  Write 'odd'.
  ENDIF.
  lv_zahl1 = lv_zahl1 + 1.
ENDDO.

ULINE.
