*&---------------------------------------------------------------------*
*& Report zbv_selectionscreen_bv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_selectionscreen_bv.

*"Einfache Eingabe
*PARAMETERS p_test TYPE string.
*
*"Checkbox
*PARAMETERS p_check AS CHECKBOX.
*
*"Radiobutton
*
*PARAMETERS: p_r1 RADIOBUTTON GROUP g_1 DEFAULT 'X',
*            p_r2 RADIOBUTTON GROUP g_1,
*            pr_3 RADIOBUTTON GROUP g_1.
*
*"Komplexe Eingabe
*TABLES: SCARR.
*SELECT-OPTIONS s_opt1 FOR scarr-carrid.
*
*"Blöcke
*SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE text-001.
*SELECTION-SCREEN END OF BLOCK block1.
*
*"
*AT SELECTION-SCREEN ON RADIOBUTTON GROUP g_1.
*WRITE 'TEst'.

START-OF-SELECTION.
WRITE 'Yay'.
