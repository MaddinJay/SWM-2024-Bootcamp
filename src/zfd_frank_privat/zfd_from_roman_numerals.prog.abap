*&---------------------------------------------------------------------*
*& Report zfd_from_roman_numerals
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_from_roman_numerals.

PARAMETERS p_einga(3) TYPE c.

DATA lv_zeichen1 TYPE c.
DATA lv_zeichen2 TYPE c.
DATA lv_zeichen3 TYPE c.
DATA lv_zeichena TYPE c.
DATA lv_zaehler TYPE i VALUE 0.
DATA lv_result1 TYPE i VALUE 0.

lv_zeichen1 = p_einga+0(1). " Offset:  Die Zahl nach dem '+' ist der Offset und die Zahl in Klammern gibt die Länge an.
lv_zeichen2 = p_einga+1(1).
lv_zeichen3 = p_einga+2(1).
lv_zeichena = lv_zeichen1.

CASE lv_zeichena.
  WHEN 'M'.
    lv_result1 = lv_result1 + 1000.
  WHEN 'D'.
    lv_result1 = lv_result1 + 500.
  WHEN 'C'.
    lv_result1 = lv_result1 + 100.
  WHEN 'L'.
    lv_result1 = lv_result1 + 50.
  WHEN 'X'.
    lv_result1 = lv_result1 + 10.
  WHEN 'V'.
    lv_result1 = lv_result1 + 5.
  WHEN 'I'.
    lv_result1 = lv_result1 + 1.
ENDCASE.

lv_zeichena = lv_zeichen2.

CASE lv_zeichena.
  WHEN 'M'.
    lv_result1 = lv_result1 + 1000.
  WHEN 'D'.
    lv_result1 = lv_result1 + 500.
  WHEN 'C'.
    lv_result1 = lv_result1 + 100.
  WHEN 'L'.
    lv_result1 = lv_result1 + 50.
  WHEN 'X'.
    lv_result1 = lv_result1 + 10.
  WHEN 'V'.
    lv_result1 = lv_result1 + 5.
  WHEN 'I'.
    lv_result1 = lv_result1 + 1.
ENDCASE.

lv_zeichena = lv_zeichen3.

CASE lv_zeichena.
  WHEN 'M'.
    lv_result1 = lv_result1 + 1000.
  WHEN 'D'.
    lv_result1 = lv_result1 + 500.
  WHEN 'C'.
    lv_result1 = lv_result1 + 100.
  WHEN 'L'.
    lv_result1 = lv_result1 + 50.
  WHEN 'X'.
    lv_result1 = lv_result1 + 10.
  WHEN 'V'.
    lv_result1 = lv_result1 + 5.
  WHEN 'I'.
    lv_result1 = lv_result1 + 1.
ENDCASE.


*******************************
* Ausgabe
*******************************
write / p_einga.
WRITE: / 'Zeichen 1: ', lv_zeichen1.
WRITE: / 'Zeichen 2: ', lv_zeichen2.
WRITE: / 'Zeichen 3: ', lv_zeichen3.
WRITE: / 'Result 1: ', lv_result1.
