*&---------------------------------------------------------------------*
*& Report zalsu_techniker2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_techniker2.

************************** Beginn der ALV-TABELLE ****************************
SELECTION-SCREEN BEGIN OF SCREEN 100.

************************* alle Typesierungen der ALV-TABELLE ****************
  TYPES: BEGIN OF t_ticket,
           sel,                          "stores which row user has selected
           Ticketid      TYPE zalsu_db_ticket-ticketid,
           Grossstoerung TYPE zalsu_db_ticket-grossstoerung,
           Postleitzahl  TYPE zalsu_db_kunde-postleitzahl,
           Nachname      TYPE zalsu_db_kunde-nachname,
           Vorname       TYPE zalsu_db_kunde-vorname,
           Telefon       TYPE zalsu_db_kunde-telefon,
           Strasse       TYPE zalsu_db_kunde-strasse,
           Hausnummmer   TYPE zalsu_db_kunde-hausnummmer,
           Adresszusatz  TYPE zalsu_db_kunde-adresszusatz,
           Beschreibung  TYPE zalsu_db_ticket-beschreibung,
           bestaetigt    TYPE abap_bool,
         END OF t_ticket.


  DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
        gd_tab_group TYPE slis_t_sp_group_alv,
        gd_layout    TYPE slis_layout_alv,
        gd_repid     LIKE sy-repid,
        lt_ticket    TYPE TABLE OF t_ticket,
        ls_ticket    TYPE t_ticket,
        iv_nummer    TYPE zalsu_db_ticket-beschreibung.


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
    PARAMETERS:    p_zusa     TYPE zalsu_db_kunde-adresszusatz.
  SELECTION-SCREEN END OF BLOCK kunde.

  SELECTION-SCREEN BEGIN OF BLOCK beschreibung WITH FRAME TITLE TEXT-003.
    PARAMETERS:    p_besch     TYPE zalsu_db_ticket-beschreibung.
    PARAMETERS:    p_status     TYPE zalsu_db_ticket-status.
    PARAMETERS:    p_tech     TYPE zalsu_db_technik-nachname.
  SELECTION-SCREEN END OF BLOCK beschreibung.

  SELECTION-SCREEN BEGIN OF BLOCK loesung WITH FRAME TITLE TEXT-004.
    PARAMETERS:    p_loes     TYPE zalsu_db_ticket-loesung.
  SELECTION-SCREEN END OF BLOCK loesung.

SELECTION-SCREEN END OF SCREEN 200.

********************* Beginn aller Unterprogramme ********************************

********************* Abfrage der ALV-Tabelle ***********************************
FORM abfrage.
  SELECT
  FROM Zalsu_db_ticket
  LEFT JOIN zalsu_db_kunde ON zalsu_db_ticket~kundenid = zalsu_db_kunde~kundenid
  FIELDS *
    WHERE
    zalsu_DB_ticket~technikerid = '4' AND zalsu_db_ticket~status = 'IN BEARBEITUNG'
  INTO CORRESPONDING FIELDS OF TABLE @lt_ticket.
ENDFORM.

