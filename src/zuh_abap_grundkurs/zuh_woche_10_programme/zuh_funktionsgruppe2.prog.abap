*&---------------------------------------------------------------------*
*& Report zuh_funktionsgruppe2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_funktionsgruppe2.

*PARAMETERS: p_name type string.

*SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.
*PARAMETERS p_name TYPE kna1-name1 OBLIGATORY LOWER CASE MODIF ID sc1.
*REPLACE ALL OCCURRENCES OF '*' IN p_name WITH '%'.
*SELECTION-SCREEN END OF BLOCK a.


START-OF-SELECTION.

DATA: iv_name    TYPE string.

      Data: begin of ls_kunde,
      Kunde type kna1-name1,
      Kundennr type char10,
      Ort type char35,
      Strasse type char35,
      Kontakt type char35,
      Beleg type char10,
      end of ls_kunde,
      itv_kunde like table of ls_kunde.

*iv_name = p_name.
iv_name = 'Queen'.
*iv_name = 'JIT Company'.
*IV_name = ''.
*iv_name = 'Domestic US Customer 1'.

CALL FUNCTION 'Z_UH_KUNDENAUSWERTUNG2'
  EXPORTING
    ip_name    = iv_name
  IMPORTING
  lt_kunde = itv_kunde.


  cl_demo_output=>display( itv_kunde ).
