*&---------------------------------------------------------------------*
*& Report ZEM_OBJECTORIENT
*&---------------------------------------------------------------------*
*& Wertezuweisung über Klasse + Ausgabe
*&---------------------------------------------------------------------*
REPORT zem_objectorient.

CLASS lcl_Interpret DEFINITION.
  PUBLIC SECTION.
    DATA: mv_name     TYPE string,
          mv_nachname TYPE string,
          mv_art      TYPE string.

ENDCLASS.


*CLASS lcl_Interpret IMPLEMENTATION.
*ENDCLASS.

" -> Verweis auf Datenelement innerhalb der Klasse
" => (XXX) für verweis auf eine typisierung innerhalb der Klasse (types: beginn of XXX end of...innerhalb der klasse)


DATA gr_v TYPE REF TO lcl_Interpret. "lcl = local class
CREATE OBJECT gr_v.
gr_v->mv_name = 'John'.
gr_v->mv_nachname = 'Coltrane'.
gr_v->mv_art = 'Sax'.

DATA gr_v1 TYPE REF TO lcl_Interpret.
CREATE OBJECT gr_v1.
gr_v1->mv_name = 'Miles'.
gr_v1->mv_nachname = 'Davis'.
gr_v1->mv_art = 'Horn'.

Data gr_v2 TYPE REF TO lcl_Interpret.
CREATE OBJECT gr_v2.
gr_v2->mv_name = 'Thelonious'.
gr_v2->mv_nachname = 'Monk'.
gr_v2->mv_art = 'Piano'.

WRITE: 'Interpret 1:', gr_v->mv_name, gr_v->mv_nachname, /, 'Instrument:', gr_v->mv_art, /,
       /, 'Interpret 2:', gr_v1->mv_name, gr_v1->mv_nachname, /, 'Instrument:', gr_v1->mv_art, /,
       /, 'Interpret 3:', gr_v2->mv_name, gr_v2->mv_nachname, /, 'Instrument:', gr_v2->mv_art.

*READ TABLE grt_v into gr_v with KEY table_line->mv_art = 'Piano'.

Data grt_v type STANDARD TABLE OF ref to lcl_Interpret.
APPEND gr_v to grt_v.
APPEND gr_v1 to grt_v.
APPEND gr_v2 to grt_v.

Skip 2.
WRITE: /, 'Eingetragene Interpreten:'.
ULine.

LOOP AT grt_v into gr_v.
  WRITE: /, gr_v->mv_name, gr_v->mv_nachname.
  ENDLOOP.


BREAK-POINT.
