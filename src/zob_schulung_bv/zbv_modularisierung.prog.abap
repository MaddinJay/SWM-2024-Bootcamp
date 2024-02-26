*&---------------------------------------------------------------------*
*& Report ZBV_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBV_MODULARISIERUNG.

INCLUDE ZBV_MODULARISIERUNG_INCLUDE.

*gv_global_include = p_incl.

PERFORM duplicate(zbv_modularisierung)
         USING
          p_zahl
        CHANGING
          gv_ergebnis.

WRITE gv_ergebnis.

CALL FUNCTION 'Z_BV_TESTFUBA'
 EXPORTING
   IV_TEST       = 'Test'
  .


FORM duplicate USING iv_zahl CHANGING cv_ergebnis.

  cv_ergebnis = 2 * iv_zahl.

ENDFORM.
