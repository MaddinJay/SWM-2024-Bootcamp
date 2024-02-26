CLASS zob_sb2_cl_db_erledigt DEFINITION
    PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create_object
      RETURNING
        VALUE(result) TYPE REF TO zob_sb2_cl_db_erledigt.

    METHODS constructor.

    METHODS einfuegen IMPORTING iv_kdnr   TYPE zob_sb2_tickets-kundennummer
                                iv_tnr    TYPE zob_sb2_tickets-ticketnummer
                                iv_kname  TYPE zob_sb2_tickets-kundenname
                                iv_rad    TYPE zob_sb2_tickets-stoerung
                                iv_anmerk TYPE zob_sb2_tickets-anmerkung.


    METHODS alv_aufruf_datenerfassung
      RAISING
        cx_salv_msg.

    METHODS alv_aufruf_sachbearbeiter
      RAISING
        cx_salv_existing
        cx_salv_wrong_call
        cx_salv_msg.

    METHODS handle_button_click.

    METHODS handle_button_click2.

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

    CLASS-DATA mo_me TYPE REF TO zob_sb2_cl_db_erledigt.



ENDCLASS.



CLASS zob_sb2_cl_db_erledigt IMPLEMENTATION.


  METHOD constructor.
    SELECT
    FROM zob_sb2_tickets
    FIELDS *
    INTO CORRESPONDING FIELDS OF TABLE @lt_tickets.


  ENDMETHOD.


  METHOD einfuegen.
    INSERT INTO zob_sb2_tickets VALUES @(  VALUE
              #( kundennummer = iv_kdnr
                 ticketnummer = iv_tnr
                 stoerung = iv_rad
                 kundenname = iv_kname
                 anmerkung = iv_anmerk
                 status = 'NEU'
                                    ) ).

    IF sy-subrc = 0.
      DATA(lv_message) = |Das Ticket wurde eingereicht!|.
      MESSAGE lv_message TYPE 'I'.
    ELSE.
      DATA(lv_message2) = |Das Ticket ist bereits vorhanden!|.
      MESSAGE lv_message2 TYPE 'I'.
    ENDIF.

  ENDMETHOD.


  METHOD alv_aufruf_datenerfassung.
    cl_salv_table=>factory( IMPORTING r_salv_table = go_alv
                            CHANGING  t_table      = lt_tickets ).

    go_functions = go_alv->get_functions( ).
    go_functions->set_all( ).
    go_alv->display( ).
  ENDMETHOD.


  METHOD alv_aufruf_sachbearbeiter.
    cl_salv_table=>factory( EXPORTING r_container  = cl_gui_container=>default_screen
                            IMPORTING r_salv_table = go_alv
                            CHANGING  t_table      = lt_tickets ).

    go_alv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_xl_export }|
                                           icon = |{ icon_execute_object }|
                                           tooltip = 'Techniker zuweisen'
                                           position = if_salv_c_function_position=>right_of_salv_functions ).

    go_alv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_okay }|
                                           icon = |{ icon_okay }|
                                           tooltip = 'Erledigt'
                                           position = if_salv_c_function_position=>right_of_salv_functions ).

* Eventhandler für Klicks in die Toolbar des SALV-Grids setzen
    SET HANDLER lcl_events=>on_toolbar_click FOR go_alv->get_event( ).
    SET HANDLER lcl_events=>on_toolbar_click2 FOR go_alv->get_event( ).

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

    CHECK lt_row IS NOT INITIAL. "Check muss gesetzt werden, da Tabelle 0-Wert hat

    READ TABLE lt_tickets ASSIGNING FIELD-SYMBOL(<ticket>) INDEX lt_row[ 1 ]. " Lese den selektierten Satz aus der Ticket Tabelle
    cl_demo_output=>display( <ticket> ).

    IF <ticket>-stoerung = 'STROMAUSFALL'. "Festlegen der Techniker
      <ticket>-technikernummer = 2000000001.
      <ticket>-techniker = 'HANSI MEIER'.
      <ticket>-status = 'IN ARBEIT'.
      UPDATE zob_sb2_tickets FROM <ticket>.
    ELSEIF <ticket>-stoerung = 'ZÄHLERDEFEKT'.
      <ticket>-technikernummer = 2000000002.
      <ticket>-techniker = 'HARALD MÜLLER'.
      <ticket>-status = 'IN ARBEIT'.
      UPDATE zob_sb2_tickets FROM <ticket>.
    ELSEIF <ticket>-stoerung = 'ZÄHLERVERWECHSLUNG'.
      <ticket>-technikernummer = 2000000003.
      <ticket>-techniker = 'GERHARD BAUM'.
      <ticket>-status = 'IN ARBEIT'.
      UPDATE zob_sb2_tickets FROM <ticket>.
    ENDIF.
    go_alv->refresh( refresh_mode = if_salv_c_refresh=>full ).
    cl_gui_cfw=>flush( ).


  ENDMETHOD.

  METHOD handle_button_click2.
    go_alv->get_metadata( ).  " Um Daten für Select vorzubereiten
    DATA(lt_row) = go_alv->get_selections( )->get_selected_rows( ). " Lese selektierte Zeilen aus der ALV

    CHECK lt_row IS NOT INITIAL. "Check muss gesetzt werden, da Tabelle 0-Wert hat

    READ TABLE lt_tickets ASSIGNING FIELD-SYMBOL(<ticket>) INDEX lt_row[ 1 ].

    <ticket>-status = 'ERLEDIGT'.
    UPDATE zob_sb2_tickets FROM <ticket>.

    go_alv->refresh( refresh_mode = if_salv_c_refresh=>full ).
    cl_gui_cfw=>flush( ).
  ENDMETHOD.
ENDCLASS.
