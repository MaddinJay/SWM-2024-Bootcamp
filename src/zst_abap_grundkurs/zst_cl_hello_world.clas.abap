CLASS zst_cl_hello_world DEFINITION
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



CLASS zst_cl_hello_world IMPLEMENTATION.

  METHOD leap.
if year mod 4 = 0 and year mod 400 = 0.
  result = abap_true.
  elseif
  year mod 4 = 0 and year mod 100 = 0.
  result = abap_false.
  elseif
  year mod 4 = 0.
  result = abap_true.
  Else.
  result = abap_false.
endif.
  ENDMETHOD.

ENDCLASS.
