CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_return_1 FOR TESTING,
      for_2_return_2 FOR TESTING,
      for_3_return_fizz FOR TESTING,
      for_4_return_4 FOR TESTING,
      for_5_return_buzz FOR TESTING,
      for_6_return_6 FOR TESTING,
      for_10_return_10 FOR TESTING,
      for_15_return_fizzbuzz FOR TESTING,
      fot_30_return_fizzbuzz FOR TESTING,
      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      fot_1_to_3_return_list FOR TESTING.

ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 1 soll 1 rauskommen'
                                        exp = '1'
                                        act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 2 soll 2 rauskommen'
                                        exp = '2'
                                        act = result ).
  ENDMETHOD.

  METHOD for_3_return_fizz.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 3 soll fizz rauskommen'
                                               exp = 'Fizz'
                                                act = result ).
  ENDMETHOD.

  METHOD for_4_return_4.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 4 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 4 soll 4 rauskommen'
                                                exp = '4'
                                                act = result ).
  ENDMETHOD.

  METHOD for_5_return_buzz.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 5 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 5 soll buzz rauskommen'
                                        exp = 'Buzz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_6_return_6.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 6 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 6 soll 6 rauskommen'
                                        exp = 'Fizz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_10_return_10.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 10 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 10 soll 10 rauskommen'
                                              exp = 'Buzz'
                                              act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 15 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 15 soll fizzbuzz rauskommen'
                                        exp = 'FizzBuzz'
                                         act = result ).
  ENDMETHOD.

  METHOD fot_30_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 30 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 30 soll fizzbuzz rauskommen'
                                        exp = 'FizzBuzz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(lt_result) = cut->convert( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 1 bis 2  soll lsite rauskommen'
                                              exp = VALUE zcl_lv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                                      ( number = 2 converted_number = '2') )
                                                                                      act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_1_return_list.
    DATA cut TYPE REF TO zcl_lv_fizzbuzz.
    cut = NEW #( ).
    DATA(lt_result) = cut->convert( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 1 bis 1 soll liste rauskommen'
                                        exp = VALUE zcl_lv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' ) )
                                        act = lt_result ).
  ENDMETHOD.

  METHOD fot_1_to_3_return_list.
    DATA mo_cut TYPE REF TO zcl_lv_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_result) = mo_cut->convert( 3 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_lv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                              ( number = 2 converted_number = '2' )
                                                                              ( number = 3 converted_number = 'Fizz' ) )
                                        act = lt_result ).

  ENDMETHOD.

ENDCLASS.
