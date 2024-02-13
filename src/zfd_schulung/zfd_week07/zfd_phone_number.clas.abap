CLASS zfd_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        number        TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zfd_phone_number IMPLEMENTATION.

  METHOD clean.
    DATA mv_number TYPE string.
    DATA mv_len_of_mv_number TYPE i.
    Data offset type i.

    mv_number = number.

    IF mv_number+0(1) = '1' .
      SHIFT mv_number.
    ELSEIF mv_number+0(2) = '+1'.
      SHIFT mv_number.
      SHIFT mv_number.
    elseif mv_number+0(1) = '0'.
      raise EXCEPTION type cx_parameter_invalid.
    ENDIF.

    mv_len_of_mv_number = strlen( mv_number ).

    WHILE mv_len_of_mv_number NE 0.

      offset = sy-index - 1.
      if mv_number+offset(1) = '1' or
         mv_number+offset(1) = '2' or
         mv_number+offset(1) = '3' or
         mv_number+offset(1) = '4' or
         mv_number+offset(1) = '5' or
         mv_number+offset(1) = '6' or
         mv_number+offset(1) = '7' or
         mv_number+offset(1) = '8' or
         mv_number+offset(1) = '9' or
         mv_number+offset(1) = '0'.

         result = result && mv_number+offset(1).

      endif.

      mv_len_of_mv_number = mv_len_of_mv_number - 1.
    ENDWHILE.

if strlen( result ) ne 10 or result+0(1) = 1 or result+0(1) = 0 or result+3(1) = 1 or result+3(1) = 0.
  raise EXCEPTION type  cx_parameter_invalid.
endif.

  ENDMETHOD.
ENDCLASS.
