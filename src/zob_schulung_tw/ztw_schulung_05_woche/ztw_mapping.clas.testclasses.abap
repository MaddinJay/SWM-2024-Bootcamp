CLASS ltcl_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_map_gender_1_to_F FOR TESTING,
      test_map_gender_1_to_m FOR TESTING,
      test_map_gender_1_to_d FOR TESTING.
      ENDCLASS.


CLASS ltcl_mapping IMPLEMENTATION.

  METHOD test_map_gender_1_to_F.
    DATA mo_cut TYPE REF TO ztw_mapping.

    mo_cut = NEW #(  ).
    DATA(lv_gender) = mo_cut->map_gender( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll F gemappt werden.'
                                        exp = 'F'
                                        act = lv_gender ).

  ENDMETHOD.


  METHOD test_map_gender_1_to_m.

     DATA mo_cut TYPE REF TO ztw_mapping.

    mo_cut = NEW #(  ).
    DATA(lv_gender) = mo_cut->map_gender( 2 ).

   cl_abap_unit_assert=>assert_equals( msg = 'Für 2 soll M gemappt werden.'
                                        exp = 'M'
                                        act = lv_gender ).


  ENDMETHOD.

  METHOD test_map_gender_1_to_d.

    DATA mo_cut TYPE REF TO ztw_mapping.

    mo_cut = NEW #(  ).
    DATA(lv_gender) = mo_cut->map_gender( 3 ).

   cl_abap_unit_assert=>assert_equals( msg = 'Für 3 soll D gemappt werden.'
                                        exp = 'D'
                                        act = lv_gender ).

  ENDMETHOD.

ENDCLASS.
