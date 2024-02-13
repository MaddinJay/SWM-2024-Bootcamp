CLASS zaw_gcl_reverse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zaw_gcl_reverse IMPLEMENTATION.

  METHOD reverse_string.

*    DATA: length TYPE i.
*    DATA: offset TYPE i.
*
*    length = strlen( input ).
*
*    DO length TIMES.
*      offset = length - sy-index.
*      result = result && input+offset(1).
*    ENDDO.

*    result = input.
    result = reverse( input ).        "reverse - eingebaute ABAP-Funktion zum Umkehren eines Text-Strings

  ENDMETHOD.

ENDCLASS.
