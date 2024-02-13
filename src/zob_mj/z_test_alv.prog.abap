*&---------------------------------------------------------------------*
*& Report z_test_alv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_test_alv.

* Quelle: https://blogs.sap.com/2022/08/01/editable-cl_salv_table-after-release-756/
* ab SAP Release 756
* Achtung: das Ganze funktioniert nur für kleine Tabellen mit max. 5000 Zellen, siehe:
*
* Methode: CL_SALV_GUI_OM_ADAPTER_TABLE->CAN_RUN_RESTRICTED_EDIT_MODE( )
* Konstante: CV_MAX_CELLS_FOR_EDITABLE (Wert: 5000).

* Eventhandler
CLASS lcl_events DEFINITION.
  PUBLIC SECTION.
* Bezeichner der Buttons
    CONSTANTS: co_btn_edit TYPE string VALUE 'BTN_EDIT'.
    CONSTANTS: co_btn_save TYPE string VALUE 'BTN_SAVE'.

* Platzhalter für Referenz auf SALV-Grid
    CLASS-DATA: o_salv TYPE REF TO cl_salv_table.

* Eventhandler-Methode für Button-Klicks in der Toolbar des SALV-Grids
    CLASS-METHODS : on_toolbar_click FOR EVENT added_function OF cl_salv_events_table
      IMPORTING
        e_salv_function
        sender.
  PRIVATE SECTION.
* Edit-Status des SALV-Grids
    CLASS-DATA: gv_edit TYPE abap_bool VALUE abap_false.
ENDCLASS.

CLASS lcl_events IMPLEMENTATION.
  METHOD on_toolbar_click.
    IF o_salv IS BOUND.

      DATA(o_api) = o_salv->extended_grid_api( ).
      DATA(o_edit) = o_api->editable_restricted( ).

      CASE e_salv_function.

        WHEN co_btn_edit.
* Edit-Modus umschalten
          IF gv_edit = abap_false.
            gv_edit = abap_true.
          ELSE.
            gv_edit = abap_false.
          ENDIF.

          TRY.
* Spalte(n) (nicht) editierbar setzen
              o_edit->set_attributes_for_columnname( EXPORTING columnname              = 'EKGRP'
                                                               all_cells_input_enabled = gv_edit ).

              o_edit->set_attributes_for_columnname( EXPORTING columnname              = 'SMTP_ADDR'
                                                               all_cells_input_enabled = gv_edit ).
            CATCH cx_salv_not_found.
          ENDTRY.

          o_edit->validate_changed_data( ).
          o_salv->refresh( ).

        WHEN co_btn_save.
* Daten auf Validität prüfen
          DATA(lv_data_is_valid) = abap_false.

          TRY.
              o_edit->validate_changed_data( IMPORTING is_input_data_valid = lv_data_is_valid ).
              o_salv->refresh( ).
            CATCH cx_salv_not_found.
          ENDTRY.

          IF lv_data_is_valid = abap_true.
* Daten hier speichern / weiterverarbeiten
            MESSAGE co_btn_save TYPE 'I'.
          ENDIF.
      ENDCASE.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  TRY.
* Beispieldaten (Einkäufergruppen) holen
      SELECT FROM t024
        FIELDS *
        INTO TABLE @DATA(it_t024).

      IF sy-subrc = 0.
        cl_salv_table=>factory( EXPORTING r_container  = cl_gui_container=>default_screen
                                IMPORTING r_salv_table = lcl_events=>o_salv
                                CHANGING  t_table      = it_t024 ).

* Standardbuttons der SALV-Table ausblenden
        lcl_events=>o_salv->get_functions( )->set_all( abap_false ).

* Eigenen SALV-Button hinzufügen
* das Hinzufügen des Buttons funktioniert nur, wenn die SALV-Table innerhalb eines Containers (z.B. cl_gui_container=>default_screen) eingebettet ist
        lcl_events=>o_salv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_edit }|
                                                            icon = |{ icon_edit_file }|
                                                            text = 'Edit'
                                                            tooltip = 'Daten editieren'
                                                            position = if_salv_c_function_position=>right_of_salv_functions ).

        lcl_events=>o_salv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_save }|
                                                            icon = |{ icon_save_as_template }|
                                                            text = 'Save'
                                                            tooltip = 'Daten speichern'
                                                            position = if_salv_c_function_position=>right_of_salv_functions ).

* Eventhandler für Klicks in die Toolbar des SALV-Grids setzen
        SET HANDLER lcl_events=>on_toolbar_click FOR lcl_events=>o_salv->get_event( ).

* SALV anzeigen
        lcl_events=>o_salv->display( ).

* Toolbar der Listausgabe unterdrücken
        cl_abap_list_layout=>suppress_toolbar( ).

* Listausgabe erzwingen für Erzeugung von cl_gui_container=>default_screen
        WRITE: space.

      ENDIF.
    CATCH cx_root INTO DATA(e_txt).
      WRITE: / e_txt->get_text( ).
  ENDTRY.
