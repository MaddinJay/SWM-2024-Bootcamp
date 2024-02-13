*&---------------------------------------------------------------------*
*& Report zst_schulung_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_02.
***
***
**WRITE 'Hello World'.
**WRITE / sy-datum.
**WRITE / sy-langu.
**WRITE / sy-dbsys.
**WRITE / sy-host.
**
**ULINE.
**
*********************************************************************
*** Textausgabe + 3
*********************************************************************
**
**DATA(lv_text) = |ich bin ein Text|.
**DATA(lv_zahl) = 3.
**
***DATA: lv_text TYPE string. "Alternative 1
***lv_text = |Ich bin ein Text|.
***DATA: lv_zahl TYPE int2.
***lv_zahl = 3.
**
***DATA: lv_text TYPE string VALUE 'Ich bin ein Text'. "Alternative 2
***DATA: lv_zahl TYPE int2 VALUE 3.
**
*DATA: lv_text TYPE string VALUE 'Ich bin ein Text', lv_zahl TYPE int2 VALUE 3. "Alternative 3
**
**WRITE: lv_text, lv_zahl.
**
**ULINE.
*
**DATA: lv_wort TYPE string VALUE  'Das ist noch ein Satz',
**      lv_text2 TYPE string VALUE  'Das ist ein Satz'.
**
**IF lv_wort co lv_text2.
**  WRITE 'wahr'.
**ELSE.
**  WRITE 'falsch'.
**ENDIF.
*
***********************************************************************
**Texte zusammenführen
***********************************************************************
*
**lv_text = |Hello World. { lv_text }|. "Alternative 1
*lv_text = 'Hello World. ' && lv_text. "Alternative 2
*
***********************************************************************
**Zahl addieren
***********************************************************************
*
*lv_zahl = lv_zahl + 8. "Alternative 1
**lv_zahl = 8 + 3. "Alternative 2
*
***********************************************************************
**führende Null entfernen
***********************************************************************
*
*DATA lv_zahl2 TYPE i value '000123'. "Bei Integren werden automatisch führende Nullen entfernt
*
*DATA(lv_zahl4) = '000123'.
*lv_zahl4 = |{ lv_zahl4 ALPHA = OUT }|. "Alternative - Eingebettete ALPHA-Ausdruck
*
*DATA(lv_zahl5) = '000123'.
*SHIFT lv_zahl5 LEFT DELETING LEADING '0'."Alternative - SHIFT-Operator
*
*Write: lv_text,
*/ lv_zahl2,
*/ lv_zahl4,
*/ lv_zahl5.

DATA: BEGIN OF ls_struktur,
        kundennr   TYPE int2,
        kundenname TYPE string,
        datum      TYPE d,
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF ls_struktur.


ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Tobias Bachmeier'.
ls_struktur-datum = sy-datum.

APPEND ls_struktur TO lt_tabelle.

APPEND VALUE #( kundennr = 2
 kundenname = 'Jonas Schuster'
 datum = sy-datum
 ) TO lt_tabelle.

APPEND VALUE #( kundennr = 7 kundenname = 'Sebastian Müller') TO lt_tabelle.

*cl_demo_output=>display( data = lt_tabelle ).

*LOOP AT lt_tabelle INTO ls_struktur
*WHERE kundennr => 1.
*  WRITE: ls_struktur-kundenname, /.
*ENDLOOP.
LOOP AT lt_tabelle ASSIGNING Field-symbol(<ls_tabellenzeile>).
  WRITE: <ls_tabellenzeile>-kundenname, /.
ENDLOOP.
