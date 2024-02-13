*&---------------------------------------------------------------------*
*& Report ZAW_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_modularisierung.

INCLUDE zaw_modularisierung_include. " Include benennen

PERFORM duplicate(zaw_modularisierung)
  USING
        p_zahl
  CHANGING
    gv_ergebnis.

WRITE gv_ergebnis.

CALL FUNCTION 'Z_AW_TESTFUBA' " Parameter wird automatisch auskommentiert, weil optional.
* EXPORTING
*   IV_TEST       =
  .

FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
