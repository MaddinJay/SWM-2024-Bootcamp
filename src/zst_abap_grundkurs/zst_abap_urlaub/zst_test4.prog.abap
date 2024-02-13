*&---------------------------------------------------------------------*
*& Report zst_test4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_test4.


SELECTION-SCREEN BEGIN OF BLOCK abc.
  PARAMETERS: p_knr    TYPE z02_t_edm-kundennummer OBLIGATORY,
              p_auftr  TYPE z02_t_edm-auftragsnummer OBLIGATORY,
              p_vorna  TYPE z02_t_edm-vorname OBLIGATORY,
              p_nachna TYPE z02_t_edm-nachname OBLIGATORY,
              p_tel    TYPE z02_t_edm-telefonnummer OBLIGATORY,
              p_email  TYPE z02_t_edm-email OBLIGATORY,
              p_datum  TYPE z02_t_edm-datum DEFAULT sy-datum OBLIGATORY,
              p_zst    TYPE z02_t_edm-zst OBLIGATORY,
              p_aprs   TYPE z02_t_edm-arbeitspreis OBLIGATORY DEFAULT '33.77' MODIF ID sp1.
SELECTION-SCREEN END OF BLOCK abc.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-group1 = 'SP1'.
      screen-input = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

**********************************************************************
*lokale Klasse
**********************************************************************
CLASS lcl_handle_events DEFINITION.
  PUBLIC SECTION.
    METHODS: on_click FOR EVENT added_function OF cl_salv_events.
ENDCLASS.

CLASS lcl_handle_events IMPLEMENTATION.
  METHOD on_click.
    MESSAGE 'Daten wurden erfasst!' TYPE 'I' .
  ENDMETHOD.                    "on_click
ENDCLASS.                    "lcl_handle_event

START-OF-SELECTION.                         "Muss nach AT SELECTION-SCREEN OUTPUT hingeschrieben werden, damit das Programm danach startet
  DATA go_energiedaten TYPE REF TO zcl_z02_energiedaten.

  go_energiedaten = NEW #( ).

  go_energiedaten->insert( iv_knr = p_knr iv_auftr = p_auftr iv_vorname = p_vorna iv_nachname = p_nachna iv_tel = p_tel iv_email = p_email iv_datum = p_datum iv_zst = p_zst iv_aprs = p_aprs ).

  TYPES: BEGIN OF t_energie,
           sel,                          "stores which row user has selected
           kundennummer   TYPE z02_t_edm-kundennummer,
           auftragsnummer TYPE z02_t_edm-auftragsnummer,
           vorname        TYPE z02_t_edm-vorname,
           nachname       TYPE z02_t_edm-nachname,
           telefonnummer  TYPE z02_t_edm-telefonnummer,
           email          TYPE z02_t_edm-email,
           datum          TYPE z02_t_edm-datum,
           zst            TYPE z02_t_edm-zst,
           arbeitspreis   TYPE z02_t_edm-arbeitspreis,
           bestaetigt     TYPE z02_t_edm-bestaetigt,
           confirm        TYPE abap_bool,
         END OF t_energie.

  DATA lt_energie TYPE TABLE OF t_energie.
  DATA ls_energie TYPE t_energie.
  DATA wa_ekko TYPE TABLE OF t_energie WITH HEADER LINE.

  DATA: go_alv        TYPE REF TO cl_salv_table,
        alv_functions TYPE REF TO cl_salv_functions_list.
  DATA: gr_columns   TYPE REF TO cl_salv_columns_table.
  DATA: gr_column    TYPE REF TO cl_salv_column_table.
  DATA: gr_events    TYPE REF TO cl_salv_events_table.

  DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
        gd_tab_group TYPE slis_t_sp_group_alv,
        gd_layout    TYPE slis_layout_alv,
        gd_repid     LIKE sy-repid.


*  DATA event_handler TYPE REF TO lcl_handle_events.
*  SET PF-STATUS 'STANDARD'.
*  go_alv->set_screen_status(
*     pfstatus      =  'STANDARD'
*     report       = sy-repid
*     set_functions = go_alv->c_functions_all ).
*  gr_events = go_alv->get_event( ).
*  CREATE OBJECT event_handler.
*  SET HANDLER event_handler->on_click FOR gr_events.
*  gd_repid = sy-repid.

START-OF-SELECTION.


  PERFORM data_retrieval.
  PERFORM build_fieldcatalog.
  PERFORM build_layout.
  PERFORM display_alv_report.


