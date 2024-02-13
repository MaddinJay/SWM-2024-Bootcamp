CLASS ltcl_fizzbuzz_ DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for1return1 FOR TESTING RAISING cx_static_check,
      for2return2 FOR TESTING RAISING cx_static_check,
      for3returnfizz FOR TESTING RAISING cx_static_check,
      for5returnbuzz FOR TESTING RAISING cx_static_check,
      for15returnfizzbuzz FOR TESTING RAISING cx_static_check,
      for6returnfizz FOR TESTING RAISING cx_static_check,
      for10returnbuzz FOR TESTING RAISING cx_static_check,
      for30returnfizzbuzz FOR TESTING RAISING cx_static_check,
      for1toreturn1 FOR TESTING RAISING cx_static_check,
      for2toreturn2 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_fizzbuzz_ IMPLEMENTATION.

  METHOD for1return1.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 zurückgeben werden'
                                        exp = '1'
                                        act = result ).

  ENDMETHOD.

  METHOD for2return2.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll 2 zurückgegeben werden'
                                        exp = 2
                                        act = result ).
  ENDMETHOD.

  METHOD for3returnfizz.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll fizz zurückgegeben werden '
                                        exp = 'fizz'
                                        act = result ).
  ENDMETHOD.

  METHOD for5returnbuzz.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 soll buzz zurückgegeben werden '
                                        exp = 'buzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for15returnfizzbuzz.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 soll fizzbuzz zurückgegeben werden '
                                        exp = 'fizzbuzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for6returnfizz.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 6 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 soll fizz zurückgegeben werden '
                                        exp = 'fizz'
                                        act = result ).

  ENDMETHOD.

  METHOD for10returnbuzz.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 10 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 soll buzz zurückgegeben werden '
                                        exp = 'buzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for30returnfizzbuzz.

    DATA cut TYPE REF TO zfb_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 soll fizzbuzz zurückgegeben werden '
                                        exp = 'fizzbuzz'
                                        act = result ).

  ENDMETHOD.

  METHOD for1toreturn1.

    DATA mo_cut TYPE REF TO zfb_fizzbuzz.
    mo_cut = NEW #(  ).

    DATA lt_expected TYPE zfb_fizzbuzz=>tt_list.

    lt_expected = VALUE #( (  number = 1 converted_number = '1') ).

    DATA(lt_actual) = mo_cut->convert( 1 ).
*   DATA(lt_result) = mo_cut->convert( 1 ).

    cl_abap_unit_assert=>assert_equals( exp = lt_expected
                                        act = lt_actual ).

  ENDMETHOD.

  METHOD for2toreturn2.

      DATA mo_cut TYPE REF TO zfb_fizzbuzz.
    mo_cut = NEW #(  ).

    DATA(lt_result) = mo_cut->convert( 2 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zfb_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                           ( number = 2 converted_number = '2' ) )
                                        act = lt_result ).
  ENDMETHOD.

ENDCLASS.
