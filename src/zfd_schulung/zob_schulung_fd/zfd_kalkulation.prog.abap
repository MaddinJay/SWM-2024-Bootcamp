*&---------------------------------------------------------------------*
*& Report ZFD_KALKULATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_kalkulation.

PARAMETERS: operand1 TYPE i,
            operand2 TYPE i,
            operator.

DATA: gv_ergebnis TYPE i.

CALL FUNCTION 'Z_FD_FB_KALKULATION'
  EXPORTING
    iv_operand1        = operand1
    iv_operand2        = operand2
    iv_operator        = operator
  IMPORTING
    ev_ergebnis        = gv_ergebnis
  EXCEPTIONS
    nulldivision       = 1
    operator_ungueltig = 2.

CASE sy-subrc.
  WHEN 0.
    WRITE: 'Das Ergebnis ist: ', gv_ergebnis.
  WHEN 1.
    WRITE: 'Fehler: Nulldivision aufgetreten!'.
  WHEN 2.
    WRITE: 'Fehler: Der Operator ist ungültig!'.
  WHEN OTHERS.
    WRITE 'Anderer Fehler, Bitte Debugger checken!'.

ENDCASE.
