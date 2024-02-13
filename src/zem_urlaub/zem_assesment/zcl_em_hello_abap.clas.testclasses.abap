*"* use this source file for your ABAP unit test classes
CLASS ltcl_ZCL_EM_HELLO_ABAP DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_em_hello_abap.

    METHODS:
      setup,
      test_get_information for TESTING,
      test_empty_string FOR TESTING,
      test_word FOR TESTING,
      test_capitalized_word FOR TESTING,
      test_sentence_with_punctuation FOR TESTING,
      test_palindrome FOR TESTING,
      test_even_sized_word FOR TESTING.

ENDCLASS.

CLASS ltcl_ZCL_EM_HELLO_ABAP IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_em_hello_abap( ).
  ENDMETHOD.

  METHOD test_get_information.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_information( )
      exp = 'HELLO ABAP' ).
  ENDMETHOD.


    METHOD test_capitalized_word.

  ENDMETHOD.

  METHOD test_empty_string.

  ENDMETHOD.

  METHOD test_even_sized_word.

  ENDMETHOD.

  METHOD test_palindrome.

  ENDMETHOD.

  METHOD test_sentence_with_punctuation.

  ENDMETHOD.

  METHOD test_word.

  ENDMETHOD.

Endclass.
