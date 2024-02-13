FUNCTION z_lc_fb_kalkulation.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_OP1) TYPE  I
*"     REFERENCE(IV_OP2) TYPE  I
*"     REFERENCE(IV_OP) TYPE  C
*"  EXPORTING
*"     REFERENCE(EV_ERG) TYPE  I
*"  EXCEPTIONS
*"      NULLDIVISION
*"      OPARATOR_UNGUELTIG
*"----------------------------------------------------------------------

  CASE iv_op.
    WHEN  '*'.
      ev_erg = iv_op1 * iv_op2.
    WHEN  '/'.
      IF iv_op2 = 0.
        RAISE nulldivision.
      ELSE.
        ev_erg = iv_op1 / iv_op2.
      ENDIF.
    WHEN  '+'.
      ev_erg = iv_op1 + iv_op2.
    WHEN  '-'.
      ev_erg = iv_op1 - iv_op2.
    WHEN OTHERS.
      RAISE oparator_ungueltig.
  ENDCASE.
ENDFUNCTION.
