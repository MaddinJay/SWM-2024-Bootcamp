CLASS zfd_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES type_result TYPE p LENGTH 16 DECIMALS 0.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zfd_grains IMPLEMENTATION.
  METHOD square.
    IF input >= 1 AND input <= 64.
      result = 2 ** ( input - 1 ) .
    ELSE.
      RAISE EXCEPTION TYPE cx_parameter_invalid.

    ENDIF.

  ENDMETHOD.

  METHOD total.
* meine 1. Variante funktioniert in Excercism -> passed !
    result = me->square( 64 ).
    DATA mv_help TYPE type_result.
    mv_help =   result.

    WHILE mv_help > 1.
      result = result + mv_help / 2.
      mv_help = mv_help / 2.
    ENDWHILE.

* Variante 2
*    result = 2 ** 64.

* Variante 3 aus Excercism Solutions kopiert
*    DO 64 TIMES.
*      result += square( sy-index ).
*    ENDDO.

  ENDMETHOD.

ENDCLASS.



