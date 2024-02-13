CLASS ltcl_zfd_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_return_1 FOR TESTING,
      for_2_return_2 FOR TESTING,
      for_3_return_fizz FOR TESTING,
      for_5_return_buzz FOR TESTING,
      for_6_return_fizz FOR TESTING,
      for_15_return_fizzbuzz FOR TESTING,
      for_30_return_fizzbuzz FOR TESTING,
      for_53_return_Legendary_53 FOR TESTING,
      for_32_return_fizz FOR TESTING,
      for_23_return_fizz FOR TESTING,
      for_56_return_buzz FOR TESTING,
      for_58_return_buzz FOR TESTING,
      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      for_1_to_3_return_list FOR TESTING.
ENDCLASS.


CLASS ltcl_zfd_fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #( ).
    DATA(result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 wird 1 erwartet' exp = '1' act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 wird 2 erwartet' exp = '2' act = result ).
  ENDMETHOD.

  METHOD for_3_return_fizz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 wird fizz erwartet' exp = 'fizz' act = result ).
  ENDMETHOD.

  METHOD for_5_return_buzz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 5 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 wird buzz erwartet' exp = 'buzz' act = result ).
  ENDMETHOD.

  METHOD for_6_return_fizz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 6 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 wird fizz erwartet' exp = 'fizz' act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 15 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 wird fizzbuzz erwartet' exp = 'fizzbuzz' act = result ).
  ENDMETHOD.


  METHOD for_30_return_fizzbuzz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 30 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 wird fizzbuzz erwartet' exp = 'fizzbuzz' act = result ).
  ENDMETHOD.

  METHOD for_1_to_1_return_list.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).

    DATA lt_expected TYPE zfd_fizzbuzz=>tt_list.

    lt_expected = VALUE #( ( number = 1 converted_number = '1' ) ).

    DATA(lt_actual) = cut->convert( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'text'
                                        exp = lt_expected
                                        act = lt_actual ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'text'
                                        exp = VALUE zfd_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                           ( number = 2 converted_number = '2' ) )
                                        act = result ).
  ENDMETHOD.

  METHOD for_1_to_3_return_list.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'text'
                                        exp = VALUE zfd_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                           ( number = 2 converted_number = '2' )
                                                                           ( number = 3 converted_number = 'fizz' ) )
                                        act = result ).
  ENDMETHOD.

  METHOD for_53_return_legendary_53.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 53 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 wird fizzbuzz erwartet'
                                        exp = 'Legendary 53'
                                        act = result ).
  ENDMETHOD.

  METHOD for_23_return_fizz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 23 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 23 wird fizz erwartet'
                                        exp = 'fizz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_32_return_fizz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 32 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 32 wird fizz erwartet'
                                        exp = 'fizz'
                                        act = result ).

  ENDMETHOD.

  METHOD for_56_return_buzz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 56 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 56 wird fizz erwartet'
                                        exp = 'buzz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_58_return_buzz.
    DATA cut TYPE REF TO zfd_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 58 ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 58 wird fizz erwartet'
                                        exp = 'buzz'
                                        act = result ).
  ENDMETHOD.

ENDCLASS.
