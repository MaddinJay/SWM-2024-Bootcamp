CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE  REF TO zcl_hum_mapping.
    METHODS:
      setup,                              "Setup Methode, instanziierung erfolgt im Setup, DATA muss deklariert werden
      test_map_gender_1_to_F FOR TESTING, "raising cx_static_check --> Exception raising.
      test_map_gender_2_to_M FOR TESTING,
      test_map_gender_3_to_D FOR TESTING,
      test_map_language_D_to_de FOR TESTING,
      test_map_language_E_to_en FOR TESTING,
      test_map_language_F_to_fr FOR TESTING.
ENDCLASS.


CLASS ltcl_mapping IMPLEMENTATION.
  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD test_map_gender_1_to_F.

    DATA(lv_gender) = mo_cut->map_gender( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll F gemappt werden.'
                                        exp = 'F'          "erwarteter Wert
                                        act = lv_gender ). "tatsächlicher Wert
  ENDMETHOD.

  METHOD test_map_gender_2_to_m.

    DATA(lv_gender) = mo_cut->map_gender( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll M gemappt werden.'
                                        exp = 'M'          "erwarteter Wert
                                        act = lv_gender ). "tatsächlicher Wert
  ENDMETHOD.


  METHOD test_map_gender_3_to_d.

    DATA(lv_gender) = mo_cut->map_gender( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll D gemappt werden.'
                                        exp = 'D'   "erwarteter Wert
                                        act = lv_gender ). "tatsächlicher Wert
  ENDMETHOD.



  METHOD test_map_language_d_to_de.
    DATA(lv_language) = mo_cut->map_lanuage( 'D' ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für D soll de gemappt werden.'
                                        exp = 'de'
                                        act = lv_language ).
  ENDMETHOD.

  METHOD test_map_language_e_to_en.
    DATA(lv_language) = mo_cut->map_lanuage( 'E' ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für E soll en gemappt werden.'
                                        exp = 'en'
                                        act = lv_language ).
  ENDMETHOD.

  METHOD test_map_language_f_to_fr.
    DATA(lv_language) = mo_cut->map_lanuage( 'F' ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für F soll fr gemappt werden.'
                                        exp = 'fr'
                                        act = lv_language ).
  ENDMETHOD.

ENDCLASS.
