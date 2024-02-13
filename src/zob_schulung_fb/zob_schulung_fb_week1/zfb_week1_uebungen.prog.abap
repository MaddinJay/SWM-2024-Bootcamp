*&---------------------------------------------------------------------*
*& Report zfb_week1_uebungen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_week1_uebungen.

***** Übung Seite 20 ******

DATA lv_zahl TYPE i.

lv_zahl = 0.

DO 11 TIMES.
  WRITE lv_zahl.
  lv_zahl = lv_zahl + 1.
ENDDO.
CLEAR lv_zahl.
ULINE.

IF lv_zahl MOD 2 EQ 0. WRITE 'even'. ELSE. WRITE 'odd'. ENDIF.
ULINE.
CLEAR lv_zahl.
*Kombination einer Schleife mit Verzweigung:
*Sie können Schleifen und Verzweigungen auch kombinieren -> Beispiel.

DO 10 TIMES.
WRITE lv_zahl.
  IF lv_zahl MOD 2 EQ 0.
  WRITE 'Even'.
ELSE.
  WRITE 'Odd'.
ENDIF.
lv_zahl = lv_zahl + 1.
ENDDO.

ULINE. ULINE.

DATA: BEGIN OF ls_struktur,
kundennr TYPE int2,
kundenname TYPE string,
datum TYPE dats,
END OF ls_struktur,
lt_tabelle LIKE TABLE OF ls_struktur.

ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Harry Kane'.
ls_struktur-datum = sy-datum.

LOOP AT lt_tabelle ASSIGNING FIELD-SYMBOL(<ls_tabellenzeile>).
  WRITE / <ls_tabellenzeile>-Kundenname.
ENDLOOP.
