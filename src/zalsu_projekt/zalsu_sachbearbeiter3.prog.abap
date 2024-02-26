*&---------------------------------------------------------------------*
*& Report zalsu_sachbearbeiter3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_sachbearbeiter3.

************************* Beginn der ALV-TABELLE ****************************
SELECTION-SCREEN BEGIN OF SCREEN 100.

************************* alle Typesierungen der ALV-TABELLE ****************
  TYPES: BEGIN OF t_ticket,
           sel,                          "stores which row user has selected
           Ticketid      TYPE zalsu_db_ticket-ticketid,
           Kategorie     TYPE zalsu_db_ticket-kategorie,
           Status        TYPE zalsu_db_ticket-status,
           Postleitzahl  TYPE zalsu_db_kunde-postleitzahl,
           Saeumig       TYPE zalsu_db_kunde-saeumig,
           Beschreibung  TYPE zalsu_db_ticket-beschreibung,
           Nachname      TYPE zalsu_db_technik-nachname,
           Grossstoerung TYPE zalsu_db_ticket-grossstoerung,
           Kundeninfo    TYPE zalsu_db_ticket-kundeninfo,
           Loesung       TYPE zalsu_db_ticket-loesung,
           bestaetigt    TYPE abap_bool,
         END OF t_ticket.

******** Types von Auswahllisten *********************************************
  TYPE-POOLS: vrm.

*** Types von Auswahlliste - Status ***************************************
  TYPES: BEGIN OF ls_status,
           id     TYPE zalsu_db_status-id,
           status TYPE zalsu_db_status-status,
         END OF ls_status.

****  Types von Auswahlliste - Techniker ***************************************
  TYPES: BEGIN OF ls_technik,
           nachname TYPE zalsu_db_tech-nachname,
         END OF ls_technik.

****      Types von Auswahlliste - Kategorie ***************************************
  TYPES: BEGIN OF ls_kategorie,
           kategorie TYPE zalsu_db_kateg-kategorie,
         END OF ls_kategorie.

******** DATA der ALV-Liste *************************************************
  DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
        gd_tab_group TYPE slis_t_sp_group_alv,
        gd_layout    TYPE slis_layout_alv,
        gd_repid     LIKE sy-repid,
        lt_ticket    TYPE TABLE OF t_ticket,
        ls_ticket    TYPE t_ticket,
        iv_nummer    TYPE zalsu_db_ticket-beschreibung,

******* DATA Der Auswahlliste - Status *******
        gt_status    TYPE STANDARD TABLE OF ls_status,
        ls_stati     TYPE ls_status,
        g_id         TYPE vrm_id,
        it_values_s  TYPE vrm_values,
        wa_values_s  LIKE LINE OF it_values_s,

******* DATA Der Auswahlliste - Techniker *******
        gt_technik   TYPE STANDARD TABLE OF ls_technik,
        ls_tech      TYPE ls_technik,
        g_tech       TYPE vrm_id,
        it_values_t  TYPE vrm_values,
        wa_values_t  LIKE LINE OF it_values_t,

******* DATA Der Auswahlliste - Kategorie **********
        gt_kategorie TYPE STANDARD TABLE OF ls_kategorie,
        ls_kate      TYPE ls_kategorie,
        g_kate       TYPE vrm_id,
        it_values_k  TYPE vrm_values,
        wa_values_k  LIKE LINE OF it_values_k,

******* DATA Der Form Eingaben  ***********
        lv_tech      TYPE zalsu_db_technik-technikerid.

************************* Unterprogramme der ALV-Tabelle *****************
  PERFORM abfrage.
  PERFORM build_fieldcatalog.
  PERFORM build_layout.
  PERFORM anzeige_alv_report.

