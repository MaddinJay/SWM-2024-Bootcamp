*"* use this source file for your ABAP unit test classes
class ltcl_mapping definition final for testing

DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_map_gender_1_to_F FOR TESTING,
      test_map_gender_2_to_m FOR TESTING,
      test_mop_gender_3_to_d FOR TESTING,
      test_map_langu_D_to_de FOR TESTING,
      test_map_langu_E_to_en FOR TESTING,
      test_mop_langu_F_to_fr FOR TESTING.
ENDCLASS.


CLASS ltcl_mapping IMPLEMENTATION.

  METHOD test_map_gender_1_to_f.
    DATA mo_cut TYPE REF TO zfb_mapping_tdd.

    mo_cut = NEW #( ).
    DATA(lv_gender) = mo_cut->map_gender( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll F gemappt werden.'
                                        exp = 'F'
                                        act = lv_gender ).
  ENDMETHOD.

  METHOD test_map_gender_2_to_m.
    DATA mo_cut TYPE REF TO zfb_mapping_tdd.

    mo_cut = NEW #( ).
    DATA(lv_gender) = mo_cut->map_gender( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll M gemappt werden.'
                                        exp = 'M'
                                        act = lv_gender ).
  ENDMETHOD.

  METHOD test_mop_gender_3_to_d.
    DATA mo_cut TYPE REF TO zfb_mapping_tdd.

    mo_cut = NEW #( ).
    DATA(lv_gender) = mo_cut->map_gender( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll D gemappt werden.'
                                        exp = 'D'
                                        act = lv_gender ).
  ENDMETHOD.

  METHOD test_map_langu_D_to_de.
      DATA mo_cut TYPE REF TO zfb_mapping_tdd.

    mo_cut = NEW #( ).
    DATA(lv_langu) = mo_cut->map_language( 'D' ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für D soll de gemappt werden.'
                                        exp = 'de'
                                        act = lv_langu ).

  ENDMETHOD.

  METHOD test_map_langu_E_to_en.
        DATA mo_cut TYPE REF TO zfb_mapping_tdd.

    mo_cut = NEW #( ).
    DATA(lv_langu) = mo_cut->map_language( 'E' ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für E soll en gemappt werden.'
                                        exp = 'en'
                                        act = lv_langu ).

  ENDMETHOD.

  METHOD test_mop_langu_F_to_fr.
        DATA mo_cut TYPE REF TO zfb_mapping_tdd.

    mo_cut = NEW #( ).
    DATA(lv_langu) = mo_cut->map_language( 'F' ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für F soll fr gemappt werden.'
                                        exp = 'fr'
                                        act = lv_langu ).

  ENDMETHOD.

ENDCLASS.
