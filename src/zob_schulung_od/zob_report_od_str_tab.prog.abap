*&---------------------------------------------------------------------*
*& Report zob_report_od_str_tab
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_str_tab.

DATA: BEGIN OF ls_struktur,
        kundennr   TYPE int2,
        kundenname TYPE string,
        datum      TYPE dats,
      END OF ls_struktur,

      lt_tabelle LIKE TABLE OF ls_struktur.

ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Tobias Bachmier'.
ls_struktur-datum = sy-datum.
APPEND ls_struktur TO lt_tabelle.
CLEAR ls_struktur.

APPEND VALUE #( kundennr = 2
kundenname = 'Jonas Schuster'
datum = sy-datum
) TO lt_tabelle.

*APPEND ls_struktur TO lt_tabelle.
lt_tabelle = VALUE #( BASE lt_tabelle ( kundenname = 'Sebastian Müller') ).

cl_demo_output=>display( ls_struktur ).
cl_demo_output=>display( lt_tabelle ).

TYPES: t_favourite_color TYPE c LENGTH 8.
DATA lv_fav_color TYPE t_favourite_color VALUE 'yellow'.
WRITE: 'meine Liblingsfarbe ist: ', lv_fav_color.

LOOP AT lt_tabelle ASSIGNING FIELD-SYMBOL(<ls_tabellenzeile>).
WRITE / <ls_tabellenzeile>-kundenname.
ENDLOOP.
