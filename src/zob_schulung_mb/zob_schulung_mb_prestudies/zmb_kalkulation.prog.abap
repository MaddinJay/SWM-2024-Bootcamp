*&---------------------------------------------------------------------*
*& Report ZMB_KALKULATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_kalkulation.

**********************************************************************
* Übung aus Video 3 -> Taschenrechner
**********************************************************************

PARAMETERS: p_opera1 TYPE i,
            p_opera2 TYPE i,
            p_operat.

DATA lv_ergebnis TYPE i.


*CASE p_operat.

*WHEN '+'.
*lv_ergebnis = p_opera1 + p_opera2.
*WHEN '-'.
*lv_ergebnis = p_opera1 - p_opera2.
*WHEN '*'.
*lv_ergebnis = p_opera1 * p_opera2.*
*WHEN '/'.
*lv_ergebnis = p_opera1 / p_opera2.
*ENDCASE.

*WRITE / lv_ergebnis.

**********************************************************************
* Taschenrechner in einen fuba auslagern
**********************************************************************



CALL FUNCTION 'Z_MB_FB_KALKULATION'
Exporting
  iv_oper1 = p_opera1
  iv_oper2 = p_opera2
  iv_opera = p_operat
Importing
 ev_erg = lv_ergebnis
EXCEPTIONS
     NULLDIVISION   = 1
     OPERATOR_UNGUELTIG = 2.

IF sy-subrc = 0.
  Write: 'Ergebnis', lv_ergebnis.
  endif.

  if sy-subrc = 1.
  write 'Durch 0 teilen ist nicht gültig'.
  endif.

  if sy-subrc = 2.
    write 'Operator ist ungültig'.
    endif.
