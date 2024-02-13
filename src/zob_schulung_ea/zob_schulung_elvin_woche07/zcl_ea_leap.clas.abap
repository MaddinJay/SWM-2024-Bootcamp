CLASS zcl_ea_leap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
 METHODS leap
      IMPORTING
        year        TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_ea_leap IMPLEMENTATION.

 METHOD leap.

IF year MOD 400 = 0.
    result = abap_true.
    WRITE |Das Jahr { year } ist ein Schaltjahr|.
ELSEIF year MOD 100 = 0.
    result = abap_false.
    WRITE |Das Jahr { year } ist kein Schaltjahr|.
ELSEIF year MOD 4 = 0.
    result = abap_true.
    WRITE |Das jahr { year } ist ein Schaltjahr|.
ELSE.
    WRITE |Das Jahr { year } ist kein Schaltjahr|.
ENDIF.


 ENDMETHOD.

ENDCLASS.
