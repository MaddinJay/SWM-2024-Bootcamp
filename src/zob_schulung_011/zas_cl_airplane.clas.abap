CLASS zas_cl_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS set_airplane_name IMPORTING iv_name TYPE string.
    METHODS  set_planetype IMPORTING iv_planetype TYPE saplane-planetype.
    METHODS display_attributes EXPORTING ev_name      TYPE string
                                         ev_planetype TYPE saplane-planetype.
    CLASS-METHODS display_n_o_airplane EXPORTING iv_n_o_airplane TYPE i.
    DATA: mv_name          TYPE string,
          mv_planetype     TYPE saplane-planetype,
          gv_n_o_airplanes TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zas_cl_airplane IMPLEMENTATION.
  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    ev_name = mv_name.
    ev_planetype = mv_planetype.
    WRITE: |Flugzeugname: { mv_name }|.
    WRITE: |Flugzeugtyp: { mv_planetype }|.
  ENDMETHOD.

  METHOD display_n_o_airplane.
    WRITE: |Flugzeugnummer: { iv_n_o_airplane }|.
  ENDMETHOD.

ENDCLASS.
