CLASS zcl_bfot_serviceticket DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create_object
      RETURNING
        VALUE(result) TYPE REF TO zcl_bfot_serviceticket.
    METHODS:

      get_hoechste_TicketNr2 RETURNING VALUE(rv_hoechste_TicketNr) TYPE i,
      show_alle_Tickets,
      show_alle_Tickets2,
      show_alle_Tickets_iBSB,
      show_alle_Tickets_iBTe,
      show_alle_Tickets_erl,
      set_status_iBTE IMPORTING iv_tnr    TYPE n
                                iv_TechID TYPE zbfot_tickets-bearbeiterid,
      set_status_erl IMPORTING iv_tnr   TYPE n
                               iv_loes1 TYPE string,
      check_alle_Tickets_neu,
      check_alle_Tickets_neu2 IMPORTING iv_sto_strom  TYPE boole
                                       iv_sto_gas    TYPE boole
                                       iv_sto_fw     TYPE boole
                                       iv_sto_wasser TYPE boole,
      handle_button_click.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: o_salv      TYPE REF TO cl_salv_table,
          o_functions TYPE REF TO cl_salv_functions_list.

    DATA: mv_hoechste_TicketNr TYPE n LENGTH 6,
          ms_ticket            TYPE zbfot_tickets,
          mt_alle_Tickets      TYPE TABLE OF zbfot_tickets, " itab für alle neuen Tickets
          mt_alle_iBSB_Tickets TYPE TABLE OF zbfot_tickets,  " itab für alle iBSB Tickets
          mt_alle_iBTe_Tickets TYPE TABLE OF zbfot_tickets,   " itab für alle iBTe Tickets
          mt_alle_erl_Tickets  TYPE TABLE OF zbfot_tickets.   " itab für alle erledigten Tickets

    CLASS-DATA: mo_me                 TYPE REF TO zcl_bfot_serviceticket.

ENDCLASS.



CLASS zcl_bfot_serviceticket IMPLEMENTATION.

  METHOD show_alle_tickets.
    SELECT
      FROM zbfot_tickets
      FIELDS *
      WHERE zbfot_tickets~ticketstatus NE 'ERLEDIGT'
      INTO TABLE @mt_alle_tickets.
    SORT mt_alle_tickets DESCENDING BY datum.

    cl_salv_table=>factory( EXPORTING r_container  = cl_gui_container=>default_screen
                            IMPORTING r_salv_table = o_salv
                            CHANGING  t_table      = mt_alle_tickets ).

    o_functions = o_salv->get_functions( ). " STD ALV Toolbar einblenden
    o_functions->set_all( abap_true ).

    DATA: lo_columns TYPE REF TO cl_salv_columns_table. " Spaltenbreite optimieren.

    lo_columns = o_salv->get_columns( ).
    lo_columns->set_optimize( 'X' ).


*    DATA: gr_table TYPE REF TO cl_salv_table.
*    DATA: gr_columns TYPE REF TO cl_salv_columns_table.
*    DATA: gr_column TYPE REF TO cl_salv_column_table.
*    DATA: gr_strucdesc TYPE REF TO cl_abap_structdescr.
*    DATA: lt_comp TYPE abap_compdescr_tab.
*    DATA: ls_comp TYPE abap_compdescr.
*
*
**    Data(lo_column) = lo_columns->get_column( 'ticketbeschreibung' ).
*
*    gr_strucdesc ?= cl_abap_typedescr=>describe_by_data( ms_ticket ).
*    lt_comp[] = gr_strucdesc->components[].
*    LOOP AT lt_comp INTO ls_comp.
*      gr_column ?= lo_columns->get_column( ls_comp-name ).
**      gr_column->set_visible( abap_false ).
*      gr_column->set_output_length( '20' ).
*    ENDLOOP.

    o_salv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_xl_export }|
                                              icon = |{ icon_execute_object }| " anderes Icon suchen
                                              tooltip = 'Beenden' " Info text änderbar,  Evtl. Feld Title hinzufügen
                                              position = if_salv_c_function_position=>right_of_salv_functions
                                              text = 'Beenden'
                                              ).

*    o_salv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_xl_export }|
*                                              icon = |{ icon_execute_object }| " anderes Icon suchen
*                                              tooltip = 'Daten speichern' " Info text änderbar,  Evtl. Feld Title hinzufügen
*                                              position = if_salv_c_function_position=>right_of_salv_functions
*                                              text = 'Daten speichern'
*                                              ).

