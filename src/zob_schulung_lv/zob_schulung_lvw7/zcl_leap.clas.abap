CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.
CLASS zcl_leap IMPLEMENTATION.
  METHOD leap.
    IF  year MOD 4 = 0 .
      IF year MOD 100 = 0.
        IF year MOD 400 = 0.
          result = abap_true.
        ELSE.
          result = abap_false.
        ENDIF.
      ELSE.
        result = abap_true.
      ENDIF.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
