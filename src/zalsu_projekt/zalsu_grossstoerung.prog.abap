*&---------------------------------------------------------------------*
*& Report zalsu_grossstoerung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_grossstoerung.


************************* Beginn der ALV-TABELLE ****************************
SELECTION-SCREEN BEGIN OF SCREEN 100.

************************* alle Typesierungen der ALV-TABELLE ****************
  TYPES: BEGIN OF t_ticket,
           sel,                          "stores which row user has selected
           Postleitzahl TYPE zalsu_db_grsto-postleitzahl,
           Techniker    TYPE zalsu_db_grsto-techniker,
           bestaetigt   TYPE abap_bool,
         END OF t_ticket.


****** Types Auswahlliste - Techniker ***************************

  TYPE-POOLS: vrm.
  TYPES: BEGIN OF ls_technik,
           nachname TYPE zalsu_db_tech-nachname,
         END OF ls_technik.

******** DATA der ALV-Liste *************************************

  DATA: fieldcatalog TYPE slis_t_fieldcat_alv WITH HEADER LINE,
        gd_tab_group TYPE slis_t_sp_group_alv,
        gd_layout    TYPE slis_layout_alv,
        gd_repid     LIKE sy-repid,
        lt_grosto    TYPE TABLE OF t_ticket,
        ls_grosto    TYPE t_ticket,
        lv_exit      TYPE int1,

******** DATA der Auswahlliste - Techniker    *************

        gt_technik   TYPE STANDARD TABLE OF ls_technik,
        ls_tech      TYPE ls_technik,
        g_tech       TYPE vrm_id,
        it_values_t  TYPE vrm_values,
        wa_values_t  LIKE LINE OF it_values_t,
        lv_tech      TYPE zalsu_db_technik-technikerid,
        lt_kunde     TYPE TABLE OF zalsu_db_kunde,
        ls_kunde     TYPE zalsu_db_kunde,

        p_tech1      TYPE zalsu_db_grsto-techniker.


************************* Unterprogramme der ALV-Tabelle *****************
  PERFORM abfrage.
  PERFORM build_fieldcatalog.
  PERFORM build_layout.
  PERFORM anzeige_alv_report.

SELECTION-SCREEN END OF SCREEN 100.
************************* Beginn des Selection-Screen ****************************
SELECTION-SCREEN BEGIN OF SCREEN 200.

  SELECTION-SCREEN BEGIN OF BLOCK ticket WITH FRAME TITLE TEXT-001.
    PARAMETERS:    p_post     TYPE zalsu_db_grsto-postleitzahl.
  SELECTION-SCREEN END OF BLOCK ticket.

  SELECTION-SCREEN BEGIN OF BLOCK kunde WITH FRAME TITLE TEXT-002.
    PARAMETERS:    p_tech_z     TYPE zalsu_db_tech AS LISTBOX VISIBLE LENGTH 20.
  SELECTION-SCREEN END OF BLOCK kunde.


SELECTION-SCREEN END OF SCREEN 200.

******** Belegung der Techniker - Auswahlliste
AT SELECTION-SCREEN OUTPUT.

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

********************* Beginn aller Unterprogramme ********************************

********************* Abfrage der ALV-Tabelle ***********************************
FORM abfrage.
  SELECT
  FROM zalsu_db_grsto
  FIELDS * INTO CORRESPONDING FIELDS OF TABLE @lt_grosto.
ENDFORM.

********************* build_fieldcatalog der ALV-Tabelle ********************************
FORM build_fieldcatalog.

  fieldcatalog-fieldname   = 'Postleitzahl'.
  fieldcatalog-seltext_m   = 'Postleitzahl'.
  fieldcatalog-col_pos     = 0.
  fieldcatalog-outputlen   = 8.
  fieldcatalog-emphasize   = 'X'.
  fieldcatalog-key         = 'X'.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Techniker'.
  fieldcatalog-seltext_m   = 'Techniker'.
  fieldcatalog-col_pos     = 1.
  fieldcatalog-outputlen   = 12.
  APPEND fieldcatalog TO fieldcatalog.
  CLEAR  fieldcatalog.

  fieldcatalog-fieldname   = 'Auswahl'.
  fieldcatalog-seltext_m   = 'Auswahl'.
  fieldcatalog-col_pos     = 3.
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
      t_outtab                 = lt_grosto
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
      READ TABLE lt_grosto INTO ls_grosto INDEX rs_selfield-tabindex.

      IF ls_grosto-postleitzahl IS NOT INITIAL.
        DELETE FROM zalsu_db_grsto WHERE postleitzahl = ls_grosto-postleitzahl.
        DATA(lv_message1) = |Die Grossstörung aus dem Postleitzahlenraum { ls_grosto-postleitzahl } wurde entfernt|.
        MESSAGE lv_message1 TYPE 'I'.
        PERFORM wiederholung.

      ELSE.

      ENDIF.
  ENDCASE.

******* Absprung in den Selection-Screen 200 ************

  PERFORM selection.

ENDFORM.

******** Vorbereitung zum SELECTION-SCREEN 200   ************
FORM selection.
  SELECT SINGLE
    FROM zalsu_db_grsto
    FIELDS *
      WHERE zalsu_db_grsto~postleitzahl = @ls_grosto-postleitzahl
    INTO @DATA(ls_grosto2).

  p_post = ls_grosto2-postleitzahl.
  p_tech1 = ls_grosto2-techniker.

**************** Sprung zum SELECTION-SCREEN 200 **********************
  CALL SELECTION-SCREEN 200.

**************** Sprung zum Eingabe im SELECTION-SCREEN 200 *******

  LEAVE TO SCREEN 0.
ENDFORM.

************** IF-Verzweigung im SELECTION-SCREEN 200 *********************
FORM eingabe.

  SELECT SINGLE
      FROM zalsu_db_technik
      FIELDS *
      WHERE nachname = @p_tech_z-nachname
      INTO @DATA(ls_techniker1).
  lv_tech = ls_techniker1-technikerid.

  SELECT kundenid FROM zalsu_db_kunde INTO TABLE @lt_kunde WHERE postleitzahl = @p_post.

  DATA(ls_grosto3) = VALUE zalsu_db_grsto(
                                              postleitzahl = p_post
                                               ).
  INSERT INTO zalsu_db_grsto VALUES @(  VALUE
                                            #( postleitzahl = p_post
                                               techniker = p_tech_z )
                                               ).
  LOOP AT lt_kunde INTO ls_kunde.
    UPDATE zalsu_db_ticket SET grossstoerung = 'X', kundeninfo = 'X', status = 'IN BEARBEITUNG', technikerid = @lv_tech
    WHERE kundenid = @ls_kunde-kundenid AND kategorie = 'STROMSTÖRUNG' AND status = 'NEU'.

    IF sy-subrc <> 0.
    ENDIF.

  ENDLOOP.

  DATA(lv_message1) = |Es wurde eine Grossstörung im Postzahlenraum { p_post } aufgenommen und dem Techniker { p_tech_z-nachname } zugeordnet. Alle bestehenden und kommmenden Tickets werde Ihm zugewiesen. Alle Kunden wurden per Email verständigt|.
  MESSAGE lv_message1 TYPE 'I'.
  LEAVE PROGRAM.

ENDFORM.

START-OF-SELECTION.

  PERFORM eingabe.

FORM wiederholung.
  SUBMIT zalsu_grossstoerung.
ENDFORM.
