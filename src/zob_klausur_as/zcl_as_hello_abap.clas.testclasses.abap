CLASS ltcl_helloabap DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut2 TYPE REF TO zcl_as_hello_abap.
    METHODS: setup,
      return_value_is_correct FOR TESTING.

ENDCLASS.

CLASS ltcl_helloabap IMPLEMENTATION.


  METHOD setup.
    mo_cut2 = NEW #( ).
  ENDMETHOD.

  METHOD return_value_is_correct.
    DATA(mo_cut) = mo_cut2->get_information( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Es soll Hello ABAP! ausgegeben werden.'
                                       exp = 'Hello ABAP!'
                                       act = mo_cut ).
  ENDMETHOD.


ENDCLASS.
