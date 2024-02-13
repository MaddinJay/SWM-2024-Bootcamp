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
      for_7_return_7 FOR TESTING,
      for_15_return_fizzbuzz FOR TESTING.
ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zod_lcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 1 ).
    cl_abap_unit_assert=>assert_equals(
     msg ='für 1 soll 1 ausgeben'
     exp = '1'
     act = result ).
  ENDMETHOD.
  METHOD for_2_return_2.
    DATA cut TYPE REF TO zod_lcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 2 ).
    cl_abap_unit_assert=>assert_equals(
     msg ='für 2 soll 2 ausgeben'
     exp = '2'
     act = result ).

  ENDMETHOD.

  METHOD for_3_return_fizz.
    DATA cut TYPE REF TO zod_lcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 3 ).
    cl_abap_unit_assert=>assert_equals(
    msg = 'fizz'
    exp = 'fizz'
    act = result ).
  ENDMETHOD.

  METHOD for_4_return_4.
DATA cut TYPE REF TO zod_lcl_fizzbuzz.
    cut = NEW #(  ).
    DATA(result) = cut->convert_number( 4 ).
    cl_abap_unit_assert=>assert_equals(
    msg = 'für 4 soll 4 ausgeben'
    exp = '4'
    act = result ).
  ENDMETHOD.
  METHOD for_5_return_buzz.
  data cut type ref to zod_lcl_fizzbuzz.
cut = New #(  ).
DATA(result) = cut->convert_number( 5 ).
cl_abap_unit_assert=>assert_equals(
    msg = 'Ausgabe buzz'
    exp = 'buzz'
    act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.

  data cut type ref to zod_lcl_fizzbuzz.
cut = New #(  ).
DATA(result) = cut->convert_number( 15 ).
cl_abap_unit_assert=>assert_equals(
    msg = 'Ausgabe fizzbuzz'
    exp = 'fizzbuzz'
    act = result ).

  ENDMETHOD.

  METHOD for_7_return_7.
data cut type ref to zod_lcl_fizzbuzz.
cut = New #(  ).
data(result) = cut->convert_number( 7 ).
cl_abap_unit_assert=>assert_equals(
    msg = 'erwartet 7'
     exp = 7
    act = result
).
  ENDMETHOD.

ENDCLASS.
