*&---------------------------------------------------------------------*
*& Report ZMB_OO2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_oo2.

**********************************************************************
*  CLASS lcl_vehicle Defintion
**********************************************************************

CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA mv_make TYPE string.
    DATA mv_model TYPE string.
ENDCLASS.


**********************************************************************
*  CLASS lcl_vehicle Implementation
**********************************************************************

CLASS lcl_vehicle IMPLEMENTATION.
ENDCLASS.

DATA gr_ref TYPE REF TO lcl_vehicle.
CREATE OBJECT gr_ref.
gr_ref->mv_make = 'VW'.
gr_ref->mv_model = 'Käfer'.


DATA gr_ref2 TYPE REF TO lcl_vehicle.
CREATE OBJECT gr_ref2.
gr_ref2->mv_make = 'Mercedes'.
gr_ref2->mv_model = '200D'.

DATA gr_ref3 TYPE REF TO lcl_vehicle.
gr_ref3 = gr_ref2.
gr_ref3->mv_model = '300D'.

*WRITE:/ 'Referenz 1:', gr_ref->mv_make,gr_ref->mv_model.
*WRITE:/ 'Referenz 2:', gr_ref2->mv_make,gr_ref2->mv_model.
*WRITE:/ 'Referenz 3:', gr_ref3->mv_make,gr_ref3->mv_model.

DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
APPEND gr_ref TO grt_ref.
APPEND gr_ref2 TO grt_ref.
APPEND gr_ref3 TO grt_ref.


READ TABLE grt_ref INTO gr_ref
WITH KEY table_line->mv_make = 'VW'.

LOOP AT grt_ref INTO gr_ref.
write :/ gr_ref->mv_make,gr_ref->mv_model.
ENDLOOP.

BREAK-POINT.
