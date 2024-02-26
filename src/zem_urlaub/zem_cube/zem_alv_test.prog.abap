*&---------------------------------------------------------------------*
*& Report zem_alv_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_alv_test.


*Code  Funktionstaste    Beschreibung
*
*BACK  F3                Eine Stufe zurückgehen
*ONLI  F8                Programmausführung läuft bei START-OF-SELECTION weiter
*P--   Strg-Bild hoch    Zur ersten Fensterseite blättern
*P-    Bild hoch         Zur vorigen Fensterseite blättern
*P+    Bild runter       Zur nächsten Fensterseite blättern
*P++   Strg-Bild runter  Zur letzten Fensterseite blättern
*PICK  F2                Ereignis AT LINE-SELECTION
*PRI   Strg-P            Angezeigte Liste drucken
*RW    F12 , ESC         Bearbeitung Abbrechen
*%CTX  Shift-F10         Kontextmenü auf Liste
*%EX   Shift-F3          Bearbeitung beenden
*%PC                     Liste in Datei sichern
*%SC   Strg-F            Muster suchen
*%SC+  Strg-G            Muster weiter suchen
*%SL                     Liste in Office sichern

*START-OF-SELECTION.
*  SET USER-COMMAND 'MYCOMM'.
** auf User-Command reagieren
*AT USER-COMMAND.
*  CASE sy-ucomm.
*    WHEN 'MYCOMM'.
*      write 'hallo'.
*  ENDCASE.

*DATA: rg_matnr TYPE RANGE OF matnr.
*
*CALL FUNCTION 'COMPLEX_SELECTIONS_DIALOG'
*  EXPORTING
*    title             = 'Auswahl'
*    text              = 'Materialnummern'
*  TABLES
*    range             = rg_matnr
*  EXCEPTIONS
*    no_range_tab      = 1
*    cancelled         = 2
*    internal_error    = 3
*    invalid_fieldname = 4
*    OTHERS            = 5.
*
*IF sy-subrc = 0.
*  cl_demo_output=>display( rg_matnr ).
*ENDIF.

*DATA(lv_tab_field) = VALUE rstabfield( tablename = 'CSKS' fieldname = 'KOSTL' ).
*
*DATA: rg_test TYPE RANGE OF csks-kostl.
*
*CALL FUNCTION 'COMPLEX_SELECTIONS_DIALOG'
*  EXPORTING
*    title             = 'Auswahl'
*    text              = 'Kostenstelle'
*    tab_and_field     = lv_tab_field
*    help_field        = 'CSKS-KOSTL'
*  TABLES
*    range             = rg_test
*  EXCEPTIONS
*    no_range_tab      = 1
*    cancelled         = 2
*    internal_error    = 3
*    invalid_fieldname = 4
*    OTHERS            = 5.
*
*IF sy-subrc = 0.
*  cl_demo_output=>display( rg_test ).
*ENDIF.

PARAMETERS: p_string TYPE string DEFAULT 'abc' LOWER CASE,
            p_s2 type string default 'xyz'.

SELECTION-SCREEN SKIP.

* PUSHBUTTON triggert Test-Kommando 'SHOW'
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN PUSHBUTTON 2(30) btn1 USER-COMMAND onli.

* PUSHBUTTON triggert Kommando 'ONLI' (Ausführen) auf dem Selektionsbild

SELECTION-SCREEN PUSHBUTTON 2(30) bstart USER-COMMAND onli.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  btn1 = 'Show'.
  bstart = 'Start'.

AT SELECTION-SCREEN.

START-OF-SELECTION.

If btn1 = abap_true.
CASE sy-ucomm.
    WHEN 'ONLI'.
      MESSAGE 'Springe jetzt zu START-OF-SELECTION.' TYPE 'I'.
  ENDCASE.
  WRITE: p_string.
Elseif bstart = abap_true.
CASE sy-ucomm.
    WHEN 'ONLI'.
      MESSAGE 'Springe jetzt zu START-OF-SELECTION.' TYPE 'I'.
  ENDCASE.

  write: p_s2.


endif.


* Wenn User-Command 'ONLI' (Ausführen) getriggert wurde



