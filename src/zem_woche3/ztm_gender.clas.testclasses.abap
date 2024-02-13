CLASS ltcl_gender DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA mo_gender TYPE REF TO ztm_gender.
    DATA mo_language TYPE REF TO ztm_gender.

    METHODS:
      setup,
      map_gender_1_to_F FOR TESTING RAISING cx_static_check,
      map_gender_2_to_M FOR TESTING RAISING cx_static_check,
      map_gender_3_to_D FOR TESTING RAISING cx_static_check,

      map_langu_D_to_DEU FOR TESTING,
      map_langu_E_to_ENG FOR TESTING,
      map_langu_F_to_FRA FOR TESTING.


ENDCLASS.


CLASS ltcl_gender IMPLEMENTATION.


  METHOD map_gender_1_to_f.

    DATA(lv_gender) = mo_gender->map_gender( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = '1 wird zu F' exp = 'F' act = lv_gender ).

  ENDMETHOD.

  METHOD map_gender_2_to_m.


    DATA(lv_gender) = mo_gender->map_gender( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = '2 wird zu M' exp = 'M' act = lv_gender ).


  ENDMETHOD.

  METHOD map_gender_3_to_d.

    DATA(lv_gender) = mo_gender->map_gender( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = '3 wird zu D' exp = 'D' act = lv_gender ).


  ENDMETHOD.

  METHOD setup.

    mo_gender = NEW #(  ).
    mo_language = NEW #(  ).

  ENDMETHOD.

  METHOD map_langu_d_to_deu.

    DATA(lv_language) = mo_language->map_language( 'D' ).

    cl_abap_unit_assert=>assert_equals( msg = 'D wird zu DE' exp = 'DE' act = lv_language ).

  ENDMETHOD.

  METHOD map_langu_e_to_eng.

    DATA(lv_language) = mo_language->map_language( 'E' ).

    cl_abap_unit_assert=>assert_equals( msg = 'E wird zu ENG' exp = 'EN' act = lv_language ).



  ENDMETHOD.

  METHOD map_langu_f_to_fra.


    DATA(lv_language) = mo_language->map_language( 'F' ).

    cl_abap_unit_assert=>assert_equals( msg = 'F wird zu FRA' exp = 'FR' act = lv_language ).

  ENDMETHOD.

ENDCLASS.
