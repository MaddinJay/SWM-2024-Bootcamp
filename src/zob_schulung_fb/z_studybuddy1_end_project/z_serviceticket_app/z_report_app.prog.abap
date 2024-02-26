*&---------------------------------------------------------------------*
*& Report z_report_app
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_report_app.


**PARAMETERS: p_kdnr   TYPE zkdnr OBLIGATORY,
**            p_sgrund TYPE zkommentar OBLIGATORY,
**            p_kommi  TYPE zkommentar,
**            p_datum  TYPE frmdatum DEFAULT sy-datum OBLIGATORY.
**
**
**DATA(lo_sto_erfassen) = NEW z_class_sb(  ).

*Parameters: p_1 type ZMUL_DE_STATUS.

*
*select
*from zdb_technik24
*right join ZDB_STO24 as STO24 on zdb_technik24~stonr = sto24~stonr
*RIGHT join zdb_custom24 as Custom on sto24~kundennr =  custom~kdnr
*FIELDS *
*into table @data(it_sto23).
*
*
Select
from zdb_technik24 as technik
"inner join zdb_sto24 as sto24 on technik~ = sto24~stonr
Fields *
into table @data(it_sto23).

DATA: lo_salv TYPE REF TO cl_salv_table.

    cl_salv_table=>factory( IMPORTING
                              r_salv_table = lo_salv
                            CHANGING
                              t_table      = it_sto23 ).


 DATA(lo_func) = lo_salv->get_functions( ).

"lo_func->set_default( if_salv_c_bool_sap=>true ).

lo_salv->display( ).