** User-Command prüfen
*  CASE sy-ucomm.
*    WHEN 'ONLI'.
*      MESSAGE 'Springe jetzt zu START-OF-SELECTION.' TYPE 'A'.
*    WHEN 'SHOW'.
*      MESSAGE p_string TYPE 'I'.
*  ENDCASE.
*
*START-OF-SELECTION.
** Wenn User-Command 'ONLI' (Ausführen) getriggert wurde
*  WRITE: p_string.


*PARAMETERS: p_string TYPE string DEFAULT 'Test'.
*
** Eigener Startbutton: Triggert das Kommando 'ONLI' (Ausführen (F8)) -> START-OF-SELECTION
*SELECTION-SCREEN BEGIN OF LINE.
*SELECTION-SCREEN PUSHBUTTON 2(30) b_start USER-COMMAND onli.
*SELECTION-SCREEN END OF LINE.
*
*INITIALIZATION.
*  b_start   = 'Start'.
*
*AT SELECTION-SCREEN OUTPUT.
*  DATA: it_ucomm TYPE STANDARD TABLE OF sy-ucomm WITH DEFAULT KEY.
** Standard-Button Ausführen (F8) in der Toolbar entfernen
*  APPEND 'ONLI' TO it_ucomm.
*
*  CALL FUNCTION 'RS_SET_SELSCREEN_STATUS'
*    EXPORTING
*      p_status  = sy-pfkey
*    TABLES
*      p_exclude = it_ucomm.
*
*START-OF-SELECTION.
*  WRITE: / p_string.



*TYPE-POOLS: vrm.
*
*SELECT single
*FROM zdb_sto24
*FIELDS
*MIN( stonr )
*INTO @DATA(lv_stonr).
*
*
*
*
*SELECTION-SCREEN BEGIN OF BLOCK Stoerung WITH FRAME TITLE TEXT-001.
*  PARAMETERS: p_kdnr   TYPE zdb_sto24-stonr OBLIGATORY, "DEFAULT lv_stonr OBLIGATORY,
*              p_sgrund TYPE zkommentar OBLIGATORY,
*              p_kommi  TYPE zkommentar,
*              p_datum  TYPE frmdatum DEFAULT sy-datum OBLIGATORY.
*
*SELECTION-SCREEN END OF BLOCK stoerung.
*
*
*
*SELECTION-SCREEN BEGIN OF BLOCK Techniker WITH FRAME TITLE TEXT-002.
*  TYPES: BEGIN OF ls_tech,
*           nachname TYPE znachname,
*         END OF ls_tech.
*SELECTION-SCREEN END OF BLOCK Techniker.
*
*
*DATA: it_tech    TYPE STANDARD TABLE OF ls_tech,
*      ls_technik TYPE ls_tech,
*      g_id       TYPE vrm_id,
*      it_values  TYPE vrm_values,
*      wa_values  LIKE LINE OF it_values.
*
*SELECTION-SCREEN BEGIN OF BLOCK rahmen2 WITH FRAME TITLE TEXT-002.
*
*  PARAMETERS: p_tech TYPE znachname AS LISTBOX VISIBLE LENGTH 10.
*  PARAMETERS: p_stonr type zstonr Default lv_stonr.
*
*SELECTION-SCREEN begin of line.
*
*set USER-COMMAND 'PICK'.
*
*SELECTION-SCREEN: Pushbutton 4(20) iNF1 user-command INF1.
*
*SELECTION-SCREEN end of line.
*
*SELECTION-SCREEN END OF BLOCK rahmen2.
*
*
*INITIALIZATION.
*INF1 = 'zuweisen'.
*
*At user-COMMAND.
*Case sy-ucomm.
*when 'PICK'.
*Write 'hallo'.
*endcase.
*
*SELECTION-SCREEN BEGIN OF BLOCK rahmen3 WITH FRAME TITLE TEXT-003.
*  PARAMETERS: p_radio1 RADIOBUTTON GROUP app, "-> Störungen anzeigen
*              p_radio2 RADIOBUTTON GROUP app, "-> Störung abschließen
*              p_radio3 RADIOBUTTON GROUP app, "-> Status Kunde informiert setzen
*              p_radio4 Radiobutton group app. "-> Störung erfassen
*SELECTION-SCREEN END OF BLOCK rahmen3.
*
*AT SELECTION-SCREEN .
*
*case sy-ucomm.
*when 'INF1'.
*
*
*
*message '' type 'I'.
*endcase.
*
*
*
*
**********************************************************************
*AT SELECTION-SCREEN OUTPUT.
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
*  LOOP AT it_tech INTO ls_technik.
*    wa_values-key = ls_technik-nachname.
*    wa_values-text = ls_technik-nachname.
*    APPEND wa_values TO it_values.
*    CLEAR wa_values.
*  ENDLOOP.
*
*  g_id = 'P_TECH'.
*  CALL FUNCTION 'VRM_SET_VALUES'
*    EXPORTING
*      id     = g_id
*      values = it_values.
*    EXCEPTIONS
*      id_illegal_name = 1
*      OTHERS          = 2.
*
* ABAP OO: Methodenaufruf
*  DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ).
*
*  "If Schleife: Die Methode sto_erfassen wird sonst direkt beim Programmstart ausgeführt und die Tabelle
*  "wird mit einer neuen Zeile versehen.
*  "IF p_kdnr IS NOT INITIAL.
*
*  If p_radio4 = abap_true.
*    lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ip_sgrund = p_sgrund ip_kommi = p_kommi ip_datum = p_datum ip_tech = p_tech ).
*Endif.
*
*  z_class_sb=>sto_abrufen( ip_kdnr = p_kdnr ).
*
*
*  lo_sto_erfassen->tech_zuweisen( ip_tech = p_tech ip_stonr = p_stonr ).


