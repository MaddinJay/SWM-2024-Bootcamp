*&---------------------------------------------------------------------*
*& Report ZST_KALKULATION_ABAP_GK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_kalkulation_abap_gk.

PARAMETERS: p_oper1  TYPE i,
            p_oper2  TYPE i,
            p_operat.

DATA lv_ergebnis TYPE i.

CALL FUNCTION 'Z_LC_FB_KALKULATION'
  EXPORTING
    iv_op1 = p_oper1
    iv_op2 = p_oper2
    iv_op  = p_operat.
* IMPORTING
*   EV_ERG =
* EXCEPTIONS
*   NULLDIVISION             = 1
*   OPARATOR_UNGUELTIG       = 2
*   OTHERS = 3


IF sy-subrc = 0.
WRITE: 'Ergebnis: ', lv_ergebnis.
ENDIF.

IF sy-subrc = 1.
WRITE 'Durch 0 teilen ist nicht ;)!'.
ENDIF.

IF sy-subrc = 2.
WRITE 'Operator ist ungültig!'.
ENDIF.
