*&---------------------------------------------------------------------*
*& Report zob_schulung_debug
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_debug.

CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text.'.

Data lv_text type string.
lv_text = |{ lc_hello } { lc_text }|.

write lv_text.
