
REPORT zas_abapoo_1_3.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS: set_airplane_name
      IMPORTING iv_name TYPE string.
    METHODS: set_plantype
      IMPORTING iv_plantype TYPE saplane-planetype.
    METHODS: display_attributes
      EXPORTING ev_name      TYPE string
                ev_planetype TYPE saplane-planetype.
    CLASS-METHODS: display_n_o_airplanes
      EXPORTING gv_n_o_airplanes TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.

    CLASS-DATA gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_plantype.
    mv_planetype = iv_plantype.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: 'Name: ', mv_name.
    WRITE: / 'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    WRITE: / 'Nummer Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  DATA: go_airplane            TYPE REF TO lcl_airplane,
        gt_airplane            TYPE TABLE OF REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.

  go_airplane = NEW #( ).
  lcl_airplane=>display_n_o_airplanes( ).
  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus').
  go_airplane->set_plantype( EXPORTING iv_plantype = '2321').
  go_airplane->display_attributes( ).
  lcl_airplane=>display_n_o_airplanes( ).

END-OF-SELECTION.
