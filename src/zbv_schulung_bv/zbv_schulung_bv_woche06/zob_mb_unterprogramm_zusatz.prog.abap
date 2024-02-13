*&---------------------------------------------------------------------*
*& Report zob_mb_unterprogramm_zusatz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_unterprogramm_zusatz.

FORM zbv_wort_u USING satz TYPE string        "Anfang des Unterprogrammes durch den Befehl FORM
                CHANGING ausgabe type string
                         ausgabe_2 type string.

SPLIT satz AT ' ' INTO ausgabe ausgabe_2. "Satz wird geteilt, es werden nach dem INTO mindestens zwei Variablen gebraucht.

ENDFORM.                                      "Ende des Unterprogrammes durch den Befehl ENDFORM

START-OF-SELECTION.

DATA lv_satz type string.   "Zwei Variablen wurden angelegt, da das Unterprogramm zwei Changing-Parameter hat.
DATA lv_satz_2 type string.

PERFORM zbv_wort_u USING 'Ich bin ein Satz' CHANGING lv_satz lv_satz_2.

WRITE lv_satz.
