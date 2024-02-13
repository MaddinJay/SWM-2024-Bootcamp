*&---------------------------------------------------------------------*
*& Report ZOD_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_modularisierung.

INCLUDE zod_modularisierung_include.

*gv_global_include = p_incl.

PERFORM duplicate(zod_modularisierung)
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.

*CALL FUNCTION 'Z_OD_TESTFUBA'
* EXPORTING
*   IV_TEST       = 'Test'
*  .

FORM duplicate USING iv_zahl CHANGING cv_ergebnis. "iv importierte Variable / cv signalisiert etwas raus kommt und rausgeht.
  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
