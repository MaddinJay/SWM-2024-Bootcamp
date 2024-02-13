CLASS ltcl_hello_abap DEFINITION FINAL FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    DATA mo_wert TYPE REF TO zcl_uh_hello_abap.
    METHODS return_value_is_correct for testing.

ENDCLASS.

CLASS ltcl_hello_abap IMPLEMENTATION.

  METHOD return_value_is_correct.
  DATA mo_wert TYPE REF TO zcl_uh_hello_abap.
  mo_wert = NEW #(  ).
 Data(lv_wert) = mo_wert->get_information( ).
cl_abap_unit_assert=>assert_equals( msg = 'Hello ABAP!' exp = 'Hello ABAP!' act = lv_wert ).
  ENDMETHOD.

ENDCLASS.
