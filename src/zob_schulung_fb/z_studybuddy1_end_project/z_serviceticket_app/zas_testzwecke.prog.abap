*&---------------------------------------------------------------------*
*& Report zas_testzwecke
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_testzwecke.
*TYPE-POOLS: vrm.


*SELECT SINGLE
*FROM zdb_sto24
*FIELDS
*kundennr AS letzte_Stoerung
*WHERE bearb_status > 1
*INTO @DATA(lv_stonr).
*
*


*    SELECT
*    FROM zdb_sto24
*    FIELDS *
*    INTO TABLE @DATA(lt_stoerung).*
*
*    "Prüfung, ob es den Eintrag bisher gibt, funktioniert
*    LOOP AT lt_stoerung INTO DATA(ls_stoerung).                         "Loop über Bedingungen versuchen
*      IF ls_stoerung-kundennr = ip_kdnr AND ls_stoerung-kommentar = ip_kommi AND ls_stoerung-sto_grund = ip_sgrund AND ls_stoerung-datum = ip_datum.
*
*        DATA(lv_message3) = |Der Eintrag wurde bereits erfasst! |.
*        MESSAGE lv_message3 TYPE 'I'.
*     Endloop.
*
"   Lv_sto = '4000'. "Hier wird die Störungsnummer automatisch generiert (+1 gezählt)

*    IF sy-subrc = 4.


*
*SELECTION-SCREEN BEGIN OF BLOCK Stoerung WITH FRAME TITLE TEXT-001.
*  PARAMETERS: p_kdnr   TYPE zkdnr OBLIGATORY, "DEFAULT lv_stonr OBLIGATORY,
*              p_sgrund TYPE zkommentar OBLIGATORY,
*              p_kommi  TYPE zkommentar OBLIGATORY,
*              p_datum  TYPE frmdatum DEFAULT sy-datum OBLIGATORY.
*SELECTION-SCREEN END OF BLOCK stoerung.
*
*
*SELECTION-SCREEN BEGIN OF BLOCK Techniker WITH FRAME TITLE TEXT-002.
*  TYPES: BEGIN OF ls_tech,
*           nachname TYPE znachname,
*         END OF ls_tech.
*SELECTION-SCREEN END OF BLOCK Techniker.
*
*
*" optimieren
*DATA: it_tech    TYPE STANDARD TABLE OF ls_tech,
*      ls_technik TYPE ls_tech.
*
*DATA: g_id      TYPE vrm_id,
*      it_values TYPE vrm_values,
*      wa_values LIKE LINE OF it_values.
*
**SELECTION-SCREEN begin of block rahmen2 with frame title text-002.
**PARAMETERS: p_tech as CHECKBOX USER-COMMAND ddd.
*
*SELECTION-SCREEN BEGIN OF BLOCK rahmen2 WITH FRAME TITLE TEXT-002.
*  PARAMETERS: p_tech TYPE znachname AS LISTBOX VISIBLE LENGTH 10.
*SELECTION-SCREEN END OF BLOCK rahmen2.
*
*SELECTION-SCREEN BEGIN OF BLOCK rahmen3 WITH FRAME TITLE TEXT-003.
*  PARAMETERS: p_radio1 RADIOBUTTON GROUP app,
*              p_radio2 RADIOBUTTON GROUP app,
*              p_radio3 RADIOBUTTON GROUP app.
*SELECTION-SCREEN END OF BLOCK rahmen3.
*
**** Radiobutton 1 -> Störungen anzeigen
**** Radiobutton 2 -> Störung abschließen
**** Radiobutton 3 -> Status Kunde informiert setzen
*
*AT SELECTION-SCREEN OUTPUT.
**  IF p_tech EQ abap_true.
**    LOOP AT SCREEN.
**      IF screen-group1 = 'SC2'.
**        screen-active = 1.
**        MODIFY SCREEN.
**      ENDIF.
**    ENDLOOP.
**  ELSE.
**    LOOP AT SCREEN.
**      IF screen-group1 = 'SC2'.
**        screen-active = 0.
**        MODIFY SCREEN.
**      ENDIF.
**    ENDLOOP.
**  ENDIF.
*
*
*
*  SELECT
*  FROM zdb_technik24
*  FIELDS
*  nachname
*  WHERE v_status = 'X'
*  INTO TABLE @it_tech.
*
*
*
*  LOOP AT it_tech INTO ls_technik.
*    wa_values-key = ls_technik-nachname.
*    wa_values-text = ls_technik-nachname.
*    APPEND wa_values TO it_values.
*    CLEAR wa_values.
*  ENDLOOP.
*
*
*  g_id = 'P_TECH'.
*  CALL FUNCTION 'VRM_SET_VALUES'
*    EXPORTING
*      id     = g_id
*      values = it_values.
**    EXCEPTIONS
**      id_illegal_name = 1
**      OTHERS          = 2.
*
*
**
*
*  DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ).
*
*"If Schleife: Die Methode sto_erfassen wird sonst direkt beim Programmstart ausgeführt und die Tabelle
*"wird mit einer neuen Zeile versehen.
*  IF p_kdnr IS NOT INITIAL.
*    lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ip_sgrund = p_sgrund ip_kommi = p_kommi ip_datum = p_datum ).
*  ENDIF.
**
**  z_class_sb=>sto_abrufen( ip_kdnr = p_kdnr ).
**
**  lo_sto_erfassen->tech_zuweisen( ip_tech = p_tech ).
*
*
**
*
**UPDATE zdb_sto24 SET bearb_status = 'Erledigt' WHERE stonr = '4001'.
**IF sy-subrc = 0.
**  WRITE 'Der Befehl war erfolgreich'.
**ELSE.
**  WRITE 'Der Befehl war nicht(!) erfolgreich'.
**ENDIF.

