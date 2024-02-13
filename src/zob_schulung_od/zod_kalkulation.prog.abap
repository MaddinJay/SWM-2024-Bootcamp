*&---------------------------------------------------------------------*
*& Report ZOD_KALKULATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_kalkulation.


PARAMETERS: p_oper1 TYPE i,
            p_oper2 TYPE i,
            p_operat.
DATA lv_ergebnis TYPE i.


CALL FUNCTION 'Z_OD_FB_KALKULATION_T'
  EXPORTING
    iv_op1 = p_oper1
    iv_op2 = p_oper2
    iv_op  = p_operat
 IMPORTING
   EV_ERG = lv_ergebnis
 EXCEPTIONS
   NULLDIVISION             = 1
   OPERATOR_UNGUELTIG       = 2.

  .
IF sy-subrc = 0.
WRITE: 'Ergebnis: ', lv_ergebnis.
ENDIF.
IF sy-subrc = 1.
WRITE 'Division durch null ist nichts'.
ENDIF.
IF sy-subrc = 2.
WRITE 'Operator ist ungültig'.
ENDIF.
