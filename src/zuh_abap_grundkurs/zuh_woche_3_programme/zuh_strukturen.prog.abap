*&---------------------------------------------------------------------*
*& Report zuh_strukturen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_strukturen.


DATA: BEGIN OF ls_struktur,
        kundennr   TYPE int2,
        kundenname TYPE string,
        datum      TYPE dats,
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF ls_struktur.

ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Tobias Bachmeier'.
ls_struktur-datum = sy-datum.

APPEND ls_struktur TO lt_tabelle.
*CLEAR ls_struktur.

ls_struktur-kundennr = 2.
ls_struktur-kundenname = 'Karl Meier'.
ls_struktur-datum = sy-datum + 2.

APPEND ls_struktur TO lt_tabelle.
*CLEAR ls_struktur.

APPEND VALUE #( kundennr = 3 kundenname = 'Peter Müller' datum = '20191123' ) TO lt_tabelle.

lt_tabelle = VALUE #( BASE lt_tabelle ( kundenname = 'Peter Müller') ).
*CLEAR ls_struktur.

*cl_demo_output=>display( ls_struktur ).
cl_demo_output=>display( lt_tabelle ).

WRITE ls_struktur-kundenname.
