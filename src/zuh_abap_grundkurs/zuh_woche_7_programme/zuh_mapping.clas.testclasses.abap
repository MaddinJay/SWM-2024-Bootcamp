CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
   DATA mo_cut TYPE REF TO zuh_mapping.
    METHODS:
      setup,
      test_map_gender_1_to_f FOR TESTING,
      test_map_gender_2_to_m FOR TESTING,
      test_map_gender_3_to_d FOR TESTING,
      test_map_lanuage_d_to_de FOR TESTING,
      test_map_lanuage_e_to_en FOR TESTING,
      test_map_lanuage_f_to_fr FOR TESTING.

ENDCLASS.

CLASS ltcl_mapping IMPLEMENTATION.
  METHOD setup.

   mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD test_map_gender_1_to_f.

    DATA(lv_gender) = mo_cut->map_gender(  1  ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll F gemappt werden.'
    exp = 'F'
    act = lv_gender ).

  ENDMETHOD.

  METHOD test_map_gender_2_to_m.

    DATA(lv_gender) = mo_cut->map_gender(  2  ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll M gemappt werden.'
    exp = 'M'
    act = lv_gender ).

  ENDMETHOD.

  METHOD test_map_gender_3_to_d.

     DATA(lv_gender) = mo_cut->map_gender(  3  ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll D gemappt werden.'
    exp = 'D'
    act = lv_gender ).

  ENDMETHOD.

  METHOD test_map_lanuage_d_to_de.

   DATA(lv_lanuage) = mo_cut->map_lanuage(  'D'  ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für d soll de gemappt werden.'
    exp = 'de'
    act = lv_lanuage ).

  ENDMETHOD.

  METHOD test_map_lanuage_e_to_en.

DATA(lv_lanuage) = mo_cut->map_lanuage(  'E'  ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für e soll en gemappt werden.'
    exp = 'en'
    act = lv_lanuage ).

  ENDMETHOD.

  METHOD test_map_lanuage_f_to_fr.

  DATA(lv_lanuage) = mo_cut->map_lanuage(  'F'  ).
    cl_abap_unit_assert=>assert_equals( msg = 'Für f soll fr gemappt werden.'
    exp = 'fr'
    act = lv_lanuage ).

  ENDMETHOD.

ENDCLASS.
