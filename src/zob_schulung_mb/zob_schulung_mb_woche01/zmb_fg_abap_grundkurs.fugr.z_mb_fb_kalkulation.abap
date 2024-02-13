FUNCTION Z_MB_FB_KALKULATION.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_OPER1) TYPE  I
*"     VALUE(IV_OPER2) TYPE  I
*"     REFERENCE(IV_OPERA) TYPE  C
*"  EXPORTING
*"     VALUE(EV_ERG) TYPE  I
*"  EXCEPTIONS
*"      NULLDIVISION
*"      OPERATOR_UNGUELTIG
*"----------------------------------------------------------------------
CASE IV_OPERA.
WHEN '*'.
    EV_ERG = iv_oper1 * iv_oper2.

  WHEN '/'.
    if iv_oper2 = 0.
      raise NULLDIVISION.
      else.
    EV_ERG = iv_oper1 / iv_oper2.
    Endif.

    WHEN '+'.
    EV_ERG = iv_oper1 + iv_oper2.

  WHEN '-'.
    EV_ERG = iv_oper1 - iv_oper2.
    when OTHERS.
      raise OPERATOR_UNGUELTIG.

ENDCASE.




ENDFUNCTION.
