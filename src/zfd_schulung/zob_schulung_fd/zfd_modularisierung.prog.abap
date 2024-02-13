*&---------------------------------------------------------------------*
*& Report ZFD_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_modularisierung.

INCLUDE zfd_modularisierung_include. " Name egal kommt auf Verwendungszweck an.

*gv_global_include = p_incl.

PERFORM duplicate(zfd_modularisierung)
  USING p_zahl
  CHANGING gv_ergebnis.

Write gv_ergebnis.

CALL FUNCTION 'Z_FD_TESTFUBA'
  EXPORTING
    IV_TEST       = 'Test'
          .


FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
