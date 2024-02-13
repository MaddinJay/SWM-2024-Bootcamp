*&---------------------------------------------------------------------*
*& Report z_pruefung_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_pruefung_2.

TYPES:
  BEGIN OF ty_daten,
    name  TYPE c,
    datum TYPE d,
    zahl  TYPE i,
  END OF ty_daten.

DATA: ls_daten TYPE ty_daten.

ls_daten = VALUE #( name = 'HORST' datum = sy-datum zahl = 5 ).
ls_daten-name = 'KLAUS'.

WHILE ls_daten-zahl < 5.
  ls_daten-name = 'PETER'.
ENDWHILE.

cl_demo_output=>display( ls_daten ).
