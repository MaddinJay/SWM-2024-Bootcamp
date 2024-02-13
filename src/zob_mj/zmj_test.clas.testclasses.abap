CLASS ltcl_ DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      first_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_ IMPLEMENTATION.

  METHOD first_test.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).

  ENDMETHOD.

ENDCLASS.
