*&---------------------------------------------------------------------*
*& Report zob_schulung_test3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_test3.

DATA: BEGIN OF ls_farbe,
        sprache    TYPE string,
        farbenname TYPE string,
      END OF ls_farbe.

Data: lt_farbe like table of ls_farbe.

ls_farbe-farbenname = 'rot'.
Append ls_farbe to lt_farbe.





cl_demo_output=>display( lt_farbe ).
