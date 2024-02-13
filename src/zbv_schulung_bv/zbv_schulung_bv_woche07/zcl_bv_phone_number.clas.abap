CLASS zcl_bv_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lv_result1 TYPE string,
          lv_result2 TYPE string,
          lv_result3 TYPE string.

ENDCLASS.



CLASS zcl_bv_phone_number IMPLEMENTATION.

  METHOD clean.

    result = !number.
    REPLACE ALL OCCURRENCES OF '-' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF '(' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF ')' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF '.' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF '+' IN result WITH ''.
    CONDENSE result NO-GAPS.                            "Sorgt dafür, dass keine Leerzeilen vorhanden sind.

    IF result(1) = '1'.
      result = result+1.
    ENDIF.

IF result co '0'.
*    REPLACE FIRST OCCURRENCE OF '0' IN result WITH ''.
    RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF ( NOT result CO '0123456789' ) OR ( strlen( result ) <> 10 ). "prüft, ob die Zahlen 0 bis 9 oder ob die Anzahl der Zahlen nicht 10 ist. CO steht für containsstrlen steht für Anzahl der Zeichen
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