SELECTION-SCREEN END OF SCREEN 100.
************************* Beginn des Selection-Screen ****************************
SELECTION-SCREEN BEGIN OF SCREEN 200.

  SELECTION-SCREEN BEGIN OF BLOCK ticket WITH FRAME TITLE TEXT-001.
    PARAMETERS:    p_tickid     TYPE zalsu_db_ticket-ticketid.
    PARAMETERS:    p_kate_z     TYPE zalsu_db_kateg AS LISTBOX VISIBLE LENGTH 20 DEFAULT 'STROMSTÖRUNG'.
    PARAMETERS:    p_stat_z    TYPE zalsu_db_status AS LISTBOX VISIBLE LENGTH 20 DEFAULT 'NEU'.
    PARAMETERS:    p_saeum     TYPE zalsu_db_kunde-saeumig.
    PARAMETERS:    p_besch     TYPE zalsu_db_ticket-beschreibung.
  SELECTION-SCREEN END OF BLOCK ticket.

  SELECTION-SCREEN BEGIN OF BLOCK kunde WITH FRAME TITLE TEXT-002.
    PARAMETERS:    p_nname     TYPE zalsu_db_kunde-nachname.
    PARAMETERS:    p_vname     TYPE zalsu_db_kunde-vorname.
    PARAMETERS:    p_kzaehl     TYPE zalsu_db_kunde-zaehlernummer.
    PARAMETERS:    p_ktel     TYPE zalsu_db_kunde-telefon.
    PARAMETERS:    p_post     TYPE zalsu_db_kunde-postleitzahl.
    PARAMETERS:    p_ort     TYPE zalsu_db_kunde-ort.
    PARAMETERS:    p_kstra     TYPE zalsu_db_kunde-strasse.
    PARAMETERS:    p_khaus     TYPE zalsu_db_kunde-hausnummmer.
  SELECTION-SCREEN END OF BLOCK kunde.

  SELECTION-SCREEN BEGIN OF BLOCK loesung WITH FRAME TITLE TEXT-003.
    PARAMETERS:    p_tech_z     TYPE zalsu_db_tech AS LISTBOX VISIBLE LENGTH 20.
    PARAMETERS:    p_loes     TYPE zalsu_db_ticket-loesung.
  SELECTION-SCREEN END OF BLOCK loesung.

SELECTION-SCREEN END OF SCREEN 200.

*** Belegung der Auswahlliste ******************************
AT SELECTION-SCREEN OUTPUT.
*** Belegung der Status-Auswahlliste ***********************
  SELECT
  FROM zalsu_db_status
  FIELDS *
  INTO TABLE @gt_status.

  LOOP AT gt_status INTO ls_stati.
    wa_values_s-key = ls_stati-status.
    APPEND wa_values_s TO it_values_s.
    CLEAR wa_values_s.
  ENDLOOP.

  g_id = 'p_stat_z'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = g_id
      values = it_values_s.

**** Belegung der Techniker-Auswahlliste ************************

  SELECT
FROM zalsu_db_tech
FIELDS nachname
INTO TABLE @gt_technik.

  LOOP AT gt_technik INTO ls_tech.
    wa_values_t-key = ls_tech-nachname.
    APPEND wa_values_t TO it_values_t.
    CLEAR wa_values_t.
  ENDLOOP.

  g_tech = 'p_tech_z'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = g_tech
      values = it_values_t.

**** Belegung der Kategorie-Auswahlliste *******************

  SELECT
FROM zalsu_db_kateg
FIELDS kategorie
INTO TABLE @gt_kategorie.

  LOOP AT gt_kategorie INTO ls_kate.
    wa_values_k-key = ls_kate-kategorie.
    APPEND wa_values_k TO it_values_k.
    CLEAR wa_values_k.
  ENDLOOP.

  g_kate = 'p_kate_z'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = g_kate
      values = it_values_k.


********************* Beginn aller Unterprogramme ********************************

********************* Abfrage der ALV-Tabelle ***********************************
FORM abfrage.
  SELECT
  FROM Zalsu_db_ticket
  LEFT JOIN zalsu_db_kunde ON zalsu_db_ticket~kundenid = zalsu_db_kunde~kundenid
  LEFT JOIN zalsu_db_technik ON zalsu_db_ticket~technikerid = zalsu_db_technik~technikerid
  FIELDS *
