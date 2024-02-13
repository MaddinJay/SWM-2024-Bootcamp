CLASS ltcl_mb_fizz_buzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for1return1 FOR TESTING,
      for1return2 FOR TESTING,
      for1return3 FOR TESTING,
      for1return5 FOR TESTING,
      for1return15 FOR TESTING,
      for1return6 FOR TESTING,
      for1return10 FOR TESTING,
      for1return30 FOR TESTING,

      for_1_to_1_return_list  for testing,
      for_2_to_2_return_list  for testing,
      for_3_to_3_return_list  for testing.

ENDCLASS.


CLASS ltcl_mb_fizz_buzz IMPLEMENTATION.

  METHOD for1return1.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 1 ). " die Zahl zieht er sich aus dem Importing Iv_number aus der global class

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 ausgegeben werden'
                                        exp = '1'
                                       act = result ).

  ENDMETHOD.



  METHOD for1return2.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll 2 ausgegeben werden'
                                          exp = '2'
                                         act = result ).

  ENDMETHOD.

  METHOD for1return3.

    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll Fizz ausgegeben werden'
                                          exp = 'Fizz'
                                         act = result ).

  ENDMETHOD.

  METHOD for1return5.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 soll Buzz ausgegeben werden'
                                          exp = 'Buzz'
                                         act = result ).
  ENDMETHOD.

  METHOD for1return15.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 soll FizzBuzz ausgegeben werden'
                                          exp = 'FizzBuzz'
                                         act = result ).
  ENDMETHOD.

  METHOD for1return6.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 6 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 soll Fizz ausgegeben werden'
                                          exp = 'Fizz'
                                         act = result ).


  ENDMETHOD.

  METHOD for1return10.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 10 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 soll Buzz ausgegeben werden'
                                            exp = 'Buzz'
                                                act = result ).

  ENDMETHOD.

  METHOD for1return30.
    DATA cut TYPE REF TO zcl_mb_fizz_buzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 30 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 soll FizzBuzz ausgegeben werden'
                                        exp = 'FizzBuzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_1_to_1_return_list.

DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_result) = mo_cut->convert( 1 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_mj_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' ) )
                                        act = lt_result ).


  ENDMETHOD.

METHOD for_2_to_2_return_list.

  DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_result) = mo_cut->convert( 2 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_mj_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                              ( number = 2 converted_number = '2' ) )
                                        act = lt_result ).

ENDMETHOD.

METHOD for_3_to_3_return_list.

DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_result) = mo_cut->convert( 3 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_mj_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                              ( number = 2 converted_number = '2' )
                                                                              ( number = 3 converted_number = 'Fizz' ) )
                                        act = lt_result ).

ENDMETHOD.

ENDCLASS.
