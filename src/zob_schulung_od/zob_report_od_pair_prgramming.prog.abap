*&---------------------------------------------------------------------*
*& Report zob_report_od_pair_prgramming
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_pair_prgramming.
*DATA lv_zahlx TYPE i VALUE 0.
*
*WHILE lv_zahlx < 100.
*  lv_zahlx = lv_zahlx + 1.
*
*  IF lv_zahlx MOD 3 = 0 AND lv_zahlx MOD 5 = 0.
*    WRITE: /, 'FizzBuzz'.
*    CONTINUE.
*  ENDIF.
*
*  IF lv_zahlx MOD 3 = 0.
*    WRITE: /, 'Fizz'.
*    CONTINUE.
*  ENDIF.
*
*  IF lv_zahlx MOD 5 = 0.
*    WRITE: /,'Buzz'.
*    CONTINUE.
*  ELSE.
*
*    WRITE: /, lv_zahlx.
*  ENDIF.
**  lv_zahl = lv_zahl + 1.
*
*ENDWHILE.

DATA lv_zahl TYPE i VALUE 0.
DATA lv_zahl1 TYPE n length 2 VALUE 0.

DO 100 TIMES.
  lv_zahl = lv_zahl + 1.
  lv_zahl1 = lv_zahl1 + 1.

  IF lv_zahl MOD 3 = 0 AND lv_zahl MOD 5 = 0.
    WRITE: /, 'FizzBuzz'.
  ELSEIF lv_zahl MOD 3 = 0 .
    WRITE: /, 'Fizz'.
  ELSEIF  lv_zahl MOD 5 = 0.
    WRITE: /,'Buzz'.

  ELSE.
    IF lv_zahl1 CA '3'.
      WRITE: /, 'fizz enthält'.

    ELSEIF lv_zahl1 CA '5'.
      WRITE: /, 'buzz enthält'.

    ELSE.
      WRITE: /, lv_zahl.

    ENDIF.
  ENDIF.

ENDDO.
