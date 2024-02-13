CLASS zuh_schaltjahr DEFINITION
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



CLASS zuh_schaltjahr IMPLEMENTATION.
  METHOD leap.
    IF year MOD 400 EQ 0.
      result = abap_true.
    ELSEIF year MOD 100 EQ 0.
      result = ''.
    ELSEIF year MOD 4 EQ 0.
      result = 'X'.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
