CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_return_1 FOR TESTING,
      for_2_return_2 FOR TESTING,
      for_3_return_3 FOR TESTING,
      for_5_return_5 FOR TESTING,
      for_15_return_fizzbuzz FOR TESTING,
      for_6_return_fizz FOR TESTING,
      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      for_1_to_3_return_list FOR TESTING.
ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zaw_gcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'for 1 return 1' exp = 1 act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zaw_gcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'for 2 return 2' exp = 2 act = result ).
  ENDMETHOD.

  METHOD for_3_return_3.
    DATA cut TYPE REF TO zaw_gcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'for 3 return fizz' exp = 'fizz' act = result ).
  ENDMETHOD.

  METHOD for_5_return_5.
    DATA cut TYPE REF TO zaw_gcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 5 ).
    cl_abap_unit_assert=>assert_equals( msg = 'for 5 return buzz' exp = 'buzz' act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.
    DATA cut TYPE REF TO zaw_gcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 15 ).
    cl_abap_unit_assert=>assert_equals( msg = 'for 15 return fizzbuzz' exp = 'fizzbuzz' act = result ).
  ENDMETHOD.

  METHOD for_6_return_fizz.
    DATA cut TYPE REF TO zaw_gcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 6 ).
    cl_abap_unit_assert=>assert_equals( msg = 'for 6 return fizz' exp = 'fizz' act = result ).
  ENDMETHOD.



  METHOD for_1_to_1_return_list.
    DATA mo_cut TYPE REF TO zaw_gcl_fizzbuzz.
    mo_cut = NEW #(  ).
    DATA(lt_result) = mo_cut->convert( 1 ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE zaw_gcl_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' ) )
                                        act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
    DATA mo_cut TYPE REF TO zaw_gcl_fizzbuzz.
    mo_cut = NEW #(  ).
    DATA(lt_result) = mo_cut->convert( 2 ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE zaw_gcl_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                               ( number = 2 converted_number = '2' ) )
                                        act = lt_result ).
  ENDMETHOD.
*
  METHOD for_1_to_3_return_list.
    DATA mo_cut TYPE REF TO zaw_gcl_fizzbuzz.
    mo_cut = NEW #(  ).
    DATA(lt_result) = mo_cut->convert( 3 ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE zaw_gcl_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                               ( number = 2 converted_number = '2' )
                                                                               ( number = 3 converted_number = '3' ) )
                                        act = lt_result ).
  ENDMETHOD.

ENDCLASS.