***********************************************************************
**
** Variablen
**
***********************************************************************
*DATA: gv_screen_status TYPE string VALUE 'INIT'.
*DATA: gv_carrid   TYPE spfli-carrid.
*DATA: gv_connid TYPE spfli-connid.
*DATA: o_alv TYPE REF TO cl_gui_alv_grid.
*DATA: it_spfli TYPE STANDARD TABLE OF spfli WITH DEFAULT KEY.
***********************************************************************
**
** leeres Dynpro als Dummy für ALV-Grid
**
***********************************************************************
*SELECTION-SCREEN BEGIN OF SCREEN 2000.
*SELECTION-SCREEN END OF SCREEN 2000.
***********************************************************************
**
** SELECTION-SCREEN
**
***********************************************************************
*SELECT-OPTIONS: so_carr FOR gv_carrid.
*SELECT-OPTIONS: so_conn FOR gv_connid.
***********************************************************************
**
** Eventhandler
**
***********************************************************************
*CLASS lcl_events DEFINITION.
*
*  PUBLIC SECTION.
*
*    CLASS-METHODS:
*      on_toolbar FOR EVENT toolbar OF cl_gui_alv_grid
*        IMPORTING
*            e_object
*            e_interactive
*            sender.
*
*    CLASS-METHODS:
*      on_user_command FOR EVENT user_command OF cl_gui_alv_grid
*        IMPORTING
*            e_ucomm
*            sender.
*
*    CLASS-METHODS:
*      on_data_changed FOR EVENT data_changed OF cl_gui_alv_grid
*        IMPORTING
*            er_data_changed
*            sender.
*ENDCLASS.
*
*CLASS lcl_events IMPLEMENTATION.
*
*  METHOD on_data_changed.
** geänderte Zellen durchgehen
*    LOOP AT er_data_changed->mt_good_cells ASSIGNING FIELD-SYMBOL(<c>).
*      IF <c> IS ASSIGNED.
** Zeile x aus der iTab it_spfli rausholen und daraus die Zelle anhand des Spaltennamens (Feldnamens) holen
*        ASSIGN COMPONENT <c>-fieldname OF STRUCTURE it_spfli[ <c>-row_id ] TO FIELD-SYMBOL(<f>).
*
*        IF <f> IS ASSIGNED.
** Änderungswert in die Zelle der iTab (it_spfli) rückschreiben
*          <f> = <c>-value.
*        ENDIF.
*      ENDIF.
*
*    ENDLOOP.
*
** DB Update
*    FIELD-SYMBOLS: <tab> TYPE table.
*    FIELD-SYMBOLS: <row> TYPE spfli.
*
*    ASSIGN er_data_changed->mp_mod_rows->* TO <tab>.
*
*    LOOP AT <tab> ASSIGNING <row>.
** DB Update hier
*    ENDLOOP.
*
*  ENDMETHOD.
*
*  METHOD on_user_command.
** wenn BTN_REFRESH geklickt
*    IF e_ucomm = 'BTN_REFRESH'.
*      IF o_alv IS BOUND.
*        SELECT * FROM spfli INTO TABLE @it_spfli
*          WHERE carrid IN @so_carr
*            AND connid IN @so_conn.
*
*        sender->refresh_table_display( is_stable = VALUE lvc_s_stbl( row = abap_true
*                                                                     col = abap_true )
*                                       i_soft_refresh = abap_false ).
*      ENDIF.
*    ENDIF.
*  ENDMETHOD.
*
*  METHOD on_toolbar.
** alle Buttons entfernen, bis auf folgende:
*    DELETE e_object->mt_toolbar WHERE
*        function NE cl_gui_alv_grid=>mc_fc_refresh          " Refresh
*    AND function NE cl_gui_alv_grid=>mc_mb_export           " Excel
*    AND function NE cl_gui_alv_grid=>mc_fc_current_variant. " Layout
*
*    LOOP AT e_object->mt_toolbar ASSIGNING FIELD-SYMBOL(<fs_button>) WHERE ( function = cl_gui_alv_grid=>mc_fc_refresh ).
** neues USER-Command setzen, damit bei Button-Klick on_user_command getriggert wird
*      <fs_button>-function = 'BTN_REFRESH'.
*    ENDLOOP.
*
*  ENDMETHOD.
*ENDCLASS.
***********************************************************************
**
** INITIALIZATION
**
***********************************************************************
*INITIALIZATION.
*
** Vorbelegungen für Selektionsbild
*  so_carr[] = VALUE #( ( sign = 'I' option = 'EQ' low = 'LH' ) ).
*
***********************************************************************
**
** AT SELECTION-SCREEN OUTPUT
**
***********************************************************************
*AT SELECTION-SCREEN OUTPUT.
*
** Wenn vorher das Selektionsbild 1000 angezeigt wurde
*  IF gv_screen_status = 'IN_SELECTION'.
** Daten holen
*    SELECT * FROM spfli INTO TABLE @it_spfli
*       WHERE carrid IN @so_carr
*         AND connid IN @so_conn.
** ALV-Gitter anzeigen
*    o_alv = NEW #( i_parent      = cl_gui_container=>default_screen
*                   i_appl_events = abap_true ).
*
** Eventhandler registrieren
*    SET HANDLER lcl_events=>on_toolbar FOR o_alv.
*    SET HANDLER lcl_events=>on_data_changed FOR o_alv.
*    SET HANDLER lcl_events=>on_user_command FOR o_alv.
*
** Ereignisse registrieren
*    o_alv->register_edit_event( i_event_id = cl_gui_alv_grid=>mc_evt_enter ).
*    o_alv->register_edit_event( i_event_id = cl_gui_alv_grid=>mc_evt_modified ).
*
** ALV-Grid selektionsbereit setzen
*    o_alv->set_ready_for_input( i_ready_for_input = 1 ).
*
** Layout des ALV setzen
*    DATA(lv_layout) = VALUE lvc_s_layo( zebra      = abap_true
*                                        cwidth_opt = 'A'
*                                        grid_title = 'Flugverbindungen' ).
*
** Feldkatalog automatisch durch SALV erstellen lassen
*    DATA: o_salv TYPE REF TO cl_salv_table.
*
*    cl_salv_table=>factory( IMPORTING
*                              r_salv_table = o_salv
*                            CHANGING
*                              t_table      = it_spfli ).
*
*    DATA(it_fcat) = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = o_salv->get_columns( )
*                                                                       r_aggregations = o_salv->get_aggregations( ) ).
*
** im Feldkatalog alle Zellen der Spalte "CITYFROM" des ALV-Grids auf
** editierbar stellen, die restlichen Zellen sind nicht editierbar
*    LOOP AT it_fcat ASSIGNING FIELD-SYMBOL(<fcat>).
*      CASE <fcat>-fieldname.
*        WHEN 'CITYFROM'.
*          <fcat>-edit = abap_true.
*        WHEN OTHERS.
*          <fcat>-edit = abap_false.
*      ENDCASE.
*    ENDLOOP.
*
** ALV anzeigen
*    o_alv->set_table_for_first_display( EXPORTING
*                                          i_bypassing_buffer = abap_false
*                                          i_save             = 'A'
*                                          is_layout          = lv_layout
*                                        CHANGING
*                                          it_fieldcatalog    = it_fcat
*                                          it_outtab          = it_spfli ).
*
** Drucktastenleiste: Button "Ausführen (F8)" entfernen
*    DATA: it_exclude_btn TYPE STANDARD TABLE OF rsexfcode WITH DEFAULT KEY.
*    it_exclude_btn = VALUE #( ( fcode = 'ONLI' ) ).
*
*    CALL FUNCTION 'RS_SET_SELSCREEN_STATUS'
*      EXPORTING
*        p_status  = '%_00' " akt. Standard-PF-Status des Dypro 2000
*      TABLES
*        p_exclude = it_exclude_btn.
*
** leere SAP-Toolbar ausblenden
*    cl_abap_list_layout=>suppress_toolbar( ).
*
** Focus auf ALV setzen
*    cl_gui_alv_grid=>set_focus( control = o_alv ).
*
** Flag für Screen-Status auf ALV-Anzeige setzen
*    gv_screen_status = 'IN_ALV'.
*  ENDIF.
***********************************************************************
**
** START-OF-SELECTION
**
***********************************************************************
*START-OF-SELECTION.
*
** Wir befinden uns im Anzeigebereich des Selektionsbildes
*  gv_screen_status = 'IN_SELECTION'.
*
** Trick: leeren Dummy-Screen 2000 anzeigen und intern für das ALV-Grid in
** AT SELECTION-SCREEN OUTPUT als cl_gui_container=>default_screen nutzen
*  CALL SELECTION-SCREEN 2000.
