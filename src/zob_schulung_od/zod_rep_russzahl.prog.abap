*&---------------------------------------------------------------------*
*& Report zod_rep_russzahl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_rep_russzahl.
DATA
      lv_ergebnis    TYPE i VALUE 0.

PARAMETERS: p_links TYPE i.
PARAMETERS: p_rechts TYPE i.


DATA: go_rus_multi TYPE REF TO zod_lcl_rus_multiplikation.
      go_rus_multi = NEW #(  ).
      go_rus_multi->rus_multi(
        EXPORTING
          iv_operand1 = p_links
          iv_operand2 = p_rechts
       IMPORTING
        rv_result   = lv_ergebnis
      ).




*WHILE zahl_links > 0.
*  IF zahl_links MOD 2 = 1. " Addiere zahl_rechts zum Ergebnis, wenn zahl_links ungerade ist
*    ergebnis = ergebnis + zahl_rechts.
*    WRITE: / Zahl_links, Zahl_rechts.
*  ENDIF.
*
*  zahl_links = zahl_links DIV 2. " Teile zahl_links durch 2
*  zahl_rechts = zahl_rechts * 2. " Verdopple zahl_rechts
*ENDWHILE.
*WRITE: / 'Das Produkt von 47 * 42 ist:', ergebnis.

*TYPES: BEGIN OF ty_russ,
*         links  TYPE i,
*         rechts TYPE i,
*       END OF ty_russ.
*
*DATA lv_zahl_links TYPE p VALUE 1.
*DATA lv_zahl_rechts TYPE i VALUE 42.
*DATA lv_ergebnis TYPE i.
*DATA ls_russ TYPE ty_russ.
*DATA lt_tab TYPE TABLE OF ty_russ.
*
*ls_russ-links = lv_zahl_links.
*ls_russ-rechts = lv_zahl_rechts.
*APPEND ls_russ TO lt_tab.
*
**  WRITE lv_zahl_links.
*
*
*WHILE lv_zahl_links > 1.
*  lv_zahl_links = floor( lv_zahl_links / 2 ).
*  lv_zahl_rechts = lv_zahl_rechts * 2.
*
*
*  ls_russ-links = lv_zahl_links.
*  ls_russ-rechts = lv_zahl_rechts.
*
*  APPEND ls_russ TO lt_tab.
*
*ENDWHILE.
*
**cl_demo_output=>display( lt_tab ).
*
*LOOP AT lt_tab INTO ls_russ.
*  IF ls_russ-links MOD 2 NE 0.
*    lv_ergebnis = lv_ergebnis + ls_russ-rechts.
*  ENDIF.
*ENDLOOP.
*
*WRITE lv_ergebnis.
