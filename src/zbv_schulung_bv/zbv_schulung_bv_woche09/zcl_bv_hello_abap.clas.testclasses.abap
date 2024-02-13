CLASS lctcl_hello_abap DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_hello_abap TYPE REF TO zcl_bv_hello_abap.

    METHODS: setup,
      return_value_is_correct FOR TESTING.

ENDCLASS.

CLASS lctcl_hello_abap IMPLEMENTATION.

  METHOD setup.
    mo_hello_abap = NEW #( ).
  ENDMETHOD.

  METHOD return_value_is_correct.
    DATA(lv_hello_abap) = mo_hello_abap->get_information( ).
    cl_abap_unit_assert=>assert_equals( msg = 'Es wird "Hello ABAP!" erwartet.'
                                        exp = 'Hello ABAP!'
                                        act = lv_hello_abap ).
  ENDMETHOD.

ENDCLASS.