*    Eventhandler für Klicks in die Toolbar des SALV-Grids setzen.
    SET HANDLER lcl_events=>on_toolbar_click FOR o_salv->get_event( ).

    o_salv->display( ). " ALV anzeigen

    WRITE: space.

  ENDMETHOD.

  METHOD show_alle_tickets2.
    SELECT
    FROM zbfot_tickets
    FIELDS *
    WHERE zbfot_tickets~ticketstatus NE 'ERLEDIGT'
    INTO TABLE @mt_alle_tickets.
    SORT mt_alle_tickets DESCENDING BY datum.
    cl_demo_output=>display( mt_alle_tickets ).

  ENDMETHOD.

  METHOD show_alle_tickets_ibsb.
    SELECT
      FROM zbfot_tickets
      FIELDS *
      WHERE zbfot_tickets~ticketstatus = 'IN BEARBEITUNG SACHBEARBEITER'
      INTO TABLE @mt_alle_ibsb_tickets.
    SORT mt_alle_ibsb_tickets DESCENDING BY datum.
    cl_demo_output=>display( mt_alle_ibsb_tickets ).

  ENDMETHOD.

  METHOD show_alle_tickets_ibte.
    SELECT
      FROM zbfot_tickets
      FIELDS *
      WHERE zbfot_tickets~ticketstatus = 'IN BEARBEITUNG TECHNIKER'
      INTO TABLE @mt_alle_ibte_tickets.
    SORT mt_alle_ibte_tickets DESCENDING BY datum.
    cl_demo_output=>display( mt_alle_ibte_tickets ).

  ENDMETHOD.

  METHOD show_alle_tickets_erl.
    SELECT
      FROM zbfot_tickets
      FIELDS *
      WHERE zbfot_tickets~ticketstatus = 'ERLEDIGT'
      INTO TABLE @mt_alle_erl_tickets.
    SORT mt_alle_ibte_tickets DESCENDING BY datum.
    cl_demo_output=>display( mt_alle_erl_tickets ).

  ENDMETHOD.

  METHOD check_alle_tickets_neu.

    SELECT FROM zbfot_tickets INNER JOIN zbfot_kunden ON zbfot_tickets~vknr = zbfot_kunden~vknr
  FIELDS *
  WHERE zbfot_tickets~ticketstatus = 'NEU' AND zbfot_kunden~saeumig = @abap_true
  INTO TABLE @DATA(mt_alle_Tickets_saeumig).


    LOOP AT mt_alle_tickets_saeumig INTO DATA(ms_wa4).
      UPDATE zbfot_tickets SET ticketstatus = 'KUNDE INFORMIERT' WHERE ticketstatus = 'NEU'.
    ENDLOOP.

  ENDMETHOD.

  METHOD check_alle_tickets_neu2.
    SELECT FROM zbfot_tickets
        FIELDS *
        WHERE zbfot_tickets~ticketstatus = 'NEU'
        INTO TABLE @DATA(mt_alle_tickets).

    LOOP AT mt_alle_tickets INTO DATA(ms_wa3).

      IF iv_STO_strom = abap_true AND ms_wa3-sparte = 'STROM'.
        ms_wa3-ticketstatus = 'KUNDE INFORMIERT'.
        UPDATE zbfot_tickets FROM ms_wa3.

      ELSEIF iv_STO_gas = abap_true AND ms_wa3-sparte = 'GAS'.
        ms_wa3-ticketstatus = 'KUNDE INFORMIERT'.
        UPDATE zbfot_tickets FROM ms_wa3.

      ELSEIF iv_STO_fw = abap_true AND ms_wa3-sparte = 'FERNWÄRME'.
        ms_wa3-ticketstatus = 'KUNDE INFORMIERT'.
        UPDATE zbfot_tickets FROM ms_wa3.

      ELSEIF iv_STO_wasser = abap_true AND ms_wa3-sparte = 'WASSER'.
        ms_wa3-ticketstatus = 'KUNDE INFORMIERT'.
        UPDATE zbfot_tickets FROM ms_wa3.

      ELSE.
        UPDATE zbfot_tickets SET ticketstatus = 'IN BEARBEITUNG SACHBEARBEITER' WHERE ticketstatus = 'NEU'.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD get_hoechste_ticketnr2.
    SELECT FROM zbfot_tickets
FIELDS
  MAX( ticketnummer )
INTO @mv_hoechste_ticketnr.
    rv_hoechste_ticketnr = mv_hoechste_ticketnr.
  ENDMETHOD.


  METHOD create_object.
    IF mo_me IS NOT BOUND. " Singleton Pattern - Wir erzeugen nur eine Instanz der Klasse zur
      " Laufzeit unseres Programmes und können diese an unterschiedlichen
      " Stellen lesen
      mo_me = NEW #( ).
    ENDIF.
    result = mo_me.
  ENDMETHOD.


  METHOD handle_button_click.
    IF 1 = 2.
    ENDIF.
  ENDMETHOD.


  METHOD set_status_ibte.
    SELECT FROM zbfot_tickets
    FIELDS *
    WHERE ticketnummer = @iv_tnr
    INTO @ms_ticket.
    ENDSELECT.
    ms_ticket-ticketstatus = 'IN BEARBEITUNG TECHNIKER'.
    ms_ticket-bearbeiterid = iv_techid.
    UPDATE zbfot_tickets FROM ms_ticket.
    CLEAR ms_ticket.

  ENDMETHOD.


  METHOD set_status_erl.
    SELECT FROM zbfot_tickets
    FIELDS *
    WHERE ticketnummer = @iv_tnr
    INTO @ms_ticket.
    ENDSELECT.
    ms_ticket-ticketstatus = 'ERLEDIGT'.
    ms_ticket-loesung = iv_loes1.
    UPDATE zbfot_tickets FROM ms_ticket.
    CLEAR ms_ticket.

  ENDMETHOD.





ENDCLASS.
