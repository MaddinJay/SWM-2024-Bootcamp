*&---------------------------------------------------------------------*
*& Report ZST_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_modularisierung.

INCLUDE zst_modularisierung_include.

*gv_global_include = P_incl.

PERFORM duplicate(zst_modularisierung)
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.

CALL FUNCTION 'Z_ST_TESTFUBA'
 EXPORTING
   IV_TEST       = 'Test'
  .


FORM duplicate using  iv_zahl CHANGING cv_ergebnis. "IV = importing Variable" / CV = Changing Variable

  cv_ergebnis = 2 * iv_zahl.

  Endform.
