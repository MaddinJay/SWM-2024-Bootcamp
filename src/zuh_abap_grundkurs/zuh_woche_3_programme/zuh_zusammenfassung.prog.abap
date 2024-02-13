*&---------------------------------------------------------------------*
*& Report zuh_zusammenfassung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_zusammenfassung.

DATA: BEGIN OF ls_struktur,
        kundennr   TYPE int2,
        kundenname TYPE string,
        datum      TYPE dats,
      END OF ls_struktur.

DATA lt_tabelle LIKE TABLE OF ls_struktur.
APPEND ls_struktur TO lt_tabelle.

lt_tabelle = VALUE #(
( kundennr = 1 kundenname = 'Maier Hans' datum = '20121216' )
( kundennr = 2 kundenname = 'Müller Hendrik' datum = '20141109' )
( kundennr = 3 kundenname = 'Musterman Max' datum = '20150303' )
( kundennr = 4 kundenname = 'Wieland Paula' datum = '20191109' )
).

lt_tabelle = VALUE #( BASE lt_tabelle ( kundenname = 'Peter Müller') ).

*******************************************************
*Bildschirmausgabe einer Struktur
*******************************************************

cl_demo_output=>display( lt_tabelle ).