* PARAMETERS: p_kdnr   TYPE zdb_sto24-stonr OBLIGATORY.
*SELECTION-SCREEN SKIP.
*
** PUSHBUTTON für Anzeige / User-Command: 'SHOW'
*SELECTION-SCREEN BEGIN OF LINE.
*  SELECTION-SCREEN PUSHBUTTON 2(35) anzeige USER-COMMAND show.
*SELECTION-SCREEN END OF LINE.
*
*SELECTION-SCREEN BEGIN OF LINE.
*  SELECTION-SCREEN PUSHBUTTON 2(35) zurueck USER-COMMAND onli.
*SELECTION-SCREEN END OF LINE.
*
*
*
**SELECTION-SCREEN: SKIP 1.
*
*
*INITIALIZATION.
*  anzeige = 'Show'.
*  zurueck = 'Onli'.
**
**
*AT SELECTION-SCREEN.
*DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ).
*  SELECT
*  FROM zdb_sto24
*  FIELDS *
*  INTO TABLE @DATA(lt_spfli).
*
*  DATA(o_alv) = NEW cl_gui_alv_grid(
*  i_parent = cl_gui_container=>default_screen
*  i_appl_events = abap_true ).
*
*  DATA: o_salv TYPE REF TO cl_salv_table.
*
*  cl_salv_table=>factory( IMPORTING r_salv_table = o_salv
*  CHANGING
*  t_table = lt_spfli ).
*
*  DATA(it_fcat) = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns = o_salv->get_columns( )
*  r_aggregations = o_salv->get_aggregations( ) ).
*
*  DATA(lv_layout) = VALUE lvc_s_layo( zebra = abap_true grid_title = 'Flightconnections' ).
*
*  o_alv->set_table_for_first_display( EXPORTING is_layout = lv_layout
*  CHANGING
*  it_fieldcatalog = it_fcat
*  it_outtab = lt_spfli ).
*
*o_salv->get_sorts(  )->add_sort( columnname = 'STONR' sequence = if_salv_c_sort=>sort_down ). "Absteigend nach der STONR sortieren
*
*LOOP AT o_salv->get_columns(  )->get(  ) ASSIGNING FIELD-SYMBOL(<c>).    "Loop über alle Zeilen
*  DATA(o_col) = <c>-r_column.
*ENDLOOP.

*  WRITE: space.

*START-OF-SELECTION.
* Wenn User-Command 'ONLI' (Ausführen) gedrückt wurde
**********************************************************************
*  CASE sy-ucomm.
*    WHEN 'SHOW'.
*       zmaf_class_sb=>sto_abrufen( ).
*    WHEN 'ONLI'.
*      WRITE: 'NEIN'.
*  ENDCASE.
**
*  START-OF-SELECTION.


SELECT
    FROM zdb_sto24  left JOIN zdb_custom24 ON zdb_sto24~kundennr = zdb_custom24~kdnr
    FIELDS  zdb_sto24~stonr, zdb_sto24~sto_grund, zdb_sto24~kundennr, zdb_sto24~datum, zdb_sto24~uhrzeit, zdb_sto24~kommentar, zdb_sto24~bearb_status, ZDB_CUSTOM24~vorname, ZDB_CUSTOM24~nachname, zdb_custom24~kontakt, zdb_custom24~email
    INTO TABLE @DATA(lt_sto).
cl_demo_output=>display( lt_sto ).
