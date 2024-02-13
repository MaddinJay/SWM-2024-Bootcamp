*&---------------------------------------------------------------------*
*& Report zbv_report_uebung3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_report_uebung3.

TYPES: BEGIN OF lty_s_struktur,
  Sprachkuerzel TYPE c LENGTH 2,
  Text TYPE string,
END OF LTY_S_STRUKTUR.

DATA ls_struktur TYPE lty_s_struktur.

ls_struktur-sprachkuerzel = 'DE'.
ls_struktur-text = 'Deutschland'.

TYPES tab_tabelle
    TYPE STANDARD TABLE OF lty_s_struktur.

DATA lt_t_tabelle TYPE tab_tabelle.

APPEND ls_struktur TO lt_t_tabelle.

cl_demo_output=>display( data = lt_T_tabelle ).

*Oder:

TYPES: BEGIN OF ty_s_text,
       sprachkuerzel TYPE c LENGTH 2,
       text TYPE string,
       END OF ty_s_text.

DATA: lt_text TYPE TABLE OF ty_s_text.

lt_text = VALUE #(
( sprachkuerzel = 'DE' text = 'deutscher Text' )
( sprachkuerzel = 'AT' text = 'österreichischer Text' )
).

cl_demo_output=>display( lt_text ).
