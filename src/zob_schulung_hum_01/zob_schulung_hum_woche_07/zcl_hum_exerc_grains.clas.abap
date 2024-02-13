CLASS zcl_hum_exerc_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES type_result TYPE decfloat34.
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



CLASS zcl_hum_exerc_grains IMPLEMENTATION.

  METHOD square.
    result = 2 ** ( input - 1 ).
    IF input < 1 OR input > 64.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.

  METHOD total.
  DATA lv_exponent Type i Value 0.
  Do 64 times.
  result = result + 2 ** lv_exponent.
  lv_exponent = lv_exponent + 1.
  Enddo.

  ENDMETHOD.

ENDCLASS.
