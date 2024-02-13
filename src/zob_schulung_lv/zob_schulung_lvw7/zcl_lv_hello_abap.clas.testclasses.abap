CLASS ltcl_hello_abap DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.
  PRIVATE SECTION.
    METHODS: return_value_is_correct FOR TESTING.
ENDCLASS.

CLASS ltcl_hello_abap IMPLEMENTATION.
  METHOD return_value_is_correct.
    DATA(lo_hello) = NEW zcl_lv_hello_abap( ).
    cl_abap_unit_assert=>assert_equals(
      act = lo_hello->get_information( )
      exp = 'Hello ABAP!' ).
  ENDMETHOD.
ENDCLASS.
