CLASS ltcl_hum_exerc_hello_world DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PUBLIC SECTION.
    METHODS hello FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS ltcl_hum_exerc_hello_world IMPLEMENTATION.
  METHOD hello.
    cl_abap_unit_assert=>assert_equals(
      act = NEW zcl_hum_exerc_hello_world( )->hello( )
      exp = 'Hello, World!' ).
  ENDMETHOD.
ENDCLASS.
