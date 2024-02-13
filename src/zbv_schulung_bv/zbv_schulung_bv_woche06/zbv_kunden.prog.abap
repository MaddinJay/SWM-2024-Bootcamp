*&---------------------------------------------------------------------*
*& Report zbv_kunden
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_kunden.


SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.
PARAMETERS p_name TYPE kna1-name1 OBLIGATORY LOWER CASE.
REPLACE ALL OCCURRENCES OF '*' IN p_name WITH '%'. "Sternchen Suchhilfe
SELECTION-SCREEN END OF BLOCK a.



START-OF-SELECTION.
  DATA: BEGIN OF ls_tabelle,
        Kundenname TYPE kna1-name1,
        Kundennummer TYPE kna1-kunnr,
        Strasse TYPE kna1-stras,
        Postleitzahl TYPE kna1-pstlz,
        Ort TYPE kna1-ort01,
        Belegnummer TYPE vbak-vbeln,
        Vorname TYPE knvk-namev,
        Nachname TYPE knvk-name1,
        END OF ls_tabelle,
        lt_tabelle LIKE TABLE OF ls_tabelle.

  CALL FUNCTION 'ZBV_KUNDENNUMMER'
    EXPORTING
      ip_name     = p_name
    IMPORTING
      ept_knummer = lt_tabelle.


  cl_demo_output=>display( lt_tabelle ).
