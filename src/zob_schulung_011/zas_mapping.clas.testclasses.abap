*"* use this source file for your ABAP unit test classes
CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zas_mapping. "Component under Test = CUT

    METHODS: setup.
    METHODS: test_map_gender_1_to_F FOR TESTING.
    METHODS: test_map_gender_2_to_m FOR TESTING.
    METHODS: test_map_gender_3_to_d FOR TESTING.

    METHODS: test_map_language_D_to_de FOR TESTING,
      test_map_language_E_to_en FOR TESTING,
      test_map_language_F_to_fr FOR TESTING.

      endclass.


    CLASS ltcl_mapping IMPLEMENTATION.

    METHOD setup.
      mo_cut = NEW #( ).
    ENDMETHOD.

    METHOD test_map_gender_1_to_f.
      DATA(lv_gender) = mo_cut->map_gender( 1 ).

      cl_abap_unit_assert=>assert_equals(
      msg = 'Für 1 soll F gemappt werden!'
      exp = 'F'
      act = lv_gender ).
    ENDMETHOD.

    METHOD test_map_gender_2_to_m.
      DATA(lv_gender) = mo_cut->map_gender( 2 ).

      cl_abap_unit_assert=>assert_equals(
      msg = 'Für 2 soll M gemappt werden!'
      exp = 'M'
      act = lv_gender ).
    ENDMETHOD.

    METHOD test_map_gender_3_to_d.
      DATA(lv_gender) = mo_cut->map_gender( 3 ).

      cl_abap_unit_assert=>assert_equals(
      msg = 'Für 3 soll D gemappt werden!'
      exp = 'D'
      act = lv_gender ).
    ENDMETHOD.


  METHOD test_map_language_d_to_de.

  ENDMETHOD.

  METHOD test_map_language_e_to_en.

  ENDMETHOD.

  METHOD test_map_language_f_to_fr.

  ENDMETHOD.

ENDCLASS.
