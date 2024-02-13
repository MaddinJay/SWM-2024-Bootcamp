*&---------------------------------------------------------------------*
*& Report zfd_test_week07_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_test_week07_02.

*Data lv_string1 type string value 'Haus'.
*
*SHIFT lv_string1.
*
*Write lv_string1.
DATA lv_result TYPE string.
DATA(lo_pn) = NEW zfd_phone_number( ).

lo_pn->clean( EXPORTING number = '11+23v45@67 89'
              RECEIVING result = lv_result
*              EXCEPTIONS cx_parameter_invalid = 1
              ).

  IF sy-subrc <> 0.
    WRITE 'falsche Parameter eingetragen'.
    Exit.
  ENDIF.
WRITE lv_result.
