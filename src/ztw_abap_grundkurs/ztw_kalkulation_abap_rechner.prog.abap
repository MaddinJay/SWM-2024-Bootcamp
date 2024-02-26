*&---------------------------------------------------------------------*
*& Report ZTW_KALKULATION_ABAP_RECHNER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTW_KALKULATION_ABAP_RECHNER.

PARAMETERS p_oper1 TYPE i.
PARAMETERS p_oper2 TYPE i.
PARAMETERS p_operat TYPE CHAR1.

DATA lv_ergebnis TYPE i.

CALL FUNCTION 'Z_TW_FB_KALKULATION'
EXPORTING
  iv_op1 = p_oper1
  iv_op2 = p_oper2
  iv_op = p_operat
  IMPORTING
    ev_erg = lv_ergebnis
    EXCEPTIONS
      nulldivision = 1
      operator_ungueltig = 2.

IF sy-subrc = 0.
WRITE: 'Ergebnis: ', lv_ergebnis.
ENDIF.

IF sy-subrc = 1.
WRITE 'Durch 0 teilen is nich! :D'.
ENDIF.

IF sy-subrc = 2.
WRITE 'Operator ist ungültig!'.
ENDIF.
