*&---------------------------------------------------------------------*
*& Report zalsu_sachbearbeiter2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_sachbearbeiter2.

SELECTION-SCREEN BEGIN OF SCREEN 100.

  TYPES: BEGIN OF t_ticket,
           sel,                          "stores which row user has selected
           Ticketid     TYPE zalsu_db_ticket-ticketid,
           Nachname     TYPE zalsu_db_kunde-nachname,
           Vorname      TYPE zalsu_db_kunde-vorname,
           Kategorie    TYPE zalsu_db_ticket-kategorie,
           Beschreibung TYPE zalsu_db_ticket-beschreibung,
           Saeumig      TYPE zalsu_db_kunde-saeumig,
           KTelefon     TYPE zalsu_db_kunde-telefon,
           bestaetigt   TYPE abap_bool,
         END OF t_ticket.

  TYPE-POOLS: vrm.
  TYPES: BEGIN OF ls_status,
           status TYPE zalsu_db_status,
         END OF ls_status.

  DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
        gd_tab_group TYPE slis_t_sp_group_alv,
        gd_layout    TYPE slis_layout_alv,
        gd_repid     LIKE sy-repid,
        lt_ticket    TYPE TABLE OF t_ticket,
        ls_ticket    TYPE t_ticket,
        iv_nummer    TYPE zalsu_db_ticket-beschreibung,
        gt_status    TYPE STANDARD TABLE OF ls_status,
        ls_stati     TYPE ls_status,
        g_id         TYPE vrm_id,
        it_values    TYPE vrm_values,
        wa_values    LIKE LINE OF it_values.


  PERFORM abfrage.
  PERFORM build_fieldcatalog.
  PERFORM build_layout.
  PERFORM anzeige_alv_report.

SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 200.
  PARAMETERS:    p_tickid     TYPE zalsu_db_ticket-ticketid.
  PARAMETERS:    p_nname     TYPE zalsu_db_kunde-nachname.
  PARAMETERS:    p_vname     TYPE zalsu_db_kunde-vorname.
  PARAMETERS:    p_kzaehl     TYPE zalsu_db_kunde-zaehlernummer.
  PARAMETERS:    p_ktel     TYPE zalsu_db_kunde-telefon.
  PARAMETERS:    p_kstra     TYPE zalsu_db_kunde-strasse.
  PARAMETERS:    p_khaus     TYPE zalsu_db_kunde-hausnummmer.
  PARAMETERS:    p_besch     TYPE zalsu_db_ticket-beschreibung.
  PARAMETERS:    p_stat_z     TYPE zalsu_db_status AS LISTBOX VISIBLE LENGTH 20.
  PARAMETERS:    p_tech     TYPE zalsu_db_technik-nachname.
  PARAMETERS:    p_loes     TYPE zalsu_db_ticket-loesung.








SELECTION-SCREEN END OF SCREEN 200.

SELECTION-SCREEN BEGIN OF SCREEN 300.

SELECTION-SCREEN END OF SCREEN 300.

AT SELECTION-SCREEN OUTPUT.
  SELECT
    FROM zalsu_db_status
    FIELDS status
    INTO TABLE @DATA(gt_status).

  LOOP AT gt_status INTO ls_stati.
    wa_values-key = ls_stati-status.
    APPEND wa_values TO it_values.
    CLEAR wa_values.
  ENDLOOP.

  g_id = 'p_stat_z'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = g_id
      values = it_values.


FORM build_fieldcatalog.

  fieldcatalog-fieldname   = 'TicketID'.
  fieldcatalog-seltext_m   = 'TicketID'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 10.
  fieldcatalog-emphasize   = 'X'.
  fieldcatalog-key         = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Nachname'.
  fieldcatalog-seltext_m   = 'Nachname'.
  fieldcatalog-col_pos     = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Vorname'.
  fieldcatalog-seltext_m   = 'Vorname'.
  fieldcatalog-col_pos     = 2.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Kategorie'.
  fieldcatalog-seltext_m   = 'Kategorie'.
  fieldcatalog-outputlen   = 14.
  fieldcatalog-col_pos     = 3.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Beschreibung'.
  fieldcatalog-seltext_m   = 'Beschreibung'.
  fieldcatalog-col_pos     = 4.
  fieldcatalog-outputlen   = 40.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Saeumig'.
  fieldcatalog-seltext_m   = 'Saeumig'.
  fieldcatalog-col_pos     = 5.
  fieldcatalog-outputlen = 5.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Auswahl'.
  fieldcatalog-seltext_m   = 'Auswahl'.
  fieldcatalog-col_pos     = 6.
  fieldcatalog-outputlen = 1.
  fieldcatalog-checkbox = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

