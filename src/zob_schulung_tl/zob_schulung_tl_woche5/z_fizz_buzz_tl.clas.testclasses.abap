CLASS ltcl_fizzbuzz  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:

      for_1_return_1 FOR TESTING,
      for_2_return_2 FOR TESTING,
      for_3_return_fizz FOR TESTING,
      for_5_return_buzz FOR TESTING,
      for_15_return_fizzbuzz FOR TESTING,
      for_6_return_fizz FOR TESTING,
      for_10_return_buzz FOR TESTING,
      for_30_return_fizzbuzz FOR TESTING,
      "Neue Testfälle:
      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      for_1_to_3_return_list FOR TESTING.

ENDCLASS.


CLASS ltcl_fizzbuzz  IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 zurückgegeben werden.'
                                        exp = '1'
                                        act = result ).

  ENDMETHOD.

  METHOD for_2_return_2.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll 2 zurückgegeben werden.'
                                        exp = '2'
                                        act = result ).
  ENDMETHOD.

  METHOD for_3_return_fizz.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll Fizz ausgegeben werden'
                                        exp = 'Fizz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 soll FizzBuzz ausgegeben werden'
                                        exp = 'FizzBuzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_5_return_buzz.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 soll Buzz ausgegeben werden'
                                        exp = 'Buzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_10_return_buzz.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 10 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 soll Buzz ausgegeben werden'
                                        exp = 'Buzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_30_return_fizzbuzz.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 30 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 soll FizzBuzz ausgegeben werden'
                                        exp = 'FizzBuzz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_6_return_fizz.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).

    DATA(result) = cut->convert_number( 6 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 soll Fizz ausgegeben werden'
                                        exp = 'Fizz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_1_to_1_return_list.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).
    "Variante 1 schreiben
    DATA lt_expected TYPE z_fizz_buzz_tl=>tt_list.
    lt_expected = VALUE #( ( number = 1 converted_number = '1' ) ).

    DATA(lt_actual) = cut->convert( 1 ).

    cl_abap_unit_assert=>assert_equals(
                                        exp = lt_expected
                                        act = lt_actual ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).
    "Variante 2 schreiben:
    DATA(lt_result) = cut->convert( 2 ).
    cl_abap_unit_assert=>assert_equals(
                                           exp = VALUE z_fizz_buzz_tl=>tt_list( ( number = 1 converted_number = '1' )
                                                                               ( number = 2 converted_number = '2' ) )
                                                                                act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_3_return_list.

    DATA cut TYPE REF TO z_fizz_buzz_tl.
    cut = NEW #(  ).
    "Variante 2 schreiben:
    DATA(lt_result) = cut->convert( 3 ).
    cl_abap_unit_assert=>assert_equals(
                                           exp = VALUE z_fizz_buzz_tl=>tt_list( ( number = 1 converted_number = '1' )
                                                                               ( number = 2 converted_number = '2' )
                                                                               ( number = 3 converted_number = 'Fizz' ) )
                                                                                act = lt_result ).
  ENDMETHOD.

ENDCLASS.
