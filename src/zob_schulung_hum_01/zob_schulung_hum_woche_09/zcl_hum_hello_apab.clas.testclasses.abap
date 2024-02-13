CLASS ltcl_hum_hello_apab DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PUBLIC SECTION.
    METHODS return_value_is_correct FOR TESTING.
ENDCLASS.
CLASS ltcl_hum_hello_apab IMPLEMENTATION.
  METHOD return_value_is_correct.
    cl_abap_unit_assert=>assert_equals(
      act = NEW zcl_hum_hello_apab( )->get_information( )
      exp = 'Hello ABAP!' ).
  ENDMETHOD.
ENDCLASS.
