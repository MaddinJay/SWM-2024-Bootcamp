*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_events IMPLEMENTATION.
  METHOD on_toolbar_click.
    CASE e_salv_function.
      WHEN co_btn_xl_export.

       DATA(lo_class) = zob_sb2_cl_db_bearbeitung=>create_object( ). "Instanz der bereits vorhandenen globalen Klasse wird geholt --> ist die mo_me,
       lo_class->handle_button_click( ). "hier wird eine Aktion in der globalen Klasse ausgeführt, die ja bereits vorhanden ist

    ENDCASE.

  ENDMETHOD.

    METHOD on_toolbar_click2.
    CASE e_salv_function.
      WHEN co_btn_okay.

       DATA(lo_class) = zob_sb2_cl_db_bearbeitung=>create_object( ).
       lo_class->handle_button_click2( ).

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
