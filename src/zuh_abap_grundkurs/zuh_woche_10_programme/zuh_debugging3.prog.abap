*&---------------------------------------------------------------------*
*& Report zuh_debugging3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_debugging3.

DATA lv_value TYPE string.      "Type i ist falsch ... sollte string sein
lv_value = 'ABC'.               "Value war falsch geschrieben.
WRITE lv_value.