********************* build_fieldcatalog der ALV-Tabelle ********************************
FORM build_fieldcatalog.

  fieldcatalog-fieldname   = 'TicketID'.
  fieldcatalog-seltext_m   = 'TicketID'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 6.
  fieldcatalog-emphasize   = 'X'.
  fieldcatalog-key         = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Grossstoerung'.
  fieldcatalog-seltext_m   = 'GS'.
  fieldcatalog-col_pos     = 1.
  fieldcatalog-outputlen   = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Postleitzahl'.
  fieldcatalog-seltext_m   = 'Postleitzahl'.
  fieldcatalog-col_pos     = 2.
  fieldcatalog-outputlen   = 7.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Nachname'.
  fieldcatalog-seltext_m   = 'Nachname'.
  fieldcatalog-col_pos     = 3.
  fieldcatalog-outputlen   = 15.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Vorname'.
  fieldcatalog-seltext_m   = 'Vorname'.
  fieldcatalog-col_pos     = 4.
  fieldcatalog-outputlen   = 15.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Telefon'.
  fieldcatalog-seltext_m   = 'Telefon'.
  fieldcatalog-col_pos     = 5.
  fieldcatalog-outputlen   = 12.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Strasse'.
  fieldcatalog-seltext_m   = 'Strasse'.
  fieldcatalog-col_pos     = 6.
  fieldcatalog-outputlen   = 16.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Hausnummmer'.
  fieldcatalog-seltext_m   = 'Hausnr'.
  fieldcatalog-col_pos     = 7.
  fieldcatalog-outputlen   = 4.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Adresszusatz'.
  fieldcatalog-seltext_m   = 'Adresszusatz'.
  fieldcatalog-col_pos     = 8.
  fieldcatalog-outputlen   = 16.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Beschreibung'.
  fieldcatalog-seltext_m   = 'Beschreibung'.
  fieldcatalog-col_pos     = 9.
  fieldcatalog-outputlen   = 40.
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

********************* pf-status der ALV-Tabelle (GUI-Build) *************************
FORM pf_status USING rt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS' EXCLUDING rt_extab.
ENDFORM.

*********** Auswahl in der Liste und Absprung nach SELECTION-SCREEN 200 (Achtung Verschachtelung) **********
FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.
  CASE r_ucomm.
    WHEN 'CONFIRM'.
      READ TABLE lt_ticket INTO ls_ticket INDEX rs_selfield-tabindex.
  ENDCASE.

******* Absprung in den Selection-Screen 200 ************
  PERFORM selection.

ENDFORM.

******** Vorbereitung zum SELECTION-SCREEN 200   ************
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
  p_kstra = ls_ticket2-zalsu_db_kunde-strasse.
  p_khaus = ls_ticket2-zalsu_db_kunde-hausnummmer.
  p_ktel = ls_ticket2-zalsu_db_kunde-telefon.
  p_besch  = ls_ticket2-zalsu_db_ticket-beschreibung.
  p_kzaehl = ls_ticket2-zalsu_db_kunde-zaehlernummer.
  p_status = ls_ticket2-zalsu_db_ticket-status.
  p_tech = ls_ticket2-zalsu_db_technik-nachname.
  p_post = ls_ticket2-zalsu_db_kunde-postleitzahl.
  p_ort = ls_ticket2-zalsu_db_kunde-ort.
  p_zusa = ls_ticket2-zalsu_db_kunde-adresszusatz.


**************** Sprung zum SELECTION-SCREEN 200 **********************
  CALL SELECTION-SCREEN 200.

**************** Sprung zum Eingabe im SELECTION-SCREEN 200 *******

  LEAVE TO SCREEN 0.
ENDFORM.

************** IF-Verzweigung im SELECTION-SCREEN 200 *********************
FORM eingabe.
  DATA(ls_ticket3) = VALUE zalsu_db_ticket(
                                            ticketid = p_tickid
                                            loesung = p_loes ).
  IF p_loes IS NOT INITIAL.
    UPDATE zalsu_db_ticket SET status = 'ERLEDIGT' loesung = p_loes datum_erl = sy-datum
    WHERE ticketid = p_tickid.
    DATA(lv_message1) = |Das Ticket { p_tickid } wurde mit 'ERLEDIGT' geschlossen. { p_vname } { p_nname } wurde per E-Mail informiert.|.
    MESSAGE lv_message1 TYPE 'I'.
    PERFORM wiederholung.

  ELSEIF p_tickid IS INITIAL.
    LEAVE PROGRAM.

  ELSE.
    WRITE: 'Fehler.'.
  ENDIF.

ENDFORM.

START-OF-SELECTION.

  PERFORM eingabe.

FORM wiederholung.
  SUBMIT zalsu_techniker2.
ENDFORM.
