*&---------------------------------------------------------------------*
*& Report zob_mb_fuba_change
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_fuba_change.

SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.
PARAMETERS p_nr TYPE kna1-kunnr OBLIGATORY LOWER CASE MODIF ID sc1.
REPLACE ALL OCCURRENCES OF '*' IN p_nr WITH '%'. "wildcards, anwender kann mit * suchen
SELECTION-SCREEN END OF BLOCK a.


START-OF-SELECTION.

DATA: BEGIN OF ls_tabelle,
      Kundennummer type kna1-kunnr,
      Kundenname type kna1-name1,
      End of ls_tabelle,
      lt_tabelle like table of ls_tabelle.
      Update kna1 set name1 = 'Shipping Point' where kunnr = '1000010'.


Call FUNCTION 'ZOBMB_FLIGHT_CHANGE_CUST'

Exporting
ip_kundennr = p_nr

Importing
ept_name = lt_tabelle.

 cl_demo_output=>display( lt_tabelle ).
