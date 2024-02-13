*"* use this source file for your ABAP unit test classes
CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zaw_gcl_mapping.    "Components under test
    METHODS:
      setup,
      map_gender_1_to_f FOR TESTING,
      map_gender_2_to_m FOR TESTING,
      map_gender_3_to_d FOR TESTING,
      map_langu_D_to_de FOR TESTING,
      map_langu_E_to_en FOR TESTING,
      map_langu_F_to_fr FOR TESTING.

ENDCLASS.


CLASS ltcl_mapping IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD map_gender_1_to_f.

    DATA(lv_gender) = mo_cut->map_gender( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = '1 soll in F gemappt werden.'
                                        exp = 'F'
                                        act = lv_gender ).

  ENDMETHOD.

  METHOD map_gender_2_to_m.

    DATA(lv_gender) = mo_cut->map_gender( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = '2 soll in M gemappt werden.'
                                        exp = 'M'
                                        act = lv_gender ).

  ENDMETHOD.

  METHOD map_gender_3_to_d.

    DATA(lv_gender) = mo_cut->map_gender( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = '3 soll in D gemappt werden.'
                                        exp = 'D'
                                        act = lv_gender ).

  ENDMETHOD.

  METHOD map_langu_d_to_de.

    DATA(lv_langu) = mo_cut->map_language( 'D' ).

    cl_abap_unit_assert=>assert_equals( msg = 'D soll in de gemappt werden.'
                                        exp = 'de'
                                        act = lv_langu ).
  ENDMETHOD.

  METHOD map_langu_e_to_en.

    DATA(lv_langu) = mo_cut->map_language( 'E' ).

    cl_abap_unit_assert=>assert_equals( msg = 'E soll in en gemappt werden.'
                                        exp = 'en'
                                         act = lv_langu ).

  ENDMETHOD.

  METHOD map_langu_f_to_fr.

    DATA(lv_langu) = mo_cut->map_language( 'F' ).

    cl_abap_unit_assert=>assert_equals( msg = 'F soll in fr gemappt werden.'
                                        exp = 'fr'
                                        act = lv_langu ).
  ENDMETHOD.

ENDCLASS.
