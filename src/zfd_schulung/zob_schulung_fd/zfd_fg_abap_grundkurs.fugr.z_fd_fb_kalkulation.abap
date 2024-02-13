FUNCTION z_fd_fb_kalkulation.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_OPERAND1) TYPE  I
*"     VALUE(IV_OPERAND2) TYPE  I
*"     REFERENCE(IV_OPERATOR) TYPE  C
*"  EXPORTING
*"     VALUE(EV_ERGEBNIS) TYPE  I
*"  EXCEPTIONS
*"      NULLDIVISION
*"      OPERATOR_UNGUELTIG
*"----------------------------------------------------------------------

  CASE iv_operator.
    WHEN '+'.
      ev_ergebnis = iv_operand1 + iv_operand2.
    WHEN '-'.
      ev_ergebnis = iv_operand1 - iv_operand2.
    WHEN '*'.
      ev_ergebnis = iv_operand1 * iv_operand2.
    WHEN '/'.
      IF iv_operand2 = 0.
        RAISE nulldivision.
      ENDIF.
      ev_ergebnis = iv_operand1 / iv_operand2.
    WHEN OTHERS.
      RAISE operator_ungueltig.

  ENDCASE.



ENDFUNCTION.
