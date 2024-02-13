CLASS zaw_gc_exercism DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS leap IMPORTING year          TYPE i
                 RETURNING Value(result) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zaw_gc_exercism IMPLEMENTATION.

  METHOD leap.

    IF year MOD 4 = 0.
      IF year MOD 100 = 0 AND year MOD 400 <> 0.
        result = abap_false.
      ELSE.
        result = abap_true.
      ENDIF.
    ELSE.
      result = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
