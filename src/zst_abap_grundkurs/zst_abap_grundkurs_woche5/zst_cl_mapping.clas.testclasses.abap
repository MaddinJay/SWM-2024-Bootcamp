CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zst_cl_mapping.
    DATA mo_cut2 TYPE REF TO zst_cl_mapping.

    METHODS:
    Setup,
      test_map_gender_1_to_f FOR TESTING,
      test_map_gender_2_to_m FOR TESTING,
      test_map_gender_3_to_d FOR TESTING,
      test_map_language_D_to_de FOR TESTING,
      test_map_language_e_to_en FOR TESTING,
      test_map_language_f_to_fr FOR TESTING.

ENDCLASS.


CLASS ltcl_mapping IMPLEMENTATION.

METHOD setup.
    mo_cut = NEW #(  ).
    mo_cut2 = NEW #(  ).
  ENDMETHOD.

  METHOD test_map_gender_1_to_f.
    DATA(lv_gender) = mo_cut->map_gender( 1 ).
    cl_abap_unit_assert=>assert_equals(  msg = 'Für 1 soll F gemappt werden' "Nachricht, wenn die Methode nicht funktioniert
                                         exp = 'F' "erwarteter Wert
                                         act = lv_gender ).

  ENDMETHOD.

  METHOD test_map_gender_2_to_m.
   DATA(lv_gender) = mo_cut->map_gender( 2 ).
    cl_abap_unit_assert=>assert_equals(  msg = 'Für 2 soll M gemappt werden' "Nachricht, wenn die Methode nicht funktioniert
                                         exp = 'M' "erwarteter Wert
                                         act = lv_gender ).
  ENDMETHOD.

  METHOD test_map_gender_3_to_d.
    DATA(lv_gender) = mo_cut->map_gender( 3 ).
    cl_abap_unit_assert=>assert_equals(  msg = 'Für 3 soll D gemappt werden' "Nachricht, wenn die Methode nicht funktioniert
                                         exp = 'D' "erwarteter Wert
                                         act = lv_gender ).
  ENDMETHOD.

  METHOD test_map_language_D_to_de.
 DATA(lv_language) = mo_cut2->map_language( 'D' ).
    cl_abap_unit_assert=>assert_equals(  msg = 'Für D soll de gemappt werden' "Nachricht, wenn die Methode nicht funktioniert
                                         exp = 'de' "erwarteter Wert
                                         act = lv_language ).
  ENDMETHOD.

  METHOD test_map_language_e_to_en.
 DATA(lv_language) = mo_cut2->map_language( 'E' ).
    cl_abap_unit_assert=>assert_equals(  msg = 'Für E soll en gemappt werden' "Nachricht, wenn die Methode nicht funktioniert
                                         exp = 'en' "erwarteter Wert
                                         act = lv_language ).
  ENDMETHOD.

  METHOD test_map_language_f_to_fr.
DATA(lv_language) = mo_cut2->map_language( 'F' ).
    cl_abap_unit_assert=>assert_equals(  msg = 'Für F soll fr gemappt werden' "Nachricht, wenn die Methode nicht funktioniert
                                         exp = 'fr' "erwarteter Wert
                                         act = lv_language ).
  ENDMETHOD.

ENDCLASS.
