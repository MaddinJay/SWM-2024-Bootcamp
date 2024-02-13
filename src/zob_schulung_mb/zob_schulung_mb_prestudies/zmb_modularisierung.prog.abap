*&---------------------------------------------------------------------*
*& Report ZMB_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_modularisierung.

INCLUDE ZMB_MODULARISIERUNG_Include.

*gv_global_include = p_incl.

PERFORM duplicate(zmb_modularisierung)
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.


CALL FUNCTION 'Z_MB_TESTFUBA'
EXPORTING
 IV_TEST       = 'Test'
  .


FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
