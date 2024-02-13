*&---------------------------------------------------------------------*
*& Report zst_test3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_test3.

TABLES:     ekko.

TYPE-POOLS: slis.                                 "ALV Declarations
*Data Declaration
*----------------
TYPES: BEGIN OF t_ekko,
         sel,                         "stores which row user has selected
         kundennummer   TYPE z02_e_kundennummer,
         auftragsnummer TYPE z02_e_auftragsnummer,
         vorname        TYPE z02_e_vorname,
         nachname       TYPE z02_e_nachname,
         telefonnummer  TYPE z02_e_telefon,
         email          TYPE z02_e_email,
         datum          TYPE z02_e_datum,
         zst            TYPE z02_e_zst,
         arbeitspreis   TYPE z02_e_arbeitspreis,
       END OF t_ekko.

DATA:       it_ekko TYPE STANDARD TABLE OF t_ekko INITIAL SIZE 0,
            wa_ekko TYPE t_ekko.

*ALV data declarations
DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
      gd_tab_group TYPE slis_t_sp_group_alv,
      gd_layout    TYPE slis_layout_alv,
      gd_repid     LIKE sy-repid.


************************************************************************
*Start-of-selection.
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

* There are a number of ways to create a fieldcat.
* For the purpose of this example i will build the fieldcatalog manualy
* by populating the internal table fields individually and then
* appending the rows. This method can be the most time consuming but can
* also allow you  more control of the final product.

* Beware though, you need to ensure that all fields required are
* populated. When using some of functionality available via ALV, such as
* total. You may need to provide more information than if you were
* simply displaying the result
*               I.e. Field type may be required in-order for
*                    the 'TOTAL' function to work.

fieldcatalog-fieldname   = 'Kundennummer'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 10.
  fieldcatalog-emphasize   = 'X'.
  fieldcatalog-key         = 'X'.
*  fieldcatalog-do_sum      = 'X'.
*  fieldcatalog-no_zero     = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Auftragsnummer'.
  fieldcatalog-col_pos     = 1.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Vorname'.
  fieldcatalog-col_pos     = 2.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Nachname'.
  fieldcatalog-col_pos     = 3.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Telefonnummer'.
  fieldcatalog-col_pos     = 4.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'EMail'.
  fieldcatalog-col_pos     = 5.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Datum'.
  fieldcatalog-col_pos     = 6.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Zählerstand'.
  fieldcatalog-col_pos     = 7.

  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

fieldcatalog-fieldname   = 'Arbeitspreis'.
  fieldcatalog-col_pos     = 8.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.
ENDFORM.                    " BUILD_FIELDCATALOG


*&---------------------------------------------------------------------*
*&      Form  BUILD_LAYOUT
*&---------------------------------------------------------------------*
*       Build layout for ALV grid report
*----------------------------------------------------------------------*
FORM build_layout.
  gd_layout-box_fieldname     = 'SEL'.
  "set field name to store row selection
  gd_layout-edit              = 'X'. "makes whole ALV table editable
*  gd_layout-zebra             = 'X'.
ENDFORM.                    " BUILD_LAYOUT


*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV_REPORT
*&---------------------------------------------------------------------*
*       Display report using ALV grid
*----------------------------------------------------------------------*
FORM display_alv_report.
  gd_repid = sy-repid.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = gd_repid
*     i_callback_top_of_page  = 'TOP-OF-PAGE'  "see FORM
      i_callback_user_command = 'USER_COMMAND'
*     i_grid_title            = outtext
      is_layout               = gd_layout
      it_fieldcat             = fieldcatalog[]
*     it_special_groups       = gd_tabgroup
*     IT_EVENTS               = GT_XEVENTS
      i_save                  = 'X'
*     is_variant              = z_template
    TABLES
      t_outtab                = it_ekko
    EXCEPTIONS
      program_error           = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
ENDFORM.                    " DISPLAY_ALV_REPORT


*&---------------------------------------------------------------------*
*&      Form  DATA_RETRIEVAL
*&---------------------------------------------------------------------*
*       Retrieve data form EKPO table and populate itab it_ekko
*----------------------------------------------------------------------*
FORM data_retrieval.

 SELECT
    FROM z02_t_edm
    FIELDS *
*  WHERE
*  kundennummer = @p_knr
    INTO CORRESPONDING FIELDS OF TABLE @it_ekko.
ENDFORM.                    " DATA_RETRIEVAL


*------------------------------------------------------------------*
*       FORM USER_COMMAND                                          *
*------------------------------------------------------------------*
*       --> R_UCOMM                                                *
*       --> RS_SELFIELD                                            *
*------------------------------------------------------------------*
FORM user_command USING r_ucomm LIKE sy-ucomm
                  rs_selfield TYPE slis_selfield.

* Check function code
  CASE r_ucomm.
    WHEN '&IC1'.
*   Check field clicked on within ALVgrid report
      IF rs_selfield-fieldname = 'Kundennummer'.
*     Read data table, using index of row user clicked on
        READ TABLE it_ekko INTO wa_ekko INDEX rs_selfield-tabindex.
*     Set parameter ID for transaction screen field
        SET PARAMETER ID 'BES' FIELD wa_ekko-kundennummer.
*     Sxecute transaction ME23N, and skip initial data entry screen
        CALL TRANSACTION 'ME23N' AND SKIP FIRST SCREEN.
      ENDIF.

    WHEN '&DATA_SAVE'.  "user presses SAVE
      LOOP AT it_ekko INTO wa_ekko.
        IF wa_ekko-sel EQ 'X'.
*       Process records that have been selected
        ENDIF.
      ENDLOOP.
  ENDCASE.
ENDFORM.
