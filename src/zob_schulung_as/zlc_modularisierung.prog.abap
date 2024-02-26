*&---------------------------------------------------------------------*
*& Report ZLC_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_modularisierung.

INCLUDE zlc_modularisierung_include.

PERFORM duplicate(zlc_modularisierung) "Perform greift auf FORM duplicate zu und benutzt INCLUDE zlc_modularisierung_include
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.

CALL FUNCTION 'Z_LC_TESTFUBA'.
* EXPORTING
*   IV_TEST       = 'TEST'.



FORM duplicate USING iv_zahl CHANGING cv_ergebnis. "iv = importing variable, duplicate verdoppelt iv_zahl und gbit das Ergebnis
                                                   "in cv_ergebnis aus
  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
