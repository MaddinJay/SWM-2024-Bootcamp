*&---------------------------------------------------------------------*
*& Report zob_mb_unterprogramm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_unterprogramm.

*Erstellen Sie mehrere Unterprogramm in Ihrem Report, welcher von zwei
*Zahlen die größere Zahl zurückgibt.



*Erstellen des Unterprogramms
FORM zomb_bigger USING zahl_1 TYPE int1
                       zahl_2 TYPE int1
                CHANGING result TYPE int1.

 IF zahl_1 > zahl_2.
 result = zahl_1.
 ELSE.
 result = zahl_2.
 ENDIF.

ENDFORM.


*aufrufen des Unterprogramms und Ergebnis ausgeben:

START-OF-SELECTION.
DATA: lv_result TYPE int1.

PERFORM zomb_bigger USING 5 15 CHANGING lv_result.
WRITE lv_result.
