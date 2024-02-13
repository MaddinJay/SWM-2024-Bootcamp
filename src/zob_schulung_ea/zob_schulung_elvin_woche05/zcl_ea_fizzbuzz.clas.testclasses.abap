CLASS fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_return_1          FOR TESTING,
      for_2_return_2          FOR TESTING,
      for_3_return_FIZZ       FOR TESTING,
      for_5_return_BUZZ       FOR TESTING,
      for_15_Resturn_FIZZBUZZ FOR TESTING,
      for_6_return_FIZZ       FOR TESTING,
      for_10_return_BUZZ      FOR TESTING,
      for_30_RETURN_FIZZBUZZ  FOR TESTING.
ENDCLASS.


CLASS fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 Return 1'
                                         exp = '1'
                                         act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 Return 2'
                                        exp = '2'
                                        act = result ).
  ENDMETHOD.

  METHOD for_3_return_fizz.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 Result FIZZ'
                                        exp = 'FIZZ'
                                        act = result ).

  ENDMETHOD.

  METHOD for_5_return_buzz.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result) = cut->convert_number( 5 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 Return BUZZ'
                                        exp = 'BUZZ'
                                        act = result ).
  ENDMETHOD.

  METHOD for_15_resturn_fizzbuzz.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result)  = cut->convert_number( 15 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 Return FIZZBUZZ'
                                        exp = 'FIZZBUZZ'
                                        act = result ).
  ENDMETHOD.

  METHOD for_10_return_BUZZ.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result)  = cut->convert_number( 10 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 Return BUZZ'
                                        exp = 'BUZZ'
                                        act = result ).
  ENDMETHOD.

  METHOD for_30_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result)  = cut->convert_number( 30 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 Return FIZZBUZZ'
                                        exp = 'FIZZBUZZ'
                                        act = result ).
  ENDMETHOD.

  METHOD for_6_return_fizz.
    DATA cut TYPE REF TO zcl_ea_fizzbuzz.
    cut = NEW #( ).
    DATA(Result)  = cut->convert_number( 6 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 Return FIZZ'
                                        exp = 'FIZZ'
                                        act = result ).
  ENDMETHOD.

ENDCLASS.
