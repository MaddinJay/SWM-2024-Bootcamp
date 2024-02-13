CLASS zcl_bv_leap DEFINITION
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



CLASS zcl_bv_leap IMPLEMENTATION.

  METHOD leap.
    IF year MOD 400 = 0. "druch 400 teilbar -> Schlatjahr
      result = abap_true.
    ELSEIF year MOD 100 = 0. "durch 100 teilbar -> kein Schaltjahr
      result = abap_false.
    ELSEIF year MOD 4 = 0.    "durch 4 teilbar -> Schaltjahr
      result = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
