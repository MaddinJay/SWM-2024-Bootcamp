*&---------------------------------------------------------------------*
*& Report zoblv_bigger
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoblv_bigger.

FORM zobLV_bigger using number_1 type int1
number_2 type int1
changing result type int1.

if number_1 > number_2.
  result = number_1.
else.
  result = number_2.
endif.


endform.

START-OF-SELECTION.
data: lv_ergebnis type int1.

      perform zoblv_bigger using 5 15 changing lv_ergebnis.
      write lv_ergebnis.
