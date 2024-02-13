CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_to_1_return_list FOR TESTING RAISING cx_static_check,
      for_1_to_2_return_list FOR TESTING RAISING cx_static_check,
      for_1_to_3_return_list FOR TESTING RAISING cx_static_check,
      for_1_return_1 FOR TESTING RAISING cx_static_check,
      for_2_return_2 FOR TESTING RAISING cx_static_check,
      for_3_return_fizz FOR TESTING RAISING cx_static_check,
      for_5_return_buzz FOR TESTING RAISING cx_static_check,
      for_15_return_fizzbuzz FOR TESTING RAISING cx_static_check,
      for_6_reutrn_fizz FOR TESTING RAISING cx_static_check,
      for_10_return_buzz FOR TESTING RAISING cx_static_check,
      for_30_return_fizzbuzz FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for_1_to_1_return_list.
    DATA mo_cut TYPE REF TO zcl_bv_fizzbuzz.
    mo_cut = NEW #( ).

    DATA lt_expected TYPE zcl_bv_fizzbuzz=>tt_list. "Tabelle deklariert und Typen von Tabelle aus Hauptklasse gegeben.

    lt_expected = VALUE #(  ( number = 1 converted_number = '1' ) ). "Den Spalten der Tabelle Werte zugewiesen

    DATA(lt_actual) = mo_cut->convert( 1 ).                                                                           "Bei Tabellen heißt dieser Import-Wert, dass 1 Zeilen erwartet werden
    cl_abap_unit_assert=>assert_equals( exp = lt_expected "Die zugewiesenen Werte werden erwartet im Test
                                        act = lt_actual ).

*    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_bv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' ) )
*                                        act = lt_result ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
    DATA mo_cut TYPE REF TO zcl_bv_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_actual) = mo_cut->convert( 2 ).                                                                           "Bei Tabellen heißt dieser Import-Wert, dass 2 Zeilen erwartet werden

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_bv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )   "Der Tabelle Werte zugewiesen, den der Test erwartet
                                                                              ( number = 2 converted_number = '2' ) )
                                        act = lt_actual ).
  ENDMETHOD.

  METHOD for_1_to_3_return_list.
    DATA mo_cut TYPE REF TO zcl_bv_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_actual) = mo_cut->convert( 3 ).                                                                            "Bei Tabellen heißt dieser Import-Wert, dass 3 Zeilen erwartet werden

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_bv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                              ( number = 2 converted_number = '2' )
                                                                              ( number = 3 converted_number = 'Fizz' ) )
                                        act = lt_actual ).
  ENDMETHOD.

  METHOD for_1_return_1.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 1 ). "Importwert für Methode aus der Hauptklasse wird in der Klammer angegeben.

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 ausgegeben werden'
                                        exp = '1'
                                        act = result ).
  ENDMETHOD.

  METHOD for_2_return_2.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll 2 ausgegeben werden'
                                        exp = '2'
                                        act = result ).
  ENDMETHOD.

  METHOD for_3_return_fizz.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll Fizz ausgegeben werden'
                                        exp = 'Fizz'
                                        act = result ).
  ENDMETHOD.


  METHOD for_5_return_buzz.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 5 soll Buzz ausgegeben werden'
                                        exp = 'Buzz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_15_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 15 soll FizzBuzz ausgegeben werden'
                                        exp = 'FizzBuzz'
                                        act = result
                                                      ).
  ENDMETHOD.


  METHOD for_6_reutrn_fizz.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 6 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 6 soll Fizz ausgegeben werden'
                                        exp = 'Fizz'
                                        act = result ).
  ENDMETHOD.


  METHOD for_10_return_buzz.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 10 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 10 soll Buzz ausgegeben werden'
                                        exp = 'Buzz'
                                        act = result ).
  ENDMETHOD.

  METHOD for_30_return_fizzbuzz.
    DATA cut TYPE REF TO zcl_bv_fizzbuzz.
    cut = NEW #( ).

    DATA(result) = cut->convert_number( 30 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 30 soll FizzBuzz ausgegeben werden'
                                        exp = 'FizzBuzz'
                                        act = result
                                                      ).
  ENDMETHOD.




ENDCLASS.
