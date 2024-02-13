*&---------------------------------------------------------------------*
*& Report ZOD_FSYMBOLE_IMPLI_TYPANGABE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOD_FSYMBOLE_IMPLI_TYPANGABE.
TYPES: BEGIN OF lty_uhrzeit,
  stunden(2) TYPE n,
  minuten(2) TYPE n,
  sekunden(2) TYPE n,
  END OF lty_uhrzeit.

  FIELD-SYMBOLS: <fsuhr> TYPE any,
                 <wert> TYPE n.

  ASSIGN sy-uzeit TO <fsuhr> CASTING TYPE lty_uhrzeit.
DO.
  ASSIGN COMPONENT sy-index OF STRUCTURE <fsuhr> TO <wert>.
  IF sy-subrc <> 0.
  EXIT.
  ENDIF.
  WRITE / <wert>.
ENDDO.



*  WRITE: / <fsuhr>-stunden, <fsuhr>-minuten, <fsuhr>-sekunden.
