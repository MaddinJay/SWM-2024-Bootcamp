*&---------------------------------------------------------------------*
*& Report z_abfs_test_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_abfs_test_report.

PARAMETERS:
  p_knr            TYPE zabfs_db_mon-kundennummer OBLIGATORY.

SELECTION-SCREEN BEGIN OF SCREEN 001.
  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
    PARAMETERS: p_kuneu  RADIOBUTTON GROUP g_1,
                p_kuinfo RADIOBUTTON GROUP g_1,
                p_kuinf2 RADIOBUTTON GROUP g_1,
                p_pruef  RADIOBUTTON GROUP g_1.
  SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 001.

SELECTION-SCREEN BEGIN OF SCREEN 002.
  SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
* Hier werden die Daten des Kunden aus der APP eingetragen. Neuer Zählerstand.
    PARAMETERS:
      p_znr  TYPE zabfs_db_mon-zaehlernummer OBLIGATORY,
      p_zst  TYPE zabfs_db_mon-zaehlerstand OBLIGATORY,
      p_date TYPE zabfs_db_mon-datum OBLIGATORY.
  SELECTION-SCREEN END OF BLOCK b2.
SELECTION-SCREEN END OF SCREEN 002.

SELECTION-SCREEN BEGIN OF SCREEN 003.
  SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-001.
    PARAMETERS:
      p_kudat RADIOBUTTON GROUP g_2, " Kundendaten
      p_vbdat RADIOBUTTON GROUP g_2. " Verbrauchsdaten, Verbracuh Preis Zählerstand usw.
  SELECTION-SCREEN END OF BLOCK b3.
SELECTION-SCREEN END OF SCREEN 003.

*******************************
* Beginn des Programms -> Start-of-Selection
*******************************
START-OF-SELECTION.

  DATA lo_neuer_eintrag TYPE REF TO zcl_abfs_cl_emon.
  lo_neuer_eintrag = NEW #(  ).

  CALL SELECTION-SCREEN 001.
  IF p_kuneu = abap_true.
    CALL SELECTION-SCREEN 002.
    lo_neuer_eintrag->set_dbmon( EXPORTING iv_knr = p_knr
                                           iv_znr = p_znr
                                           iv_zst = p_zst
                                           iv_date = p_date ).

  ELSEIF p_kuinfo = abap_true.
    CALL SELECTION-SCREEN 003.
    IF p_kudat = abap_true.
      DATA ls_kunde TYPE zabfs_db_kund.
      lo_neuer_eintrag->get_dbkund( EXPORTING iv_knr = p_knr
                                    RECEIVING rv_kunde = ls_kunde ).
      cl_demo_output=>display( ls_kunde ).
    ELSEIF p_vbdat = abap_true.
      lo_neuer_eintrag->get_info_vbdat_fuer_ma( iv_knr = p_knr ).
    ENDIF.



  ELSEIF p_kuinf2 = abap_true.
    lo_neuer_eintrag->get_info_fuer_kunde( EXPORTING iv_knr = p_knr ).

  ELSEIF p_pruef = abap_true.

    lo_neuer_eintrag->get_dbmon( EXPORTING iv_knr = p_knr     " Erstellt sortierte itab für weitere Methoden
                                          ).
    lo_neuer_eintrag->plausi_pruef(  ).  " Prüft ob neuer Zählerstand größer als der letzte ist.
    " Startet Verbrauchs- und Preisberechnung.
    lo_neuer_eintrag->set_dbmon_best( ). " schreibe in DB zabfs_db_mon

  ENDIF.

***

  ULINE.
