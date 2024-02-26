*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_events IMPLEMENTATION.
  METHOD on_toolbar_click.

    CASE e_salv_function.

      WHEN co_btn_xl_export.
*      PERFORM event_buttonclick.
*  LEAVE TO SCREEN 0.
        LEAVE PROGRAM. " Beendet den Report.

        DATA(lo_class) = zcL_BFOT_SERVICETICKET=>create_object( ). "Instanz der bereits vorhandenen globalen Klasse wird geholt --> ist die mo_me,
        lo_class->handle_button_click( ). "hier wird eine Aktion in der globalen Klasse ausgeführt, die ja bereits vorhanden ist

*        MESSAGE 'Ausgewählt' TYPE 'S'.
*        MESSAGE 'Ausgewählt' TYPE 'S'.
*       READ TABLE lt_tickets INTO ls_tickets INDEX rs_selfield-tabindex.
*       UPDATE zob_sb2_tickets SET status = 'wfbafba' WHERE kundennummer = ls_tickets-kundennummer AND kundenname = ls_tickets-kundenname.
*        LEAVE PROGRAM.
    ENDCASE.
  ENDMETHOD.

  METHOD handle_user_command.


    CASE lv_action.
      WHEN 'back'.
        LEAVE TO SCREEN 001.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
