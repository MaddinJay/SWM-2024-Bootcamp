*&---------------------------------------------------------------------*
*& Report zst_constanten
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_constanten.

CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.
Data LV_text type String.
lv_text = |{ lc_hello } { lc_text }|.

Write lv_text.
