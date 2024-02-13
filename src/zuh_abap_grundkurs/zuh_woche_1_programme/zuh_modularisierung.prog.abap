
*&---------------------------------------------------------------------*
*& Report ZUH_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_modularisierung.

INCLUDE zuh_modularisierung_include.

*gv_global_include = p_incl.

PERFORM duplicate(zuh_modularisierung)
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.

CALL FUNCTION 'Z_UH_TESTFUBA'
  EXPORTING
    iv_test = 'Test'.


FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
