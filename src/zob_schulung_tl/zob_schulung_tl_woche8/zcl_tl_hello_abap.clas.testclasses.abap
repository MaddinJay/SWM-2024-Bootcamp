CLASS ltcl_hello_abap DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_tl_hello_abap.

    METHODS:
      setup,
      return_value_is_correct FOR TESTING.


ENDCLASS.
CLASS ltcl_hello_abap IMPLEMENTATION.
  METHOD setup.

  cut = NEW #( ).

  ENDMETHOD.

  METHOD return_value_is_correct.

  DATA(lv_helloabap) = cut->get_information(  ).
  cl_abap_unit_assert=>assert_equals( msg = 'Hello ABAP! wird erwartet'
                                      exp = 'Hello ABAP!'
                                      act = lv_helloabap
                                                                         ).

  ENDMETHOD.



ENDCLASS.
