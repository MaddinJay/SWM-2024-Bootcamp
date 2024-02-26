*&---------------------------------------------------------------------*
*& Report zbv_wiederholung_woche01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_wiederholung_woche01.

** Wiederholung Woche 1
*
*"Datendeklaration
*"Elementarer Typ deklarieren
*DATA lv_zahl TYPE i VALUE 3.
*
*"Variable ausgeben
*WRITE lv_zahl.
*cl_demo_output=>display( lv_zahl ).
*
*"Datenmanipulation
*lv_zahl = lv_zahl + 8.
*
*"Systemwerte
*WRITE sy-uname.
*
*"Konstanten
*CONSTANTS c_wert TYPE string VALUE 'Test'.
*
*"Typdeklaration
*TYPES: ty_wert(6) TYPE c,
*       ty_wert2   TYPE c LENGTH 6.
*
*"Struktur deklarieren
*DATA: BEGIN OF ls_kunde,
*        id    TYPE i,
*        name  TYPE string,
*        alter TYPE i,
*      END OF ls_Kunde.
*
*"Struktur befüllen
*ls_kunde-id = 5.
*ls_kunde-name = 'Test'.
**cl_demo_output=>display( ls_kunde ).
*ls_kunde = VALUE #( id = 7 ).
*ls_kunde = VALUE #( BASE ls_kunde name = 'Testi').
*ls_kunde-alter = 12.
*ls_kunde = VALUE #( id = 20 ).
**cl_demo_output=>display( ls_kunde ).
*
*"Tabelle deklarieren
*DATA: lt_tabelle LIKE TABLE OF ls_kunde.
*
*"Tabelle befüllen
*APPEND ls_kunde TO lt_tabelle.
*APPEND VALUE #( id = 5 ) TO lt_tabelle.
*INSERT ls_kunde INTO lt_tabelle INDEX 1. "Fügt eine Zeile an der angegebenen Stelle an
*lt_tabelle = VALUE #( BASE lt_tabelle "Das BASE sorgt dafür, dass die Werte aus diesem Befehl in die Tabelle eingefügt werden und die vorherigen nicht gelöscht werden.
*                    ( id = 8 name = 'Name 1' alter = 12 )
*                    ( id = 12  name = 'Name2' alter = 7 )
*                              ). "Bei dem Befehl mehrere Klammern für mehrere Zeilen.
*
*lt_tabelle = VALUE #(                                     " Dieser Befehl löscht die kompletten Daten aus der Tabelle und fügt die aus dem Befehl ein.
*                    ( id = 8 name = 'Name 1' alter = 12 )
*                    ( id = 12  name = 'Name2' alter = 7 )
*                              ).
*
*WRITE 'Test'.
*
*"Schleife
*"Loop -> Tabellen
*"While Bed
*"do x Times.
*
*"Verzweigung
*"if -> kann mehrere Werte prüfen
*"case -> prüft nur einen Wert
*
*
**if ls_Kunde-alter = 10 AND ls_kunde-name = 'Test'. -> bei String wird auf Groß- und Kleinschreibung geachtet.
*
*SELECTION-SCREEN PUSHBUTTON 2(8) btn1 USER-COMMAND cmd1.
*
*INITIALIZATION.
*  WRITE icon_execute_object TO btn1.  " Icon über WRITE in Button schreiben
*  btn1+4 = 'Btn-Text'.
* Eventhandler für neuen Button

CLASS lcl_events DEFINITION.
  PUBLIC SECTION.
* Bezeichner des Buttons
    CONSTANTS: co_btn_xl_export TYPE string VALUE 'BTN_XL_EXPORT'.

    CLASS-METHODS : on_toolbar_click FOR EVENT added_function OF cl_salv_events_table
      IMPORTING
          e_salv_function
          sender.
ENDCLASS.

CLASS lcl_events IMPLEMENTATION.
  METHOD on_toolbar_click.
    CASE e_salv_function.
      WHEN co_btn_xl_export.
        MESSAGE co_btn_xl_export TYPE 'S'.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.


  DATA: o_alv TYPE REF TO cl_salv_table.
  DATA: it_tab TYPE table of sflight.

  cl_salv_table=>factory( EXPORTING
                            r_container = cl_gui_container=>default_screen
                          IMPORTING
                            r_salv_table = o_alv
                          CHANGING
                            t_table = it_tab ).

.

* Eigenen SALV-Button hinzufügen
* das Hinzufügen des Buttons funktioniert nur, wenn die SALV-Table innerhalb eines Containers (z.B. cl_gui_container=>default_screen) eingebettet ist
  o_alv->get_functions( )->add_function( name = |{ lcl_events=>co_btn_xl_export }|
                                         icon = |{ ICON_EXECUTE_OBJECT }|
                                         tooltip = 'Daten speichern'
                                         position = if_salv_c_function_position=>right_of_salv_functions ).

* Eventhandler für Klicks in die Toolbar des SALV-Grids setzen
  SET HANDLER lcl_events=>on_toolbar_click FOR o_alv->get_event( ).

* SALV anzeigen
  o_alv->display( ).

* Listausgabe erzwingen für Erzeugung von cl_gui_container=>default_screen
  WRITE: space.
