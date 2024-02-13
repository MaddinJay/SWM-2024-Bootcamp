CLASS zcl_mb_leapyears DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_mb_leapyears IMPLEMENTATION.

  METHOD leap.

if year mod 400 = 0. " durch 400 teilbar --> Schaltjahr
result = abap_true.
elseif year Mod 100 = 0. "durch 100 teilbar --> kein Schaltjahr
elseif year Mod 4 = 0. "durch 4 teilbar -> Schaltjahr
result = abap_true.



Endif.

  ENDMETHOD.

ENDCLASS.
