*&---------------------------------------------------------------------*
*& Report ztl_kunde
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_kunde.
TABLES: kna1, knvk, vbak.

SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE TEXT-001.

  PARAMETERS p_name TYPE kna1-name1.
"Jetzt kann man Buchstabe P mit Stern sucht kommt alles mit P raus
  REPLACE ALL OCCURRENCES OF '*' IN p_name WITH '%'.

SELECTION-SCREEN END OF BLOCK block1.

DATA: BEGIN OF ls_struktur,
        Kundenname   TYPE kna1-name1,
        Kundennummer TYPE kna1-kunnr,
        Ort TYPE kna1-ort01,
        Strasse TYPE kna1-stras,
        Vorname TYPE knvk-namev,
        Name TYPE knvk-name1,
        Verkaufsbeleg TYPE vbak-vbeln,
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF ls_struktur.

CALL FUNCTION 'ZTL_KUNNR_FM'
  EXPORTING
    ip_name  = p_name
  IMPORTING
    ep_kunnr = lt_tabelle.


cl_demo_output=>display( lt_tabelle ).
