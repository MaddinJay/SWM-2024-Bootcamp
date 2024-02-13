*&---------------------------------------------------------------------*
*& Report z02_energiedaten
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_energiedaten.

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
         kommentar      TYPE z02_t_edm-kommentar,
         bestaetigt     TYPE abap_bool,
       END OF t_energie.

DATA go_energiedaten TYPE REF TO zcl_z02_energiedaten.
DATA lt_energie TYPE TABLE OF t_energie.
DATA ls_energie TYPE t_energie.

DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
      gd_tab_group TYPE slis_t_sp_group_alv,
      gd_layout    TYPE slis_layout_alv,
      gd_repid     LIKE sy-repid.

SELECTION-SCREEN BEGIN OF BLOCK abc.
  PARAMETERS: p_knr    TYPE z02_t_edm-kundennummer OBLIGATORY DEFAULT 123456,
              p_auftr  TYPE z02_t_edm-auftragsnummer OBLIGATORY DEFAULT 1239,
              p_vorna  TYPE z02_t_edm-vorname OBLIGATORY DEFAULT 'Thomas',
              p_nachna TYPE z02_t_edm-nachname OBLIGATORY DEFAULT 'Müller',
              p_tel    TYPE z02_t_edm-telefonnummer OBLIGATORY DEFAULT 01721234567,
              p_email  TYPE z02_t_edm-email OBLIGATORY DEFAULT 'mueller@bayern.de',
              p_datum  TYPE z02_t_edm-datum DEFAULT sy-datum OBLIGATORY,
              p_zst    TYPE z02_t_edm-zst OBLIGATORY DEFAULT 5500,
              p_komm  TYPE z02_t_edm-kommentar DEFAULT 'Höherer Verbrauch wegen Trocknungsgeräten',
              p_aprs   TYPE z02_t_edm-arbeitspreis OBLIGATORY DEFAULT '33.77' MODIF ID sp1.
SELECTION-SCREEN END OF BLOCK abc.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-Group1 = 'SP1'.
      screen-input = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.                         "Muss nach AT SELECTION-SCREEN OUTPUT hingeschrieben werden, damit das Programm danach startet

  go_energiedaten = NEW #( ).
  go_energiedaten->insert( iv_knr = p_knr iv_auftr = p_auftr iv_vorname = p_vorna iv_nachname = p_nachna iv_tel = p_tel iv_email = p_email iv_datum = p_datum iv_zst = p_zst iv_aprs = p_aprs iv_komm = p_komm ).


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

  fieldcatalog-fieldname   = 'Kommentar'.
  fieldcatalog-seltext_m   = 'Kommentar'.
  fieldcatalog-col_pos     = 9.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Bestaetigt'.
  fieldcatalog-seltext_m   = 'Bestaetigt'.
  fieldcatalog-col_pos     = 10.
  fieldcatalog-outputlen = 1.
  fieldcatalog-checkbox = 'X'.
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
  gd_layout-edit              = 'X'. "makes whole ALV table editable
  gd_layout-zebra             = 'X'.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV_REPORT
*&---------------------------------------------------------------------*
*       Display report using ALV grid
*----------------------------------------------------------------------*
FORM display_alv_report.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = sy-repid
      i_callback_pf_status_set = 'PF_STATUS' "Menüband aus GUI-Status übernommen wird
      i_callback_user_command  = 'USER_COMMAND' "Reagiert auf User-klick
      is_layout                = gd_layout
      it_fieldcat              = fieldcatalog[]
      i_save                   = 'X'
    TABLES
      t_outtab                 = lt_energie
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
  ENDIF.
ENDFORM.                    " DISPLAY_ALV_REPORT

FORM pf_status USING rt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS' EXCLUDING rt_extab.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  DATA_RETRIEVAL
*&---------------------------------------------------------------------*
*       Retrieve data form EKPO table and populate itab it_ekko
*----------------------------------------------------------------------*
FORM data_retrieval.
  SELECT
  FROM z02_t_edm
  FIELDS *
    WHERE
    kundennummer = @p_knr
  INTO CORRESPONDING FIELDS OF TABLE @lt_energie.
ENDFORM.

*------------------------------------------------------------------*
*       FORM USER_COMMAND                                          *
*------------------------------------------------------------------*
*       --> R_UCOMM                                                *
*       --> RS_SELFIELD                                            *
*------------------------------------------------------------------*
FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.
  CASE r_ucomm.
    WHEN 'CONFIRM'.
      READ TABLE lt_energie INTO ls_energie INDEX rs_selfield-tabindex.
      UPDATE z02_t_edm SET bestaetigt = 'X' WHERE kundennummer = ls_energie-kundennummer AND auftragsnummer = ls_energie-auftragsnummer.
      MESSAGE 'Zählerstand wurde bestätigt!' TYPE 'I'.
      LEAVE PROGRAM.
  ENDCASE.
ENDFORM.
