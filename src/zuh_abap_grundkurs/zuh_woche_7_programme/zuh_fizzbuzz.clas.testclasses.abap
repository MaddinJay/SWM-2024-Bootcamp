CLASS ltcl_zuh_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_return_1 FOR TESTING,
      for_2_return_2 FOR TESTING,
      for_3_return_Fizz FOR TESTING,
      for_5_return_Buzz FOR TESTING,
      for_6_return_Fizz FOR TESTING,
      for_10_return_Buzz FOR TESTING,
      for_15_return_FizzBuzz FOR TESTING,
      for_30_return_FizzBuzz FOR TESTING,
      for_31_return_Fizz FOR TESTING,
      for_53_return_FizzBuzz FOR TESTING,
      for_58_return_Buzz FOR TESTING,
      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      for_1_to_3_return_list FOR TESTING.
ENDCLASS.


CLASS ltcl_zuh_fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 1 soll 1 ausgegeben werden'
    exp = 1 act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 2 soll 2 ausgegeben werden'
    exp = 2 act = result ).
  ENDMETHOD.

  METHOD for_3_return_Fizz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 3 soll Fizz ausgegeben werden'
    exp = 'Fizz' act = result ).
  ENDMETHOD.

  METHOD for_5_return_buzz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 5 soll Buzz ausgegeben werden'
    exp = 'Buzz' act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 15 soll FizzBuzz ausgegeben werden'
    exp = 'FizzBuzz' act = result ).
  ENDMETHOD.

  METHOD for_6_return_fizz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 6 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 6 soll Fizz ausgegeben werden'
    exp = 'Fizz' act = result ).
  ENDMETHOD.

  METHOD for_10_return_buzz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 10 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 10 soll Buzz ausgegeben werden'
    exp = 'Buzz' act = result ).
  ENDMETHOD.

  METHOD for_30_return_fizzbuzz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 30 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 30 soll FizzBuzz ausgegeben werden'
    exp = 'FizzBuzz' act = result ).
  ENDMETHOD.

  METHOD for_31_return_fizz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 31 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 31 soll Fizz ausgegeben werden'
    exp = 'Fizz' act = result ).
  ENDMETHOD.

  METHOD for_58_return_Buzz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 58 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 58 soll Buzz ausgegeben werden'
    exp = 'Buzz' act = result ).
  ENDMETHOD.

  METHOD for_53_return_fizzbuzz.
    DATA cut TYPE REF TO zuh_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 53 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Fuer 53 soll FizzBuzz ausgegeben werden'
    exp = 'FizzBuzz' act = result ).
  ENDMETHOD.

  METHOD for_1_to_1_return_list.
    DATA mo_cut TYPE REF TO zuh_fizzbuzz.
    mo_cut = NEW #( ).

    Data lt_expected Type zuh_fizzbuzz=>tt_list.

    lt_expected = Value #( ( number = 1 converted_number = '1') ).

    DATA(lt_result) = mo_cut->convert( 1 ).

   cl_abap_unit_assert=>assert_equals( exp = VALUE zuh_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' ) )
                                       act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
*    DATA mo_cut TYPE REF TO zuh_fizzbuzz.
*    mo_cut = NEW #( ).
*
*    DATA(lt_result) = mo_cut->convert( 2 ).
*
*   cl_abap_unit_assert=>assert_equals( exp = VALUE zuh_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
*                                                                          ( number = 2 converted_number = '2' ) )
*                                       act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_3_return_list.
*    DATA mo_cut TYPE REF TO zuh_fizzbuzz.
*    mo_cut = NEW #( ).
*
*    DATA(lt_result) = mo_cut->convert( 3 ).
*
*   cl_abap_unit_assert=>assert_equals( exp = VALUE zuh_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
*                                                                          ( number = 2 converted_number = '2' )
*                                                                          ( number = 3 converted_number = 'Fizz' ) )
*                                       act = lt_result ).
  ENDMETHOD.

ENDCLASS.
