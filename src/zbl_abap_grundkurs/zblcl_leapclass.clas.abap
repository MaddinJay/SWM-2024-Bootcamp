CLASS zblcl_leapclass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zblcl_leapclass IMPLEMENTATION.
  METHOD leap.
    IF year MOD 4 = 0.
      result = abap_true.
      IF year MOD 100 = 0.
        result = abap_false.
        IF year MOD 400 = 0.
          result = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
