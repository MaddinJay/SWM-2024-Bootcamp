*&---------------------------------------------------------------------*
*& Report zas_phone_numer
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_phone_numer.

CLASS zcl_phone_number DEFINITION
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.
  METHOD clean.
 result = number.
IF result CA '(' OR result CA ')' OR result CA '-' OR result CA '.'.
  REPLACE '(' IN result WITH ''.
  REPLACE ')' IN result WITH ''.
  REPLACE '-' IN result WITH ''.
  REPLACE ALL OCCURRENCES OF '.' IN result WITH ''.
  write result.
ENDIF.

  IF strlen( result ) < 10.
     RAISE EXCEPTION TYPE cx_parameter_invalid.
  ENDIF.

  IF strlen( result ) > 10 and result(1) <> 1.
     RAISE EXCEPTION TYPE cx_parameter_invalid.
  ENDIF.


CONDENSE result NO-GAPS.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
PARAMETERS p_result type string.

DATA(go_phone_number) = NEW zcl_phone_number( ).

go_phone_number->clean( number = p_result ).
