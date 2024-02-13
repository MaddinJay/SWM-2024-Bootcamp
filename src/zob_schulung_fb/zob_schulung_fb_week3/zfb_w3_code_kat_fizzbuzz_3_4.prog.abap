*&---------------------------------------------------------------------*
*& Report zfb_w3_code_kat_fizzbuzz_3_4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_w3_code_kat_fizzbuzz_3_4.

* Aufgabe 3
* Lege einen Report wie folgt an:
*     - Lege den Report mit einem sprechenden Namen an
*     - Erzeuge einen Parameter (Befehl PARAMETERS) in der Startmaske
*       des Reports vom Typ einer Zahl (INT1)
*     - Im Protokoll soll die Zahl der Eingabe angedruckt werden (Befehl WRITE verwenden)
*
* Aufgabe 4
* Erweitere den Report so, dass im Protokoll alle Zahlen von 1
* bis „User-Eingabe“ untereinander angedruckt werden.


PARAMETERS p_zahl TYPE INT1.

DATA lv_zahl TYPE i.
lv_zahl = 0.

DO p_zahl TIMES.
  lv_zahl = lv_zahl + 1.
  WRITE / lv_zahl.
ENDDO.

*IF lv_zahl = p_zahl.
*  WRITE 'p_zahl'.
*ENDIF.
*
*WRITE / p_zahl.
