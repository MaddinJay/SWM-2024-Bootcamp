*&---------------------------------------------------------------------*
*& Report ZAW_KALKULATION_TR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_kalkulation_tr.

PARAMETERS: p_wert1 TYPE i,
            p_wert2 TYPE i,
            p_wert3.

DATA p_ergebnis TYPE i. "Festlegung Variable, in der das Ergebnis gespeichert wird.

CALL FUNCTION 'Z_AW_KALKULATOR'
  EXPORTING
    iv_kalk1           = p_wert1
    iv_kalk2           = p_wert2
    iv_kalk3           = p_wert3
  IMPORTING
    ev_erg             = p_ergebnis
  EXCEPTIONS
    nulldivision       = 1
    operator_ungueltig = 2.

*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.

CASE sy-subrc.
  WHEN 0.
    WRITE / 'Ergebnis passt.'.
  WHEN 1.
    WRITE / 'Durch Null kann nicht dividiert werden'.
  WHEN 2.
    WRITE / 'Ungültig.'.
  WHEN OTHERS.
ENDCASE.
