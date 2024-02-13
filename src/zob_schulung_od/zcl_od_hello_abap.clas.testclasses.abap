CLASS ltcl_hello_abap DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS test_hello_abap FOR TESTING.

ENDCLASS.

CLASS ltcl_hello_abap IMPLEMENTATION.

  METHOD test_hello_abap.
    DATA(lo_hello_abap) = NEW zcl_od_hello_abap( ).

    cl_abap_unit_assert=>assert_equals(
      ACT = lo_hello_abap->get_information( )
      EXP = 'Hello ABAP!'
    ).
  ENDMETHOD.

ENDCLASS.
