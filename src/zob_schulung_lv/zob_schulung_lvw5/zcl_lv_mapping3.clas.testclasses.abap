CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_lv_mapping3.
    METHODS:
      setup,
      test_map_gender_1_to_f FOR TESTING,
      test_map_gender_2_to_m FOR TESTING,
      test_map_gender_3_to_d FOR TESTING,
      test_map_language_D_to_de FOR TESTING,
      test_map_language_E_to_en FOR TESTING,
      test_map_language_F_to_en FOR TESTING.
ENDCLASS.


CLASS ltcl_mapping IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #(  ).
  ENDMETHOD.

  METHOD test_map_gender_1_to_f.

    DATA(lv_gender) = mo_cut->map_gender( 1 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 1 soll F rauskommen.'
                                        exp = 'F' "expectet: erwartetes ergebnis
                                        act = lv_gender ).
  ENDMETHOD.

  METHOD test_map_gender_2_to_m.

    DATA(lv_gender) = mo_cut->map_gender( 2 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 2 soll M rauskommen.'
                                        exp = 'M' "expectet: erwartetes ergebnis
                                        act = lv_gender ).
  ENDMETHOD.

  METHOD test_map_gender_3_to_d.


    DATA(lv_gender) = mo_cut->map_gender( 3 ).
    cl_abap_unit_assert=>assert_equals( msg = 'für 3 soll D rauskommen.'
                                        exp = 'D'
                                        act = lv_gender ). "actual value parameter
  ENDMETHOD.




  METHOD test_map_language_d_to_de.
    DATA(lv_language) = mo_cut->map_language( 'D' ). "class/component under test
    cl_abap_unit_assert=>assert_equals( msg = 'für D soll DE rauskommen'
                                                             exp = 'de'
                                                             act = lv_language ).
  ENDMETHOD.

  METHOD test_map_language_e_to_en.
    DATA(lv_language) = mo_cut->map_language( 'E' ).
    cl_abap_unit_assert=>assert_equals( msg = 'für E soll en rauskommen'
                                        exp = 'en'
                                        act = lv_language ).



  ENDMETHOD.

  METHOD test_map_language_f_to_en.
    DATA(lv_language) = mo_cut->map_language( 'F' ).
    cl_abap_unit_assert=>assert_equals( msg = 'für F soll fr rauskommen'
                                        exp = 'fr'
                                        act = lv_language ).
  ENDMETHOD.

ENDCLASS."* use this source file for your ABAP unit test classes
