CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      for_1_return_1 FOR TESTING,



      for_1_to_1_return_list FOR TESTING,
      for_1_to_2_return_list FOR TESTING,
      for_1_to_3_return_list FOR TESTING.
ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for_1_return_1.

    DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lv_result) = mo_cut->convert_number( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll 1 ausgegeben werden'
                                        exp = '1'
                                        act = lv_result ).
  ENDMETHOD.

  METHOD for_1_to_1_return_list.
    DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA lt_expected TYPE zcl_mj_fizzbuzz=>tt_list.

    lt_expected = VALUE #( ( number = 1 converted_number = '1' ) ).

    DATA(lt_actual) = mo_cut->convert( 1 ).

    cl_abap_unit_assert=>assert_equals( exp = lt_expected
                                        act = lt_actual ).
  ENDMETHOD.

  METHOD for_1_to_2_return_list.
    DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_result) = mo_cut->convert( 2 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_mj_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                              ( number = 2 converted_number = '2' ) )
                                        act = lt_result ).

  ENDMETHOD.

  METHOD for_1_to_3_return_list.
    DATA mo_cut TYPE REF TO zcl_mj_fizzbuzz.
    mo_cut = NEW #( ).

    DATA(lt_result) = mo_cut->convert( 3 ).

    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_mj_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' )
                                                                              ( number = 2 converted_number = '2' )
                                                                              ( number = 3 converted_number = 'Fizz' ) )
                                        act = lt_result ).

  ENDMETHOD.

ENDCLASS.
