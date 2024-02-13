*&---------------------------------------------------------------------*
*& Report ZLV_KALKULATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlv_kalkulation.
**********************************************************************
*Einfacher Taschenrechner über Benutzeroberfläche
**********************************************************************
PARAMETERS: Operand1 TYPE i,
            Operand2 TYPE i,
            Operator.

DATA: gv_erg TYPE i.

CALL FUNCTION 'ZUH_FG_ABAP_GRUNDKURS'
  EXPORTING
    im_operand1 = Operand1
    im_operand2 = Operand2
    im_operator  = Operator
 IMPORTING
   EX_ERG      = gv_erg
 EXCEPTIONS
   NULLDIVISION             = 1
   OPERATOR_UNGUELTIG       = 2
   OTHERS      = 3.



CASE Sy-subrc.
  WHEN 0.
    WRITE: / 'Das Ergebnis ist: ' , gv_erg.
  WHEN 1.
    WRITE: / 'Durch 0 nicht teilbar'.
  WHEN 2.
    WRITE: / 'Operator ist ungültig'.
  WHEN OTHERS.
    WRITE: / 'Test'.
ENDCASE.
