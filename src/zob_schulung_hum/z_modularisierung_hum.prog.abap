*&---------------------------------------------------------------------*
*& Report Z_MODULARISIERUNG_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_modularisierung_hum.

INCLUDE z_modularisierung_hum_include.

*gv_global_include = p_incl.

PERFORM duplicate(z_modularisierung_hum) "Unterprogramm kann einfach in den Report gezogen werden
  USING p_zahl
  CHANGING gv_ergebnis.
WRITE gv_ergebnis.

CALL FUNCTION 'Z_FUNKTIONSBAUSTEIN_HUM'
 EXPORTING "optionale Parameter werden automatisch auskommentiert"
   IV_TEST       = 'Test'
  .


FORM duplicate USING iv_zahl CHANGING cv_ergebnis. "iv = import Variable CV= etwas kommt wieder raus
cv_ergebnis = 2 * iv_zahl.
ENDFORM.
