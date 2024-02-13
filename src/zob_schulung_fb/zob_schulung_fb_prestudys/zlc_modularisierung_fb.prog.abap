*&---------------------------------------------------------------------*
*& Report ZLC_MODULARISIERUNG_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLC_MODULARISIERUNG_FB.

INCLUDE ZLC_MODULARISIERUNG_FB_INCLUDE.

PERFORM duplicate(zlc_modularisierung_fb)
  USING p_zahl
  CHANGING gv_ergebnis.

WRITE gv_ergebnis.

CALL FUNCTION 'Z_FB_TESTFUBA'
 EXPORTING
   IV_TEST       = 'Test'.

FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
