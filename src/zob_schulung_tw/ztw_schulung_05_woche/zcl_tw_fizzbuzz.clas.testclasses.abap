CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for1retunr1 FOR TESTING,
      for1retunr2 FOR TESTING,
      for1retunr3 FOR TESTING,
      for1retunr5 FOR TESTING,
      for1retunr15 FOR TESTING,
      for1retunr6 FOR TESTING,
      for1retunr10 FOR TESTING,
      for1retunr30 FOR TESTING.

ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for1retunr1.
    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 ausgeggeben werden'
                                        exp = '1'
                                        act = result ).
  ENDMETHOD.

  METHOD for1retunr2.

    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll 2 ausgeggeben werden'
                                        exp = '2'
                                        act = result ).

  ENDMETHOD.

  METHOD for1retunr3.

    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll Fizz ausgeggeben werden'
                                        exp = '3'
                                        act = result ).
  ENDMETHOD.


  METHOD for1retunr15.

    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 soll FizzBuzz ausgeggeben werden'
                                        exp = '15'
                                        act = result ).
  ENDMETHOD.


  METHOD for1retunr5.

    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 soll Buzz ausgeggeben werden'
                                        exp = '5'
                                        act = result ).
  ENDMETHOD.


  METHOD for1retunr6.

    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 6 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 soll 6 ausgeggeben werden'
                                        exp = '6'
                                        act = result ).
  ENDMETHOD.


  METHOD for1retunr10.

    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 10 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 soll 10 ausgeggeben werden'
                                        exp = '10'
                                        act = result ).
  ENDMETHOD.


  METHOD for1retunr30.
    DATA cut TYPE REF TO zcl_tw_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 30 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 soll 30 ausgeggeben werden'
                                        exp = '30'
                                        act = result ).
  ENDMETHOD.

ENDCLASS.
