*&---------------------------------------------------------------------*
*& Report ZEM_LCLASS2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_LCLASS2.

CLASS lcl_Interpret DEFINITION.
  PUBLIC SECTION.
    DATA: mv_name     TYPE string,
          mv_nachname TYPE string,
          mv_art      TYPE string.

ENDCLASS.

*CLASS lcl_Interpret IMPLEMENTATION.
*ENDCLASS.
Data grt_v TYPE TABLE OF REF TO lcl_Interpret.
data gr_v TYPE REF TO lcl_Interpret.
CREATE OBJECT gr_v.
gr_v->mv_name = 'John'.
gr_v->mv_nachname = 'Coltrane'.
APPEND gr_v to grt_v.

CREATE OBJECT gr_v.
gr_v->mv_name = 'Miles'.
gr_v->mv_nachname = 'Davis'.
APPEND gr_v to grt_v.

Loop at grt_v INTO gr_v.
 WRITE: gr_v->mv_name, gr_v->mv_nachname, /.
Endloop.


BREAK-POINT.
