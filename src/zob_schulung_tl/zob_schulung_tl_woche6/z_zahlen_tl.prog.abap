*&---------------------------------------------------------------------*
*& Report z_zahlen_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_zahlen_tl.
*Erstellen Sie eine Unterprogramm welches zwei Zahlen als Parameter übergeben bekommt und einen Parameter verändert.

"Wo FORM anfängt beginnt der Unterprogramm und mit ENDFORM endet er.
FORM zob_unterprogramm_tl USING nummer_1 TYPE int1
                                nummer_2 TYPE int1
                        CHANGING ergebnis TYPE int1.

  IF nummer_1 > nummer_2.
    ergebnis = nummer_1.

  ELSE.

    ergebnis = nummer_2.

  ENDIF.

ENDFORM.

*Rufen Sie Ihr Unterprogramm auf und geben Sie das Ergebnis aus.

START-OF-SELECTION.
  DATA: lv_ergebnis TYPE int1.

  PERFORM zob_unterprogramm_tl USING 5 15 CHANGING lv_ergebnis.
  WRITE lv_ergebnis.
