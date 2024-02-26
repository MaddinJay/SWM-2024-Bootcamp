*&---------------------------------------------------------------------*
*& Report zem_selectionsbild
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_selectionsbild.

PARAMETERS: p_string TYPE string DEFAULT 'neu' LOWER CASE.

SELECTION-SCREEN SKIP.

* PUSHBUTTON für Anzeige / User-Command: 'SHOW'
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON 2(35) anzeige USER-COMMAND show.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN: SKIP 1.

*PUSHBUTTON zum Ausführen / USER-Command 'ONLI'
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON 2(35) start USER-COMMAND onli.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  anzeige = 'Übersicht aller Störungen anzeigen'.
  start = 'Start'.

AT SELECTION-SCREEN.
* Unterschiedliche Aktionen anhand des User-Command
  CASE sy-ucomm.
    WHEN 'ONLI'.                                           "bei Ausführen (ONLI) wird p_string entsprechend ausgegeben (siehe if bedingung ganz unten)
      MESSAGE 'Programm wird ausgeführt.' TYPE 'I'.
    WHEN 'SHOW'.
      MESSAGE 'Eintrag aller Störungen' TYPE 'S'.            "bei Anzeige (SHOW) wird ALV Liste angezeigt.



      SELECT
      FROM zdb_sto24 AS Stoerung
      "inner join zdb_sto24 as sto24 on technik~ = sto24~stonr
      FIELDS *
      INTO TABLE @DATA(it_sto23).


      TRY.

          DATA: lo_salv TYPE REF TO cl_salv_table.



          cl_salv_table=>factory( IMPORTING
                                    r_salv_table = lo_salv
                                  CHANGING
                                    t_table      = it_sto23 ).

          lo_salv->get_functions( )->set_all( abap_true ).                                   "Grundfunktionen

          lo_salv->get_display_settings(  )->set_list_header( 'Eingang Störungs-App' ).     "Überschrift,..statt Report-Name

          lo_salv->get_display_settings(  )->set_striped_pattern( abap_true ).              "Zebramuster ( für Junis :-))

          lo_salv->get_selections(  )->set_selection_mode(  if_salv_c_selection_mode=>row_column ). "Auswahlspalte

          lo_salv->get_sorts(  )->add_sort( columnname = 'STONR' sequence = if_salv_c_sort=>sort_down ). "Absteigend nach der STONR sortieren

          lo_salv->get_columns(  )->set_optimize( abap_true ).   " Spaltenbreite auf Länger der Inhalte optimiert


************
* Tabelleninhalte formatierten über LOOP derselben


          LOOP AT lo_salv->get_columns(  )->get(  ) ASSIGNING FIELD-SYMBOL(<c>).    "Loop über alle Zeilen
            DATA(o_col) = <c>-r_column.

            IF <c>-columnname = 'BEARB_STATUS' OR <c>-columnname = 'KUNDENNR' OR <c>-columnname = 'DATUM'. "je nach tech.Spaltennamen,
              o_col->set_alignment( if_salv_c_alignment=>left ).                     "wird ausrichtung bestimmt
              "left, centered, right
            ELSE.
              o_col->set_alignment( if_salv_c_alignment=>left ).

            ENDIF.

            IF <c>-columnname = 'NACHNAME'.
              o_col->set_short_text( || ).                          "Angezeigter Text (long, short, meditum) - lieber weg machen
              o_col->set_medium_text( || ).
              o_col->set_long_text( | { o_col->get_long_text(  ) } nasdlfhahdsg | ).

*für Anzeige der technischen Namen ..diese Schreibweise ..
*nach geschwungener Klammer kann noch eine Wunschausgabe gesetzt werden. (immer zwischen Pipes)

              "o_col->set_long_text( |{ o_col->get_columnname( ) } - { o_col->get_long_text(  ) }| ).

              "
            ENDIF.

          ENDLOOP.


          DATA(lo_func) = lo_salv->get_functions( ).

*lo_func->set_view_crystal( if_salv_c_bool_sap=>true ).



          lo_salv->display( ).

        CATCH cx_salv_msg.
        CATCH cx_salv_existing.
        CATCH cx_salv_data_error.
        CATCH cx_salv_not_found.


      ENDTRY.

  ENDCASE.

START-OF-SELECTION.
* Wenn User-Command 'ONLI' (Ausführen) gedrückt wurde
  IF p_string = 'neu'.
    WRITE: p_string.

  ELSE.
    WRITE 'bä'.
  ENDIF.
