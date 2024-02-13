*&---------------------------------------------------------------------*
*& Report zbv_schulung_bv_report01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_bv_report01.
**********************************************************************
*Beschreibung: Testreport
**********************************************************************
*Erstellt LEARN-013 20.11.2023
**********************************************************************
*Änderungen
**********************************************************************
*20.11.2023
**********************************************************************
*WRITE 'HELLO WORLD!'.
*
*
*
*WRITE / sy-datum.
* "gibt das Datum aus
*WRITE sy-langu. "Ausgabe der Sprache
*WRITE / sy-host.
*WRITE / sy-dbsys.
*
DATA: lv_text TYPE string,
      lv_zahl TYPE int2.
*
*lv_text = 'Ich bin ein Text'.
*lv_zahl = 5.
*
*lv_text = 'Hello World!' && lv_text.
*lv_zahl = lv_zahl + 3.
*
*WRITE / lv_text.
*WRITE / lv_zahl.

*IF 'Das ist ein Satz' CA 'x'.
*WRITE 'WAHR'.
*ELSE.
*WRITE 'FALSCH'.
*ENDIF.

*DATA lv_text2 TYPE string VALUE 'Das'.
*DATA lv_text3 TYPE string VALUE 'Das'.
*
*DATA(lv_zahl2) = '00012'.
*
*SHIFT lv_zahl2 LEFT DELETING LEADING '0'.
*WRITE lv_zahl2.
*
*IF lv_text2 CN lv_text3.
*WRITE 'Wahr'.
*ELSE.
*WRITE 'Falsch'.
*ENDIF.

CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.

lv_text = |{ lc_hello } { lc_text }|.

WRITE lv_text.


*DATA: BEGIN OF ls_struktur,
*      kundennr TYPE int2,
*      kundenname TYPE string,
*      datum TYPE dats,
*      END OF ls_struktur,
*      lt_table LIKE TABLE OF ls_struktur.
*
*ls_struktur-kundennr = 7.
*ls_struktur-kundenname = 'Cristiano Ronaldo'.
*ls_struktur-datum = sy-datum.
*
*APPEND ls_struktur TO lt_table.
*
*APPEND VALUE #( kundennr = 10 kundenname = 'Lionel Messi' datum = sy-datum ) to lt_table.
*
*lt_Table = VALUE #( BASE lt_table ( kundennr = 11 Kundenname = 'Neymar' datum = sy-datum ) ).
*
*LOOP AT lt_table INTO ls_struktur.
*WRITE / ls_struktur-Kundenname.
*ENDLOOP.


*LOOP AT lt_table ASSIGNING FIELD-SYMBOL(<ls_tabellenzeile>).
*  WRITE / <ls_tabellenzeile>-kundenname.
* ENDLOOP.
*
*cl_demo_output=>display( DATA = lt_table ).

*TYPES: t_favorite_color TYPE c LENGTH 5.
*
*DATA lv_fav_color TYPE t_favorite_color VALUE 'yellow'.
*
*WRITE lv_fav_color.

*DATA(lv_zahl5) = 1.
*
*DO 10 TIMES.
*lv_zahl5 = lv_zahl5 + 1.
*WRITE lv_zahl5.
*ENDDO.
*
*WHILE lv_zahl5 <= 10.
*WRITE lv_zahl5.
*lv_zahl5 = lv_zahl5 + 1.
*ENDWHILE.
