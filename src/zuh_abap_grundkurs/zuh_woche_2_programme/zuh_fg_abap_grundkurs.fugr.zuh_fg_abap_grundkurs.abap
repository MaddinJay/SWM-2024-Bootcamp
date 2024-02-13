FUNCTION ZUH_FG_ABAP_GRUNDKURS.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IM_OPERAND1) TYPE  I
*"     REFERENCE(IM_OPERAND2) TYPE  I
*"     REFERENCE(IM_OPERATOR) TYPE  C
*"  EXPORTING
*"     REFERENCE(EX_ERG) TYPE  I
*"  EXCEPTIONS
*"      NULLDIVISION
*"      OPERATOR_UNGUELTIG
*"----------------------------------------------------------------------

CASE IM_OPERATOR.
  WHEN '+'.
    EX_ERG = IM_Operand1 + IM_Operand2.
  WHEN '-'.
    EX_ERG = IM_Operand1 - IM_Operand2.
  WHEN '*'.
    EX_ERG = IM_Operand1 * IM_Operand2.
  WHEN '/'.
    IF IM_OPERAND2 = 0.
      RAISE NULLDIVISION.
    ELSE.
      EX_ERG = IM_Operand1 / IM_Operand2.
    ENDIF.

  WHEN OTHERS.
    RAISE OPERATOR_UNGUELTIG.

ENDCASE.

ENDFUNCTION.
