*"* use this source file for your ABAP unit test classes

CLASS ltcl_fb_hello_apab DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PUBLIC SECTION.
    METHODS rv_correct FOR TESTING.

ENDCLASS.

CLASS ltcl_fb_hello_apab IMPLEMENTATION.
  METHOD rv_correct.
    cl_abap_unit_assert=>assert_equals(
      act = NEW zcl_fb_hello_abap( )->get_information( )
      exp = 'Hello ABAP!' ).
  ENDMETHOD.
ENDCLASS.