*    WHERE
*    zalsu_db_ticket~status <> 'ERLEDIGT'
ORDER BY zalsu_db_ticket~kategorie DESCENDING, zalsu_db_ticket~status DESCENDING
  INTO CORRESPONDING FIELDS OF TABLE @lt_ticket.
ENDFORM.

********************* build_fieldcatalog der ALV-Tabelle ********************************
FORM build_fieldcatalog.

  fieldcatalog-fieldname   = 'TicketID'.
  fieldcatalog-seltext_m   = 'TicketID'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 7.
  fieldcatalog-emphasize   = 'X'.
  fieldcatalog-key         = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Kategorie'.
  fieldcatalog-seltext_m   = 'Kategorie'.
  fieldcatalog-col_pos     = 1.
  fieldcatalog-outputlen   = 15.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Status'.
  fieldcatalog-seltext_m   = 'Status'.
  fieldcatalog-col_pos     = 2.
  fieldcatalog-outputlen   = 14.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Postleitzahl'.
  fieldcatalog-seltext_m   = 'Postleitzahl'.
  fieldcatalog-col_pos     = 3.
  fieldcatalog-outputlen   = 7.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Saeumig'.
  fieldcatalog-seltext_m   = 'Saeumig'.
  fieldcatalog-col_pos     = 4.
  fieldcatalog-outputlen = 6.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Beschreibung'.
  fieldcatalog-seltext_m   = 'Beschreibung'.
  fieldcatalog-col_pos     = 5.
  fieldcatalog-outputlen   = 35.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Nachname'.
  fieldcatalog-seltext_m   = 'Techniker'.
  fieldcatalog-col_pos     = 6.
  fieldcatalog-outputlen   = 12.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Grossstoerung'.
  fieldcatalog-seltext_m   = 'GS'.
  fieldcatalog-col_pos     = 7.
  fieldcatalog-outputlen   = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Kundeninfo'.
  fieldcatalog-seltext_m   = 'KF'.
  fieldcatalog-col_pos     = 8.
  fieldcatalog-outputlen   = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Loesung'.
  fieldcatalog-seltext_m   = 'Loesung'.
  fieldcatalog-col_pos     = 9.
  fieldcatalog-outputlen   = 35.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Auswahl'.
  fieldcatalog-seltext_m   = 'Auswahl'.
  fieldcatalog-col_pos     = 10.
  fieldcatalog-outputlen = 5.
  fieldcatalog-checkbox = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

ENDFORM.

********************* build_layout der ALV-Tabelle ********************************
FORM build_layout.
  gd_layout-box_fieldname     = 'SEL'.
  gd_layout-edit              = 'X'. "makes whole ALV table editable
  gd_layout-zebra             = 'X'.
ENDFORM.

********************* anzeige der ALV-Tabelle ********************************
FORM anzeige_alv_report.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = sy-repid
      i_callback_pf_status_set = 'PF_STATUS' "Menüband aus GUI-Status übernommen wird
      i_callback_user_command  = 'USER_COMMAND' "Reagiert auf User-klick
      is_layout                = gd_layout
      it_fieldcat              = fieldcatalog[]
      i_save                   = 'X'
    TABLES
      t_outtab                 = lt_ticket
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
  ENDIF.
ENDFORM.                    " DISPLAY_ALV_REPORTS


********************* pf-status der ALV-Tabelle (GUI-Build) ********************************
FORM pf_status USING rt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS' EXCLUDING rt_extab.
ENDFORM.

*********** Auswahl in der Liste und Absprung nach SELECTION-SCREEN 200 (Achtung Verschachtelung) ************
FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.
  CASE r_ucomm.
    WHEN 'CONFIRM'.
      READ TABLE lt_ticket INTO ls_ticket INDEX rs_selfield-tabindex.

  ENDCASE.

************ Absprung nach SELECTION-SCREEN 200 *************************************************************
  PERFORM selection.


ENDFORM.

