*&---------------------------------------------------------------------*
*& Report zbv_dreifach
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_dreifach.

FORM zbv_u_dreifach USING number_1 TYPE i
                    CHANGING ergebnis TYPE i.

ergebnis = number_1 * 3.

ENDFORM.

START-OF-SELECTION.

Data lv_ergebnis TYPE i.

PERFORM zbv_u_dreifach USING 5 CHANGING lv_ergebnis.

WRITE lv_ergebnis.
