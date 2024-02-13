*&---------------------------------------------------------------------*
*& Report z_hum_uebung_unterprogramm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_uebung_unterprogramm.


Form Unterprogramm_zahlen
Using number1 Type int1
number2 type int1
CHANGING ergebnis Type int1.

if number1 => number2.
ergebnis = number1.
else.
ergebnis = number2.
Endif.

Endform.

start-of-selection.
Data lv_result type int1.
Parameters: p_zahl1 Type int1,
p_zahl2 Type int1.

PERFORM Unterprogramm_zahlen using p_zahl1 p_zahl2 CHANGING lv_result.

WRITE lv_result.
