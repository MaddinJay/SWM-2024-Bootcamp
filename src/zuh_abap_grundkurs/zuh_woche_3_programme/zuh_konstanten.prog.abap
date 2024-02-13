*&---------------------------------------------------------------------*
*& Report zuh_konstanten
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_konstanten.

CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.

*lc_text = |{ lc_hello } { lc_text }|.   "da constante

CONSTANTS lv_zahl Value 5.
*lv_zahl = Lv_zahl + 3.     "da constante

Write lv_zahl.
