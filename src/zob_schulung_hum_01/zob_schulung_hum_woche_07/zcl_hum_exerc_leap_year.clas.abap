CLASS zcl_hum_exerc_leap_year DEFINITION
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



CLASS zcl_hum_exerc_leap_year IMPLEMENTATION.
  METHOD leap.
    IF year MOD 400 EQ 0 .
      result = abap_true.
    ELSEIF year MOD 100 EQ 0.
      result = abap_false.
    ELSEIF year MOD 4 EQ 0.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
