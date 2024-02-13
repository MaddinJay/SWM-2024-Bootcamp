CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO z_as_fizzbuzz.
    METHODS:
      setup,
      for1return1 FOR TESTING,
      for1to1returnlist FOR TESTING,
      for2to2returnlist FOR TESTING,
      for3to3returnlist FOR TESTING,


      for2return2 FOR TESTING,
      for3returnfizz FOR TESTING,
      for5returnbuzz FOR TESTING,
      for6returnfizz FOR TESTING,
      for10returnbuzz FOR TESTING,
      for15returnfizzbuzz FOR TESTING,
      for30returnfizzbuzz FOR TESTING.
ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD for1return1.
    DATA(result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 1 Return 1' exp = 1 act = result ).
  ENDMETHOD.

  METHOD for2return2.
    DATA(result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 2 Return 2' exp = 2 act = result ).
  ENDMETHOD.

  METHOD for3returnfizz.
    DATA(result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 3 Return Fizz' exp = 'fizz' act = result ).
  ENDMETHOD.

  METHOD for5returnbuzz.
    DATA(result) = cut->convert_number( 5 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 5 Return Buzz' exp = 'buzz' act = result ).
  ENDMETHOD.

  METHOD for6returnfizz.
    DATA(result) = cut->convert_number( 6 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 6 Return Fizz' exp = 'fizz' act = result ).
  ENDMETHOD.

  METHOD for10returnbuzz.
    DATA(result) = cut->convert_number( 10 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 10 Return Buzz' exp = 'buzz' act = result ).
  ENDMETHOD.

  METHOD for15returnfizzbuzz.
    DATA(result) = cut->convert_number( 15 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 15 Return Fizzbuzz' exp = 'fizzbuzz' act = result ).
  ENDMETHOD.

  METHOD for30returnfizzbuzz.
    DATA(result) = cut->convert_number( 30 ).
    cl_abap_unit_assert=>assert_equals( msg = 'For 30 Return Fizzbuzz' exp = 'fizzbuzz' act = result ).
  ENDMETHOD.

" Folie 36
"Das ist Alternative A
  METHOD for1to1returnlist.

    DATA lt_expected TYPE z_as_fizzbuzz=>tt_list.

    lt_expected = VALUE #( ( number = 1 converted_number = '1' ) ).

      DATA(lt_actual) = cut->convert( 1 ).

    cl_abap_unit_assert=>assert_equals( exp = lt_expected act = lt_actual ).
  ENDMETHOD.

"Das ist Alternative B
  METHOD for2to2returnlist.
    DATA lt_expected TYPE z_as_fizzbuzz=>tt_list.

    lt_expected = VALUE #( ( number = 1 converted_number = '1' ) ( number = 2 converted_number = '2' ) ).

      DATA(lt_actual) = cut->convert( 2 ).

    cl_abap_unit_assert=>assert_equals( exp = lt_expected act = lt_actual ).
  ENDMETHOD.

  METHOD for3to3returnlist.
DATA lt_expected TYPE z_as_fizzbuzz=>tt_list.

    lt_expected = VALUE #( ( number = 1 converted_number = '1' ) ( number = 2 converted_number = '2' ) ( number = 3 converted_number = 'Fizz' ) ).

      DATA(lt_actual) = cut->convert( 3 ).

    cl_abap_unit_assert=>assert_equals( exp = lt_expected act = lt_actual ).
  ENDMETHOD.

ENDCLASS.
