*&---------------------------------------------------------------------*
*& Report z2llvvbc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z2llvvbc401_main.


TYPE-POOLS icon.

CLASS lcl_airplane DEFINITION.  " Definition der lokalen Klasse LCL_AIRPLANE.
  PUBLIC SECTION.
    METHODS: "constructor,  " Konstruktor-Methode wird aufgerufen, wenn ein Objekt der Klasse erstellt wird.
      set_airplane_name IMPORTING iv_name TYPE string,  " Methode zum Setzen des Flugzeugnamens.
      set_planetype IMPORTING iv_planetype TYPE saplane-planetype,  " Methode zum Setzen des Flugzeugtyps.
      display_info,  " Methode zur Anzeige der Informationen über das Flugzeug.
      get_total_airplanes RETURNING VALUE(rv_total) TYPE i,  " Methode zur Rückgabe der Gesamtanzahl der Flugzeuge.
      display_attributes EXPORTING ev_name      TYPE string
                                   ev_planetype TYPE saplane-planetype.



    CLASS-METHODS: display_n_o_airplane, "definiert eine Klassenmethode namens display_g_o_airplane
      get_n_o_airplane RETURNING VALUE(rv_count) TYPE i,
      get_n_o_airplane_exp EXPORTING ev_count    TYPE i.


    CLASS-DATA: gv_n_o_airplanes TYPE i.  " Statisches Instanzzählerattribut für die Gesamtanzahl der Flugzeuge.

  PRIVATE SECTION.  " Private Sektion für private Attribute und Methoden.
    DATA: mv_name      TYPE string,  " Instanzattribut für den Flugzeugnamen.
          mv_planetype TYPE saplane-planetype.  " Instanzattribut für den Flugzeugtyp.
*          GV_N_O_AIRPLANES TYPE I.  " Statisches Instanzzählerattribut für die Gesamtanzahl der Flugzeuge.
*


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"methoden
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




ENDCLASS.



CLASS lcl_airplane IMPLEMENTATION.

*METHOD constructor.
*
*ENDMETHOD.

  METHOD display_info.

  ENDMETHOD.

  METHOD get_total_airplanes.

  ENDMETHOD.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: / 'airplane name: ', mv_name.
    WRITE: / 'planetype: ', mv_planetype.
    WRITE: / icon_green_light,
    mv_name, '|', mv_planetype. ULINE.
  ENDMETHOD.

  METHOD display_n_o_airplane. "number of airplane"
    WRITE: / 'number of airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplane.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplane_exp.
    ev_count = gv_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
  ENDMETHOD.

ENDCLASS.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


START-OF-SELECTION.

  DATA:
    go_airplane TYPE REF TO lcl_airplane. "deklaration
*    gt_airplane TYPE TABLE OF REF TO lcl_airplane. "kann man auskommentieren, bräuchten wir jetzt nicht

*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.

*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.

  lcl_airplane=>display_n_o_airplane( ). "klassennamen verwenden und anstatt - verwenden, = verwenden.


  go_airplane = NEW #( ). "instanz erstellt.
*  APPEND go_airplane TO gt_airplane.

  lcl_airplane=>display_n_o_airplane( ). "statische methoden brauchen keine instanz.

*  go_airplane->display_attributes( ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "instanz methoden aufrufen
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  go_airplane->set_airplane_name( EXPORTING iv_name = 'airbus' ). "für instanz methoden braucht man die instanz. (siehe go_airplane = NEW #()
  go_airplane->set_planetype( iv_planetype = 'boeing 787' ). "manipulierst die variablen, manipuliermethoden "set"
  go_airplane->display_attributes(  ). "ausgabe methode "display""


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "funktionale methode
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  DATA gv_number_of_airplane type i.

  gv_number_of_airplane = go_airplane->get_n_o_airplane( ). "funktionaler aufruf.

  WRITE: / 'COUNTER ist gleich: ', gv_number_of_airplane.

  go_airplane->get_n_o_airplane_exp( "instanzmethodenaufruf
    IMPORTING
      ev_count = gv_number_of_airplane
      ).

*  go_airplane->set_airplane_name( EXPORTING iv_name = 'gv_name' ).
