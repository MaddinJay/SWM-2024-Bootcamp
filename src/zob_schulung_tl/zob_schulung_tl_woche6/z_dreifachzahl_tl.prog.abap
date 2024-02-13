*&---------------------------------------------------------------------*
*& Report z_dreifachzahl_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_dreifachzahl_tl.

FORM zob_dreifach_tl USING zahl TYPE int1
                        CHANGING ergebnis TYPE int1.


 ergebnis = zahl * 3.


ENDFORM.


START-OF-SELECTION.
  DATA: lv_ergebnis TYPE int1.

  PERFORM zob_dreifach_tl USING 5 CHANGING lv_ergebnis.
  WRITE: 'Dreifaches Wert der Zahl: ', lv_ergebnis.
