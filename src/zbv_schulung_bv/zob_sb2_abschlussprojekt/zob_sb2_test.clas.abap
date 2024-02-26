CLASS zob_sb2_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create_object
      RETURNING
        VALUE(result) TYPE REF TO zob_sb2_cl_db_bearbeitung.

    METHODS constructor.

    METHODS alv_aufruf_sachbearbeiter
      RAISING
        cx_salv_existing
        cx_salv_wrong_call
        cx_salv_msg.

    METHODS handle_button_click.

  PROTECTED SECTION.
    TYPES: BEGIN OF t_tickets,
             kundennummer    TYPE zob_sb2_tickets-kundennummer,
             ticketnummer    TYPE zob_sb2_tickets-ticketnummer,
             stoerung        TYPE zob_sb2_tickets-stoerung,
             kundenname      TYPE zob_sb2_tickets-kundenname,
             anmerkung       TYPE zob_sb2_tickets-anmerkung,
             technikernummer TYPE zob_sb2_tickets-technikernummer,
             techniker       TYPE zob_sb2_tickets-techniker,
             status          TYPE zob_sb2_tickets-status,
           END OF t_tickets.

    DATA: go_alv       TYPE REF TO cl_salv_table,
          go_functions TYPE REF TO cl_salv_functions_list,
          lt_tickets   TYPE TABLE OF t_tickets. "Tabelle hier deklariert, damit sie überall benutzt werden kann
  PRIVATE SECTION.

    CLASS-DATA mo_me TYPE REF TO zob_sb2_cl_db_bearbeitung.


ENDCLASS.
CLASS zob_sb2_test IMPLEMENTATION.

  METHOD constructor.
    SELECT
    FROM zob_sb2_tickets
    FIELDS *
    INTO CORRESPONDING FIELDS OF TABLE @lt_tickets.



  ENDMETHOD.


  METHOD alv_aufruf_sachbearbeiter.
    cl_salv_table=>factory( EXPORTING r_container  = cl_gui_container=>default_screen
                            IMPORTING r_salv_table = go_alv
                            CHANGING  t_table      = lt_tickets ).

    go_alv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_xl_export }|
                                           icon = |{ icon_execute_object }|
                                           tooltip = 'Daten speichern'
                                           position = if_salv_c_function_position=>right_of_salv_functions ).

* Eventhandler für Klicks in die Toolbar des SALV-Grids setzen
    SET HANDLER lcl_events=>on_toolbar_click FOR go_alv->get_event( ).

* SALV anzeigen
    go_alv->display( ).

    WRITE: space.
  ENDMETHOD.


  METHOD create_object.
    IF mo_me IS NOT BOUND." Erzeuge eine Instanz dieser Klasse, um diese einmalig zu erstellen "Singleton Pattern
      mo_me = NEW #( ).
    ENDIF.
    result = mo_me.
  ENDMETHOD.


  METHOD handle_button_click.
    go_alv->get_metadata( ).  " Um Daten für Select vorzubereiten
    DATA(lt_row) = go_alv->get_selections( )->get_selected_rows( ). " Lese selektierte Zeilen aus der ALV

    READ TABLE lt_tickets INTO DATA(ls_tickets) INDEX lt_row[ 1 ]. " Lese den selektierten Satz aus der Ticket Tabelle
    cl_demo_output=>display(
      data = ls_tickets
*     name =
*     exclude =
*     include =
    ).

  ENDMETHOD.

ENDCLASS.
