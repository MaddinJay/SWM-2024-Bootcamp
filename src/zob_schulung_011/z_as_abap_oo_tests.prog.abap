*&---------------------------------------------------------------------*
*& Report z_as_abap_oo_tests
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_abap_oo_tests.

*&---------------------------------------------------------------------*
*& Report zuh_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

DATA lv_zahl(3) TYPE n.
PARAMETERS p_zaehl(3) TYPE n .

DO p_zaehl TIMES.

  lv_zahl = lv_zahl + 1.


  IF lv_zahl MOD 3 EQ 0 AND lv_zahl MOD 5 EQ 0.
    SHIFT lv_zahl LEFT DELETING LEADING '0'.
    WRITE: / lv_zahl, 'Fizzbuzz'.
    CONTINUE.
  ENDIF.

*  IF lv_zahl MOD 3 EQ 0 OR lv_zahl = '%3'.
  IF lv_zahl MOD 3 EQ 0 OR find( val = lv_zahl sub = '3' ) > 0. "lv_zahl = '%3'.
    SHIFT lv_zahl LEFT DELETING LEADING '0'.
    WRITE: / lv_zahl, 'Fizz'.
    CONTINUE.
  ENDIF.

  IF lv_zahl MOD 5 EQ 0 OR lv_zahl CA '5'.
    SHIFT lv_zahl LEFT DELETING LEADING '0'.
    WRITE: / lv_zahl, 'Buzz'.
    CONTINUE.
  ENDIF.
  SHIFT lv_zahl LEFT DELETING LEADING '0'.

  WRITE: / lv_zahl.

ENDDO.