*TYPE-POOLs: vrm.
*
*Types: BEGIN OF ls_tech,
*       nachname type znachname,
*       skill type ztechnskill,
*       end of ls_tech.
*
*
*Data: it_tech type STANDARD TABLE OF ls_tech,
*      ls_technik type ls_tech.
*
*Data: g_id type vrm_id,
*      it_values type vrm_values,
*      wa_values like line of it_values.
*
*
*Parameters: p_tech as listbox VISIBLE LENGTH 20.
*
*
*At SELECTION-SCREEN OUTPUT.
*
*Select
*From zdb_technik24
*Fields
*nachname
*where v_status = 'X'
*Into TAble @it_tech.
*
*
*Loop at it_tech into ls_technik.
*wa_values-key = ls_technik-nachname.
*wa_values-text = ls_technik-nachname.
*
*
*Append wa_values to it_values.
*clear wa_values.
*
*Endloop.
*
*g_id = 'P_TECH'.
*Call FUNCTION 'VRM_SET_VALUES'
*EXPORTING
*id          = g_id
*values      = it_values
*
*EXCEPTIONS
*id_illegal_name = 1
*others          = 2.





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
**right join ZDB_STO24 as STO24 on zdb_technik24~stonr = sto24~stonr
**RIGHT join zdb_custom24 as Custom on sto24~kundennr =  custom~kdnr
*FIELDS *
*into table @data(it_sto23).


Select
from zdb_sto24 as Stoerung
"inner join zdb_sto24 as sto24 on technik~ = sto24~stonr
Fields *
into table @data(it_sto23).


Try.

DATA: lo_salv TYPE REF TO cl_salv_table.



    cl_salv_table=>factory( IMPORTING
                              r_salv_table = lo_salv
                            CHANGING
                              t_table      = it_sto23 ).

lo_salv->get_functions( )->set_all( abap_true ).                                   "Grundfunktionen

lo_salv->get_display_settings(  )->set_list_header( 'Eingang Störungs-App' ).     "Überschrift,..statt Report-Name

lo_salv->get_display_settings(  )->set_striped_pattern( abap_true ).              "Zebramuster ( für Yunis :-))

lo_salv->get_selections(  )->set_selection_mode(  if_salv_c_selection_mode=>row_column ). "Auswahlspalte

lo_salv->get_sorts(  )->add_sort( columnname = 'STONR' sequence = if_salv_c_sort=>sort_down ). "Absteigend nach der STONR sortieren

lo_salv->get_columns(  )->set_optimize( abap_true ).   " Spaltenbreite auf Länger der Inhalte optimiert


