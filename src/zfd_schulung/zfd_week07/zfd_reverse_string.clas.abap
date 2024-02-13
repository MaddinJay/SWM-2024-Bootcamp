CLASS zfd_reverse_string DEFINITION
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

CLASS zfd_reverse_string IMPLEMENTATION.
  METHOD reverse_string.
*******************************
* Lösung mit SHIFT, CONCATENATE + DO
*******************************
*    Data(mv_input2) = input.
*    DO.
*      IF mv_input2 IS INITIAL.
*        EXIT.
*      ENDIF.
*      CONCATENATE mv_input2(1) result INTO result.
*      SHIFT mv_input2.
*    ENDDO.

*******************************
* Lösung mit reverse
*******************************
*    result = reverse( input ).

*******************************
* Lösung mit OFFSET.
*******************************

    DATA: num_of_char_input TYPE i.
    DATA: offset TYPE i.
    num_of_char_input = strlen( input ).
    DO num_of_char_input TIMES.
      offset = num_of_char_input - sy-index. " Sy-index = aktueller Schleifendurchlauf
      result = result && input+offset(1). "
    ENDDO.

  ENDMETHOD.
ENDCLASS.
