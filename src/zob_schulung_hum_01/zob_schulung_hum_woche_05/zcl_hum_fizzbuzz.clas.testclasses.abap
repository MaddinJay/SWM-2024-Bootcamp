CLASS ltcl_hum_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
**********************************************************************
*Testfälle für Methode convert_number
**********************************************************************
      for_1_return_1 FOR TESTING,
      for_2_return_2 FOR TESTING,
      for_3_return_fizz FOR TESTING,
      for_5_return_buzz FOR TESTING,
      for_15_return_fizzbuzz FOR TESTING,
      for_6_return_fizz FOR TESTING,
      for_10_return_buzz FOR TESTING,
      for_30_return_fizzbuzz FOR TESTING,
      for_31_return_fizz FOR TESTING,
      for_58_return_buzz FOR TESTING,
      for_53_return_buzzfizz FOR TESTING,
      for_35_return_buzz FOR TESTING,
**********************************************************************
*Testfälle für Methode convert
**********************************************************************
      for_1_to_1_return_1 FOR TESTING,
      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      for_1_to_3_return_list FOR TESTING.

ENDCLASS.


CLASS ltcl_hum_fizzbuzz IMPLEMENTATION.

**********************************************************************
*Testfälle für Methode convert_number
**********************************************************************

  METHOD for_1_return_1.
    DATA cut  TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(   ).
    DATA(result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 zurückgegeben werden.'
                                        exp = '1'
                                        act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(   ).
    DATA(result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll 2 zurückgegeben werden.'
                                        exp = 2
                                        act = result ).
  ENDMETHOD.

  METHOD for_3_return_fizz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll Fizz zurückgegeben werden' exp = 'FIZZ' act = result ).
  ENDMETHOD.

  METHOD for_5_return_buzz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 5 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 soll Buzz zurückgegeben werden' exp = 'BUZZ' act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 15 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 soll Fizzbuzz zurückgegeben werden' exp = 'FIZZBUZZ' act = result ).
  ENDMETHOD.

  METHOD for_6_return_fizz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 6 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 soll Fizz' exp = 'FIZZ' act = result ).
  ENDMETHOD.

  METHOD for_10_return_buzz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 10 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 soll Buzz ausgegeben werden' exp = 'BUZZ' act = result ).
  ENDMETHOD.

  METHOD for_30_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 30 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 soll FIZZBUZZ ausgegeben werden' exp = 'FIZZBUZZ' act = result ).
  ENDMETHOD.

  METHOD for_31_return_fizz.
    DATA Cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 31 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 31 soll FIZZ ausgegeben werden' exp = 'FIZZ' act = result ).
  ENDMETHOD.

  METHOD for_58_return_buzz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 58 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 58 soll Buzz ausgegeben werden' exp = 'BUZZ' act = result ).
  ENDMETHOD.

  METHOD for_53_return_buzzfizz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 53 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 53 soll Buzz ausgegeben werden' exp = 'BUZZFIZZ' act = result ).
  ENDMETHOD.

  METHOD for_35_return_buzz.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 35 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 35 soll Buzz ausgegeben werden' exp = 'BUZZ' act = result ).
  ENDMETHOD.

**********************************************************************
*Testfälle für Methode convert
**********************************************************************

  METHOD for_1_to_1_return_1.

    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA lt_expected TYPE zcl_hum_fizzbuzz=>tt_list.
    lt_expected = VALUE #( ( number = 1 converted_number ='1' ) ).

    DATA(lt_actual) = cut->convert( 1 ).
    cl_abap_unit_assert=>assert_equals( exp = lt_expected
                                        act = lt_actual ).

  ENDMETHOD.

  METHOD for_1_to_1_return_list.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(lt_result) = cut->convert( 1 ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_hum_fizzbuzz=>tt_list( ( number = 1 converted_number ='1' ) )
                                                                                act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(lt_result) = cut->convert( 2 ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_hum_fizzbuzz=>tt_list( ( number = 1 converted_number ='1' )
                                                                                ( number = 2 converted_number = '2' ) )
                                                                                act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_3_return_list.
    DATA cut TYPE REF TO zcl_hum_fizzbuzz.
    cut = NEW #(  ).
    DATA(lt_result) = cut->convert( 3 ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_hum_fizzbuzz=>tt_list( ( number = 1 converted_number ='1' )
                                                                                ( number = 2 converted_number = '2' )
                                                                                ( number = 3 converted_number = 'FIZZ' ) )
                                                                                act = lt_result ).
  ENDMETHOD.


ENDCLASS.
