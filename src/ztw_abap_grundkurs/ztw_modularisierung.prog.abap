*&---------------------------------------------------------------------*
*& Report ZTW_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTW_MODULARISIERUNG.

INCLUDE ZTW_MODULARISIERUNG_INCLUDE.

*gv_global_include = p_incl.

PERFORM duplicate(ztw_modularisierung)
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.

FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

cv_ergebnis = 2 * iv_zahl.

ENDFORM.