*&---------------------------------------------------------------------*
*&      Form  BUILD_FIELDCATALOG
*&---------------------------------------------------------------------*
*       Build Fieldcatalog for ALV Report
*----------------------------------------------------------------------*
FORM build_fieldcatalog.

  fieldcatalog-fieldname   = 'Kundennummer'.
  fieldcatalog-seltext_m   = 'Kundennummer'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 10.
  fieldcatalog-emphasize   = 'X'.
  fieldcatalog-key         = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Auftragsnummer'.
  fieldcatalog-seltext_m   = 'Auftragsnummer'.
  fieldcatalog-col_pos     = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Vorname'.
  fieldcatalog-seltext_m   = 'Vorname'.
  fieldcatalog-col_pos     = 2.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Nachname'.
  fieldcatalog-seltext_m   = 'Nachname'.
  fieldcatalog-col_pos     = 3.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Telefonnummer'.
  fieldcatalog-seltext_m   = 'Telefonnummer'.
  fieldcatalog-col_pos     = 4.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'EMail'.
  fieldcatalog-seltext_m   = 'EMail'.
  fieldcatalog-col_pos     = 5.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Datum'.
  fieldcatalog-seltext_m = 'Datum'.
  fieldcatalog-col_pos     = 6.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'ZST'.
  fieldcatalog-seltext_m   = 'ZST'.
  fieldcatalog-col_pos     = 7.

  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Arbeitspreis'.
  fieldcatalog-seltext_m   = 'Arbeitspreis'.
  fieldcatalog-col_pos     = 8.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Bestaetigt'.
  fieldcatalog-seltext_m   = 'Bestaetigt'.
  fieldcatalog-col_pos     = 8.
  fieldcatalog-outputlen   = 1. " Länge 1 für die Checkbox
  fieldcatalog-checkbox  = 'X'. " Checktable für die Checkbox
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.
ENDFORM.


*&---------------------------------------------------------------------*
*&      Form  BUILD_LAYOUT
*&---------------------------------------------------------------------*
*       Build layout for ALV grid report
*----------------------------------------------------------------------*
FORM build_layout.
  gd_layout-box_fieldname     = 'SEL'.
  "set field name to store row selection
  gd_layout-edit              = 'X'. "makes whole ALV table editable
  gd_layout-zebra             = 'X'.
ENDFORM.                    " BUILD_LAYOUT
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV_REPORT
*&---------------------------------------------------------------------*
*       Display report using ALV grid
*----------------------------------------------------------------------*





FORM display_alv_report.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = gd_repid
      i_callback_user_command = 'USER_COMMAND'
      is_layout               = gd_layout
      it_fieldcat             = fieldcatalog[]
      i_save                  = 'X'
    TABLES
      t_outtab                = lt_energie
    EXCEPTIONS
      program_error           = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
  ENDIF.

ENDFORM.              " DISPLAY_ALV_REPORT

*&---------------------------------------------------------------------*
*&      Form  DATA_RETRIEVAL
*&---------------------------------------------------------------------*
*       Retrieve data form EKPO table and populate itab it_ekko
*----------------------------------------------------------------------*

FORM data_retrieval.
  SELECT
  FROM z02_t_edm
  FIELDS *
*    WHERE
*    kundennummer = @p_knr
  INTO CORRESPONDING FIELDS OF TABLE @lt_energie.
ENDFORM.

*------------------------------------------------------------------*
*       FORM USER_COMMAND                                          *
*------------------------------------------------------------------*
*       --> R_UCOMM                                                *
*       --> RS_SELFIELD                                            *
*------------------------------------------------------------------*
START-OF-SELECTION.
FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.

  CASE r_ucomm.

*    WHEN '&DATA_SAVE'.
*      LOOP AT lt_energie INTO wa_ekko.
*      ENDLOOP.
*      INSERT INTO z02_t_edm VALUES @(  VALUE
*         #( kundennummer = wa_ekko-kundennummer
*            auftragsnummer = wa_ekko-auftragsnummer
*            vorname = wa_ekko-vorname
*            nachname = wa_ekko-nachname
*            telefonnummer = wa_ekko-telefonnummer
*            email = wa_ekko-email
*            datum = wa_ekko-datum
*            zst = wa_ekko-zst
*            arbeitspreis = wa_ekko-arbeitspreis
*            bestaetigt = wa_ekko-bestaetigt  ) ).


    WHEN '&IC1'.
      IF rs_selfield-fieldname = 'Kundennummer'.
        READ TABLE lt_energie INTO wa_ekko INDEX rs_selfield-tabindex.
        SET PARAMETER ID 'BES' FIELD wa_ekko-kundennummer.
        CALL TRANSACTION 'ME23N' AND SKIP FIRST SCREEN.
      ENDIF.

    WHEN '&DATA_SAVE'.  "user presses SAVE
      LOOP AT lt_energie INTO wa_ekko.
        IF wa_ekko-sel EQ 'X'.
          wa_ekko-bestaetigt = wa_ekko-confirm.

          UPDATE z02_t_edm SET
            bestaetigt = wa_ekko-bestaetigt
          WHERE
            kundennummer = wa_ekko-kundennummer
            AND auftragsnummer = wa_ekko-auftragsnummer.

            COMMIT WORK.
        ENDIF.
      ENDLOOP.
  ENDCASE.

ENDFORM.
