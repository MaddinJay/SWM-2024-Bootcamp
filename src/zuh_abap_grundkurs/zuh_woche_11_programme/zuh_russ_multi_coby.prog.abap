*&---------------------------------------------------------------------*
*& Report zuh_russ_multi_coby
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_russ_multi_coby.

Parameters: p_zahl1 type p OBLIGATORY.
Parameters: p_zahl2 type p OBLIGATORY.

TYPES: BEGIN OF ty_russ,
         links  TYPE p,
         rechts TYPE p,
       END OF ty_russ.

DATA lv_zahl_links TYPE p.
DATA lv_zahl_rechts TYPE p.
DATA lv_ergebnis TYPE p.
DATA ls_russ TYPE ty_russ.
DATA lt_tab TYPE TABLE OF ty_russ.

lv_zahl_links = p_zahl1.
lv_zahl_rechts = p_zahl2.

ls_russ-links = lv_zahl_links.
ls_russ-rechts = lv_zahl_rechts.
APPEND ls_russ TO lt_tab.

*  WRITE lv_zahl_links.

WHILE lv_zahl_links > 1.
  lv_zahl_links = floor( lv_zahl_links / 2 ).
  lv_zahl_rechts = lv_zahl_rechts * 2.

  ls_russ-links = lv_zahl_links.
  ls_russ-rechts = lv_zahl_rechts.

  APPEND ls_russ TO lt_tab.

ENDWHILE.

cl_demo_output=>display( lt_tab ).

LOOP AT lt_tab INTO ls_russ.
  IF ls_russ-links MOD 2 NE 0.    "NE ist nicht durch 2 teilbar
    lv_ergebnis = lv_ergebnis + ls_russ-rechts.
  ENDIF.
ENDLOOP.

WRITE lv_ergebnis.