ENDFORM.

FORM build_layout.
  gd_layout-box_fieldname     = 'SEL'.
  gd_layout-edit              = 'X'. "makes whole ALV table editable
  gd_layout-zebra             = 'X'.
ENDFORM.


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

FORM pf_status USING rt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS' EXCLUDING rt_extab.
ENDFORM.

FORM abfrage.
  SELECT
  FROM Zalsu_db_ticket
  LEFT JOIN zalsu_db_kunde ON zalsu_db_ticket~kundenid = zalsu_db_kunde~kundenid
  FIELDS *
*    WHERE
*    status = 'NEU'
  INTO CORRESPONDING FIELDS OF TABLE @lt_ticket.
ENDFORM.


FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.
  CASE r_ucomm.
    WHEN 'CONFIRM'.
      READ TABLE lt_ticket INTO ls_ticket INDEX rs_selfield-tabindex.
*      LEAVE TO SCREEN 0.
*      cl_demo_output=>display( ls_ticket ).
      SELECT SINGLE
        FROM Zalsu_db_ticket
        LEFT JOIN zalsu_db_kunde ON zalsu_db_ticket~kundenid = zalsu_db_kunde~kundenid
        LEFT JOIN zalsu_db_technik ON zalsu_db_ticket~technikerid = zalsu_db_technik~technikerid
        FIELDS *
          WHERE
          zalsu_db_ticket~ticketid = @ls_ticket-ticketid
        INTO @DATA(ls_ticket2).

*       cl_demo_output=>display( ls_ticket2 ).

      p_tickid  = ls_ticket2-zalsu_db_ticket-ticketid.
      p_nname = ls_ticket2-zalsu_db_kunde-nachname.
      p_vname = ls_ticket2-zalsu_db_kunde-vorname.
      p_ktel = ls_ticket2-zalsu_db_kunde-telefon.
      p_besch  = ls_ticket2-zalsu_db_ticket-beschreibung.
      p_kstra = ls_ticket2-zalsu_db_kunde-strasse.
      p_khaus = ls_ticket2-zalsu_db_kunde-hausnummmer.
      p_kzaehl = ls_ticket2-zalsu_db_kunde-zaehlernummer.
*      p_status = ls_ticket2-zalsu_db_ticket-status.
      p_tech = ls_ticket2-zalsu_db_technik-nachname.


*      LEAVE TO SCREEN 0.
      CALL SELECTION-SCREEN 200.

      DATA(ls_ticket3) = VALUE zalsu_db_ticket(
                                                ticketid = p_tickid
                                                technikerid = p_tech
                                                loesung = p_loes ).

      UPDATE zalsu_db_ticket SET loesung = p_loes technikerid = p_tech
      WHERE ticketid = p_tickid.
      LEAVE TO SCREEN 0.

  ENDCASE.
ENDFORM.


START-OF-SELECTION.

*  SELECT SINGLE
*    FROM Zalsu_db_ticket
*    LEFT JOIN zalsu_db_kunde ON zalsu_db_ticket~kundenid = zalsu_db_kunde~kundenid
*    LEFT JOIN zalsu_db_technik ON zalsu_db_ticket~technikerid = zalsu_db_technik~technikerid
*    FIELDS *
*      WHERE
*      zalsu_db_ticket~ticketid = @ls_ticket-ticketid
*    INTO @DATA(ls_ticket2).
*
**       cl_demo_output=>display( ls_ticket2 ).
*
*  p_tickid  = ls_ticket2-zalsu_db_ticket-ticketid.
*  p_nname = ls_ticket2-zalsu_db_kunde-nachname.
*  p_vname = ls_ticket2-zalsu_db_kunde-vorname.
*  p_ktel = ls_ticket2-zalsu_db_kunde-telefonnummer.
*  p_besch  = ls_ticket2-zalsu_db_ticket-beschreibung.
*  p_kstra = ls_ticket2-zalsu_db_kunde-strasse.
*  p_khaus = ls_ticket2-zalsu_db_kunde-hausnummmer.
*  p_kzaehl = ls_ticket2-zalsu_db_kunde-zaehlernummer.
*  p_status = ls_ticket2-zalsu_db_ticket-status.
*  p_tech = ls_ticket2-zalsu_db_technik-nachname.
*
*  LEAVE TO SCREEN 0.
*  CALL SELECTION-SCREEN 200.

*  DATA(ls_ticket3) = VALUE zalsu_db_ticket(
*                                            ticketid = p_tickid
*                                            loesung = p_loes ).
*
*  UPDATE zalsu_db_ticket SET loesung = p_loes WHERE ticketid = p_tickid.
