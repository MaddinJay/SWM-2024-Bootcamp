*&---------------------------------------------------------------------*
*& Report zalsu_sachbearbeiter4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_sachbearbeiter4.



TYPES: BEGIN OF t_ticket,
         sel,                          "stores which row user has selected
         Ticketid     TYPE zalsu_db_ticket-ticketid,
         Nachname     TYPE zalsu_db_kunde-nachname,
         Vorname      TYPE zalsu_db_kunde-vorname,
         Kategorie    TYPE zalsu_db_ticket-kategorie,
         Beschreibung TYPE zalsu_db_ticket-beschreibung,
         Saeumig      TYPE zalsu_db_kunde-saeumig,
         bestaetigt   TYPE abap_bool,
       END OF t_ticket.


DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
      gd_tab_group TYPE slis_t_sp_group_alv,
      gd_layout    TYPE slis_layout_alv,
      gd_repid     LIKE sy-repid,
      lt_ticket    TYPE TABLE OF t_ticket,
      ls_ticket    TYPE t_ticket,
      iv_nummer    TYPE zalsu_db_ticket-beschreibung.


START-OF-SELECTION.

  PERFORM abfrage.
  PERFORM build_fieldcatalog.
  PERFORM build_layout.
  PERFORM anzeige_alv_report.

  WRITE: 'test'.
  DATA(lo_instance) = NEW zalsu_sachbearbeiter(  ).
*      lo_instance = NEW #( ).
  lo_instance->open_selektionsbildschirm( iv_nummer ).


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
    WHERE
    status = 'neu'
  INTO CORRESPONDING FIELDS OF TABLE @lt_ticket.
ENDFORM.


FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.
  CASE r_ucomm.
    WHEN 'CONFIRM'.
      READ TABLE lt_ticket INTO ls_ticket INDEX rs_selfield-tabindex.
      cl_demo_output=>display( ls_ticket ).
      iv_nummer = ls_ticket-beschreibung.

      " ls_ticket ist global gefüllt.
*       Call Screen 200.

  ENDCASE.

ENDFORM.
