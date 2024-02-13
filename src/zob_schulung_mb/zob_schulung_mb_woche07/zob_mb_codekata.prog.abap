*&---------------------------------------------------------------------*
*& Report zob_mb_codekata
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_codekata.

TYPES: BEGIN OF ty_russ,
         links  TYPE i,
         rechts TYPE i,
       END OF ty_russ.

DATA lv_zahl_links TYPE p VALUE 1.
DATA lv_zahl_rechts TYPE i VALUE 42.
DATA lv_ergebnis TYPE i.
DATA ls_russ TYPE ty_russ.
DATA lt_tab TYPE TABLE OF ty_russ.

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

*cl_demo_output=>display( lt_tab ).

LOOP AT lt_tab INTO ls_russ.
  IF ls_russ-links MOD 2 NE 0.
    lv_ergebnis = lv_ergebnis + ls_russ-rechts.
  ENDIF.
ENDLOOP.

WRITE lv_ergebnis.