************
* Tabelleninhalte formatierten über LOOP derselben


loop at lo_salv->get_columns(  )->get(  ) ASSIGNING FIELD-SYMBOL(<c>).    "Loop über alle Zeilen
Data(o_col) = <c>-r_column.

If <c>-columnname = 'BEARB_STATUS' or <c>-columnname = 'KUNDENNR' or <c>-columnname = 'DATUM'. "je nach tech.Spaltennamen,
o_col->set_alignment( if_salv_c_alignment=>left ).                     "wird ausrichtung bestimmt
                                                                           "left, centered, right
Else.
o_col->set_alignment( if_salv_c_alignment=>left ).

Endif.

If <c>-columnname = 'NACHNAME'.
o_col->set_short_text( || ).                          "Angezeigter Text (long, short, meditum) - lieber weg machen
o_col->set_medium_text( || ).
o_col->set_long_text( | { o_col->get_long_text(  ) } nasdlfhahdsg | ).

*für Anzeige der technischen Namen ..diese Schreibweise ..
*nach geschwungener Klammer kann noch eine Wunschausgabe gesetzt werden. (immer zwischen Pipes)

"o_col->set_long_text( |{ o_col->get_columnname( ) } - { o_col->get_long_text(  ) }| ).

                                                              "
Endif.



endloop.


DATA(lo_func) = lo_salv->get_functions( ).

*lo_func->set_view_crystal( if_salv_c_bool_sap=>true ).



lo_salv->display( ).

Catch cx_salv_msg.
Catch cx_salv_existing.
Catch cx_salv_data_error.
Catch cx_salv_not_found.


Endtry.


*START-OF-SELECTION.
*
*  SELECT
*  From zdb_sto24
*  Fields
*  stonr,
*  kundennr,
*  datum,
*  bearb_status,
*  nachname,
*  sto_grund,
*  kommentar
*  INTO TABLE @DATA(lt_sto24).
*
*
** ALV-Gitter-Objekt erzeugen
*  DATA(o_alv) = NEW cl_gui_alv_grid( i_parent      = cl_gui_container=>default_screen " in default container einbetten
*                                     i_appl_events = abap_true ).                     " Ereignisse als Applikationsevents registrieren
*
** Feldkatalog automatisch durch SALV-Objekte erstellen lassen
*  DATA: o_salv TYPE REF TO cl_salv_table.
*
*  cl_salv_table=>factory( IMPORTING
*                            r_salv_table = o_salv
*                          CHANGING
*                            t_table      = lt_sto24 ).
*
*  DATA(it_fcat) = cl_salv_controller_metadata=>get_lvc_fieldcatalog( r_columns      = o_salv->get_columns( )
*                                                                     r_aggregations = o_salv->get_aggregations( ) ).
*
** Layout des ALV setzen
*  DATA(lv_layout) = VALUE lvc_s_layo( zebra      = abap_true             " ALV-Control: Alternierende Zeilenfarbe (Zebramuster)
*                                      cwidth_opt = 'A'                  " ALV-Control: Spaltenbreite optimieren
*                                      grid_title = 'Übersicht Störungen'
*                                      no_toolbar = abap_false
*                                      smalltitle = abap_true
*                                     ). " ALV-Control: Text der Titelzeile
*
** ALV anzeigen
*  o_alv->set_table_for_first_display( EXPORTING
*                                        i_bypassing_buffer = abap_false  " Puffer ausschalten
*                                        i_save             = 'A'         " Anzeigevariante sichern
*                                       is_layout          = lv_layout     " Layout
*
*                                      CHANGING
*                                        it_fieldcatalog    = it_fcat     " Feldkatalog
*                                        it_outtab          = lt_sto24 ). " Ausgabetabelle
*
*** Focus auf ALV setzen
*  cl_gui_alv_grid=>set_focus( control = o_alv ).
*
** leere SAP-Toolbar ausblenden
* cl_abap_list_layout=>suppress_toolbar( ).
*
*
*
*
*
** erzwingen von cl_gui_container=>default_screen
* WRITE: space.




*Update zdb_sto24 set bearb_status = 'Erledigt' where stonr = '4000'.
