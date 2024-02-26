FUNCTION Z_TW_FB_KALKULATION.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_OP1) TYPE  I
*"     VALUE(IV_OP2) TYPE  I
*"     REFERENCE(IV_OP) TYPE  C
*"  EXPORTING
*"     VALUE(EV_ERG) TYPE  I
*"  EXCEPTIONS
*"      NULLDIVISION
*"      OPERATOR_UNGUELTIG
*"----------------------------------------------------------------------
CASE iv_op.
  When '*'.
    ev_erg = iv_op1 * iv_op2.
    WHEN '/'.
      IF iv_op2 = 0.
RAISE nulldivision.
ELSE.
  ev_erg = iv_op1 / iv_op2.
      ENDIF.

WHEN '+'.
  ev_erg = iv_op1 + iv_op2.
  WHEN '-'.
    ev_erg = iv_op1 - iv_op2.
    WHEN OTHERS.
      RAISE operator_ungueltig.
      ENDCASE.

ENDFUNCTION.
