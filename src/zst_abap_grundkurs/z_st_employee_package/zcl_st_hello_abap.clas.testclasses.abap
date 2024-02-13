CLASS ltcl_hello_abap DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    METHODS test_return_value_is_correct FOR TESTING.
ENDCLASS.
CLASS ltcl_hello_abap IMPLEMENTATION.

  METHOD test_return_value_is_correct.
    DATA hello TYPE REF TO zcl_st_hello_abap.
    DATA message TYPE string.

    hello = NEW #( ).

    message = hello->get_information( ).

    cl_abap_unit_assert=>assert_equals(
      act = message
      exp = 'Hello ABAP!'
      msg = 'Die Nachricht soll "Hello ABAP!" lauten' ).
  ENDMETHOD.

ENDCLASS.
