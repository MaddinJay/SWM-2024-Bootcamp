CLASS ltcl_hello_abap DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA return TYPE REF TO zcl_aw_hello_abap.
    METHODS:
      setup,
      return_value_is_correct FOR TESTING.
ENDCLASS.


CLASS ltcl_hello_abap IMPLEMENTATION.

  METHOD setup.
    return = NEW zcl_aw_hello_abap( ).
  ENDMETHOD.

  METHOD return_value_is_correct.
    cl_abap_unit_assert=>assert_equals(
    act = return->get_information( )
      exp = 'Hello ABAP'  ).
  ENDMETHOD.

ENDCLASS.
