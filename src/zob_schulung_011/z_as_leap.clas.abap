CLASS z_as_leap DEFINITION PUBLIC.
PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS z_as_leap IMPLEMENTATION.

  METHOD leap.
if year mod 400 = 0. "Schaltjahr
  result = abap_true.
elseif year mod 100 = 0. "Kein Schaltjahr
  result = abap_false.
elseif year mod 4 = 0. "Schaltjahr
  result = abap_true.
elseif year mod 100 = 0 and year mod 4 = 0. "Kein Schaltjahr
  result = abap_false.
elseif year mod 100 = 0 and year mod 4 = 0 and year mod 400 = 0. "Schaltjahr
  result = abap_true.
endif.
  ENDMETHOD.


ENDCLASS.

