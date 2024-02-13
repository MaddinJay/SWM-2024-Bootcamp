*&---------------------------------------------------------------------*
*& Report zob_mb_potenztochter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_potenztochter.

DATA lv_erg TYPE i.

DATA    go_potenz TYPE REF TO zcl_mb_potenz_tochter.
        go_potenz = NEW #( ).

lv_erg = go_potenz->potenz( iv_zahl = 4 iv_zahl2 = 2  ).

write lv_erg.
