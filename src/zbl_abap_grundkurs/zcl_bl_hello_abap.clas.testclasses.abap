CLASS ltcl_hello_abap DEFINITION FINAL FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      return_value_is_correct FOR TESTING.

ENDCLASS.

CLASS ltcl_hello_abap IMPLEMENTATION.

  METHOD return_value_is_correct.
    DATA mo_cut TYPE REF TO zcl_bl_hello_abap.
    mo_cut = NEW #(  ).

    DATA(lv_test) = mo_cut->get_information( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Gib ABAP Hello aus'
                                        exp = 'Hello ABAP!'
                                        act =  lv_test
                                       ).

  ENDMETHOD.

ENDCLASS.
