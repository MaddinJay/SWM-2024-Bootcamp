*&---------------------------------------------------------------------*
*& Report zob_mb_potenz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_potenz.

DATA lv_erg TYPE i.

DATA    go_potenz TYPE REF TO zcl_mb_potenz.
        go_potenz = NEW #( ).

lv_erg = go_potenz->potenz( iv_zahl = 3 iv_zahl2 = 2  ).

write lv_erg.
