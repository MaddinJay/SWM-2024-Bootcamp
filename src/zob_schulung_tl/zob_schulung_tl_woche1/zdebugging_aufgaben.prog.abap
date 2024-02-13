*&---------------------------------------------------------------------*
*& Report zdebugging_aufgaben
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdebugging_aufgaben.

*Unten genannte Code wurde direkt aus Aufgabenstellung kopiert.
*Aufgabensellung: Debuggen Sie den Code um die Fehler zu finden:
*Doppelklick auf die Zeilennummer wird ein Breakpoint gesetzt:
*Das Problem ist: Der Programm denkt im Ersten Step, wo wir die Variable deklariert haben, dass die Variable 4 Charakter Lang ist da Ihr Name 'Test' zugewiesen wurde.
*  2. Im Zweiten Schritt wollen wir aber ein ganzes Satz der Variable zuweisen
*  3. Im Dritten Schritt bei der Ausgabe wird aber nur 'Dies' angezeigt, da die Variable 4 Charakter Lang ist
*Lösungsvorschlag: Variable einen TYPE string setzen.
DATA: lv_test2 type string.
DATA(lv_test) = |Test|.
lv_test = 'Dies ist ein Test'.
lv_test2 = 'Test'.
WRITE / lv_test.
WRITE / lv_test2.