******************** Vorbereitung zum SELECTION-SCREEN 200 ***********************************
FORM selection.

  SELECT SINGLE
     FROM Zalsu_db_ticket
     LEFT JOIN zalsu_db_kunde ON zalsu_db_ticket~kundenid = zalsu_db_kunde~kundenid
     LEFT JOIN zalsu_db_technik ON zalsu_db_ticket~technikerid = zalsu_db_technik~technikerid
     FIELDS *
       WHERE
       zalsu_db_ticket~ticketid = @ls_ticket-ticketid
     INTO @DATA(ls_ticket2).
  p_tickid  = ls_ticket2-zalsu_db_ticket-ticketid.
  p_nname = ls_ticket2-zalsu_db_kunde-nachname.
  p_vname = ls_ticket2-zalsu_db_kunde-vorname.
  p_ktel = ls_ticket2-zalsu_db_kunde-telefon.
  p_besch  = ls_ticket2-zalsu_db_ticket-beschreibung.
  p_kstra = ls_ticket2-zalsu_db_kunde-strasse.
  p_khaus = ls_ticket2-zalsu_db_kunde-hausnummmer.
  p_kzaehl = ls_ticket2-zalsu_db_kunde-zaehlernummer.
  p_saeum = ls_ticket2-zalsu_db_kunde-saeumig.
  p_post = ls_ticket2-zalsu_db_kunde-postleitzahl.
  p_ort = ls_ticket2-zalsu_db_kunde-ort.


***************** Sprung zum SELECTION-SCREEN 200 ******************************************
  CALL SELECTION-SCREEN 200.

***************** Sprung zum Eingabe im SELECTION-SCREEN 200 ******************************

  LEAVE TO SCREEN 0.
ENDFORM.

***************** IF-Verzweigung im SELECTION-SCREEN 200 ******************************
FORM eingabe.

  DATA(ls_ticket3) = VALUE zalsu_db_ticket(
                                                ticketid = p_tickid
                                                 ).
  IF p_loes IS NOT INITIAL.        "Tritt eine wenn nur eine Lösung geschrieben wird => Erledigt
    UPDATE zalsu_db_ticket SET status = 'ERLEDIGT' loesung = p_loes datum_erl = sy-datum kundeninfo = 'X'
    WHERE ticketid = p_tickid.
    DATA(lv_message1) = |Das Ticket { p_tickid } wurde mit 'ERLEDIGT' geschlossen. { p_vname } { p_nname } wurde per E-Mail informiert.|.
    MESSAGE lv_message1 TYPE 'I'.
    PERFORM wiederholung.

  ELSEIF p_tickid IS INITIAL.
    LEAVE PROGRAM.

  ELSEIF p_tech_z IS NOT INITIAL.    "Tritt ein wenn zum Techniker weitergeleitet => Beim Techniker
    SELECT SINGLE
    FROM zalsu_db_technik
    FIELDS *
    WHERE nachname = @p_tech_z-nachname
    INTO @DATA(ls_techniker1).
    lv_tech = ls_techniker1-technikerid.
    ls_ticket3 = VALUE zalsu_db_ticket(
                                              ticketid = p_tickid
                                              ).
    UPDATE zalsu_db_ticket SET status = 'IN BEARBEITUNG' , technikerid = @lv_tech
    WHERE ticketid = @p_tickid.
    DATA(lv_message2) = |Das Ticket { p_tickid } wurde an { p_tech_z-nachname } weitergeleitet|.
    MESSAGE lv_message2 TYPE 'I'.
    PERFORM wiederholung.

  ELSEIF p_kate_z IS NOT INITIAL.
    UPDATE zalsu_db_ticket SET kategorie = @p_kate_z, kundeninfo = 'X'
    WHERE ticketid = @p_tickid.
    DATA(lv_message3) = |Im Ticket { p_tickid } wurde die Kategorie auf { p_kate_z-kategorie } geändert. { p_vname } { p_nname } wurde per E-Mail informiert.|.
    MESSAGE lv_message3 TYPE 'I'.
    PERFORM wiederholung.

  ELSE.
    WRITE: 'Fehler.'.

  ENDIF.
ENDFORM.

START-OF-SELECTION.

  PERFORM eingabe.

FORM wiederholung.
  SUBMIT zalsu_sachbearbeiter3.
ENDFORM.
