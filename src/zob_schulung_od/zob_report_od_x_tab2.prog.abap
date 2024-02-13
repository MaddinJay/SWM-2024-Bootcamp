*&---------------------------------------------------------------------*
*& Report zob_report_od_x_tab2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_x_tab2.

*DATA: BEGIN OF ls_werte,
*         euro     TYPE p DECIMALS 2,
*         dollar   TYPE p DECIMALS 2,
*         END OF LS_WERTE,
*         lt_werte lIKE TABLE OF ls_werte.
*CONSTANTS lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.
*PARAMETERS: p_urk TYPE p DECIMALS 2 OBLIGATORY.
*INITIALIZATION.
*p_urk = lc_umrechnung.
**DATA(lv_euro) = 0.
*START-OF-SELECTION.
*do 100 TIMES.
*ls_werte-euro = ls_werte-euro + 1.
*ls_werte-dollar = ls_werte-euro * p_urk.
*APPEND ls_werte TO lt_werte.
*ENDDO.
*
*cl_demo_output=>display( lt_werte ).
*
*data: lv_zahla TYPE i VALUE 6,
*      lv_zahlb TYPE i VALUE 7,
*      lv_zahlc TYPE string.
*   lv_zahlc = lv_zahla + lv_zahlb.
*WRITE: lv_zahlc.

TYPES: BEGIN OF ls_sprache,
         sprachkuerzel TYPE c LENGTH 2,
         sprachtext    TYPE string,
       END OF ls_sprache.

DATA: lt_text TYPE TABLE OF ls_sprache.
lt_text = VALUE #(
( sprachkuerzel = 'DE' sprachtext ='deutscher Text' )
( sprachkuerzel = 'AT' sprachtext ='Österreichicher Text' )
( sprachkuerzel = 'EN' sprachtext ='Englischer Text' )
( sprachkuerzel = 'ES' sprachtext ='Texto en español' )
).

cl_demo_output=>display( lt_text ).
