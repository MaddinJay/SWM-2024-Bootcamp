*&---------------------------------------------------------------------*
*& Report z_ob_fizzbuzz_eb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_fizzbuzz_eb.


*DO 100 TIMES.
*  IF sy-index MOD 3 = 0 AND sy-index MOD 5 = 0 .
*    WRITE: `FizzBuzz` .
*  ELSEIF sy-index MOD 3 = 0 .
*    WRITE: `Fizz` .
*  ELSEIF sy-index MOD 5 = 0 .
*    WRITE: `Buzz` .
*  ELSE .
*    WRITE: /  sy-index .
*  ENDIF.
*  WRITE: / `,` .
*ENDDO.

ULINE.

PARAMETERS p_zahl TYPE i.



  IF p_zahl MOD 3 = 0 AND p_zahl MOD 5 = 0 .
    WRITE: `FizzBuzz` .
  ELSEIF p_zahl MOD 3 = 0 .
    WRITE: `Fizz` .
  ELSEIF p_zahl MOD 5 = 0 .
    WRITE: `Buzz` .
  ELSE .
    WRITE: /  p_zahl .
  ENDIF.
