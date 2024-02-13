CLASS ztl_leap_year DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.



CLASS ztl_leap_year IMPLEMENTATION.
  METHOD leap.
* add solution here
    IF year MOD 400 EQ 0.
      result = abap_true.
      WRITE: 'Das Jahr', year, 'ist ein Schaltjahr'.
    ELSEIF year MOD 100 EQ 0.
      result = abap_false.
      WRITE: 'Das Jahr', year, 'ist kein Schaltjahr'.
    ELSEIF year MOD 4 EQ 0.
      result = abap_true.
      WRITE: 'Das Jahr', year, 'ist ein Schaltjahr'.
    ELSE.
      WRITE: 'Das Jahr', year, 'ist kein Schaltjahr'.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
