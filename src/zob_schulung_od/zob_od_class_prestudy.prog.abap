*&---------------------------------------------------------------------*
*& Report ZOB_OD_CLASS_PRESTUDY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_class_prestudy.

CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA: mv_make  TYPE string,
          mv_model TYPE string.
ENDCLASS.
CLASS lcl_vehicle IMPLEMENTATION.
ENDCLASS.
START-OF-SELECTION.

DATA: gr_ref  TYPE REF TO lcl_vehicle.
create OBJECT gr_ref.
gr_ref->mv_make = 'VW'.
gr_ref->mv_model = 'Käfer'.

DATA: gr_ref2  TYPE REF TO lcl_vehicle.
create OBJECT gr_ref2.
gr_ref2->mv_make = 'Mercedes'.
gr_ref2->mv_model = '200D'.

DATA: gr_ref3  TYPE REF TO lcl_vehicle.
create OBJECT gr_ref3.
gr_ref3->mv_make = 'Audi'.
gr_ref3->mv_model = 'A4'.

DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
APPEND gr_ref to grt_ref.
APPEND gr_ref2 to grt_ref.
APPEND gr_ref3 to grt_ref.
LOOP AT grt_ref INTO gr_ref.
  WRITE: / gr_ref->mv_make, gr_ref->mv_model.
ENDLOOP.


END-OF-SELECTION.
