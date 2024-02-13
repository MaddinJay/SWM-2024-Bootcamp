*&---------------------------------------------------------------------*
*& Report zfd_selectionscreens
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_selectionscreens.

"Einfache eingabe
PARAMETERS p_test TYPE string.

"Checkbox
PARAMETERS p_check AS CHECKBOX.

"Radiobutton
PARAMETERS: p_r1 RADIOBUTTON GROUP g_1 DEFAULT 'X',
            p_r2 RADIOBUTTON GROUP g_1,
            p_r3 RADIOBUTTON GROUP g_1.

"Komplexe Eingabe
TABLES scarr.
SELECT-OPTIONS s_opt1 FOR scarr-carrid.

"Blöcke
SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE TEXT-001.
SELECTION-SCREEN END OF BLOCK block1.

"

AT SELECTION-SCREEN ON RADIOBUTTON GROUP g_1.
  WRITE 'TEst'.


START-OF-SELECTION.
  WRITE 'Start'.
