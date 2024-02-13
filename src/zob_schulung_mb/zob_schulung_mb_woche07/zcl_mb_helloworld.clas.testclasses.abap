CLASS ltcl_mb_helloworld DEFINITION FINAL FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:first_test FOR TESTING.
ENDCLASS.

CLASS ltcl_mb_helloworld IMPLEMENTATION.

  METHOD first_test.


  DATA mo_hello type ref to zcl_mb_helloworld.
  mo_hello = NEW #( ).
  DATA(lv_text) = mo_hello->hello( ).



cl_abap_unit_assert=>assert_equals(
exp = 'Hello, World!'
act = 'Hello, World!'
 ).


  ENDMETHOD.

ENDCLASS.
