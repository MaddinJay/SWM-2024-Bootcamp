*"* use this source file for your ABAP unit test classes
CLASS ltcl_LV_mapping DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_map_gender_1_to_F FOR TESTING.
ENDCLASS.


CLASS ltcl_LV_mapping IMPLEMENTATION.

  METHOD test_map_gender_1_to_F.
    Data mo_cut TYPE REF TO zcl_LV_mapping.  " cut = Component Under Test
    mo_cut = NEW #( ).
    Data(lv_gender) = mo_cut->map_gender( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'Für 1 soll F gemappt werden.'
                                        exp = 'F'
                                        act = lv_gender ).


  ENDMETHOD.

ENDCLASS.
