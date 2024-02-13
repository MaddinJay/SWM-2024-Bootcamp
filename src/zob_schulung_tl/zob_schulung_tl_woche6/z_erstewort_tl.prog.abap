*&---------------------------------------------------------------------*
*& Report z_erstewort_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_erstewort_tl.

FORM zob_satz_tl USING satz TYPE string

                CHANGING ergebnis TYPE string
                ergebnis2 TYPE string.


 SPLIT satz AT ' ' INTO ergebnis ergebnis2.
*  CONCATENATE satz into ergebnis SEparated by ' '.

ENDFORM.

START-OF-SELECTION.
  DATA: lv_ergebnis TYPE string.
  DATA: lv_ergebnis2 TYPE string.
  PERFORM zob_satz_tl USING 'Hallo Welt Wie geht es dir' CHANGING lv_ergebnis lv_ergebnis2.

  WRITE lv_ergebnis.
