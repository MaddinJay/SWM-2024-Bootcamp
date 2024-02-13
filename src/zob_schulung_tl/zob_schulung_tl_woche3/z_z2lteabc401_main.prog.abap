*&---------------------------------------------------------------------*
*& Report z_z2lteabc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_z2lteabc401_main.

CLASS lcl_airplane DEFINITION. "Lokale Klasse angelegt
  PUBLIC SECTION.

    METHODS set_airplane_name IMPORTING iv_name TYPE string. "Öffentlich Instanzmethode: set_airplane_name, iv_name = importing variable
    METHODS set_planetype IMPORTING iv_planetype TYPE saplane-planetype. "iv = importing variable
    METHODS: display_attributes. "EXPORTING ev_name TYPE string
    "ev_planetype TYPE saplane-planetype.

    "Aufgabe 3.2 Definieren Sie in der Klasse die öffentliche statische funktionale Methode + Aufrufen
    CLASS-METHODS get_n_o_airplaines RETURNING VALUE(rv_count) TYPE i.



    CLASS-METHODS: display_n_o_airplanes. "EXPORTING ev_no_o_airplanes TYPE i..

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: mv_name      TYPE string, "Flugzeugname, privates Instanzattribut
          mv_planetype TYPE saplane-planetype. "Flugzeugtype, privates Instanzattribut

    CLASS-DATA gv_n_o_airplanes TYPE i. "weil statisch:CLASS-DATA


ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.


  "Implementieren Sie die Methode so, dass jeweils Instanz Attribut gesetzt wird.
  METHOD set_airplane_name.

    mv_name = iv_name. "Importvariable erstellt

  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.

  ENDMETHOD.

  METHOD display_attributes.
*  ev_name = mv_name. "--> Alternative zu WRITE
*  mv_planetype = ev_planetype.  "--> Alternative zu WRITE
    WRITE: icon_green_light.
    WRITE: / 'Airplane Name: ', mv_name.
    WRITE: / 'Planetype: ', mv_planetype.

  ENDMETHOD.

  METHOD display_n_o_airplanes.
    "Implementieren Sie die Methode derart, dass der Wert des statischen Attributes auf der ABAP Liste (Befehl WRITE) ausgegeben wird.
    "ev_no_o_airplanes = gv_n_o_airplanes. --> Alternative zu WRITE
    WRITE: / 'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplaines.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

"Definieren Sie eine Referenzvariable für Instanzen Ihrer Klasse LCL_AIRPLANE.
"Definieren Sie eine interne Tabelle zum Puffern der Referenzen auf Instanzen Ihrer Klasse LCL_AIRPLANE

"    DATA: go_airplane TYPE REF TO lcl_airplane.
"         gt_airplane TYPE TABLE OF REF TO lcl_airplane.

"Erzeugen Sie mehrere Instanzen Ihrer lokalen Klasse LCL_AIRPLANE und pufferne Sie deren Referenzen in Ihrer internen Tabelle. START-OF-SELECTION
"START-OF-SELECTION.
"    CREATE OBJECT go_airplane.
"   APPEND go_airplane TO gt_airplane.

*cl_demo_output=>display( gt_airplane ).
"Instanz Methode aufgerufen:
"go_airplane->display_attributes(  ).

"Instanzmethoden aufrufen --> Die IMPORTING Parameter haben siehe oben:
*go_airplane->set_airplane_name( EXPORTING iv_name = 'Lufthansa' ). VARIANTE 1
"go_airplane->set_airplane_name( iv_name = 'Lufthansa' ). "VARIANTE 2

"Statische Methoden aufrufen
"lcl_airplane=>display_n_o_airplanes(  ).


""Aufgabe 3:

DATA: go_airplane TYPE REF TO lcl_airplane.

START-OF-SELECTION.
  lcl_airplane=>display_n_o_airplanes(  ).
  go_airplane = NEW #(  ). "Instanzieren von go_airplane
  go_airplane->display_n_o_airplanes(  ).

  "Setzen Sie die Attribute für alle Objekte mithilfe der Methode SET_ATTRIBUTES.
  go_airplane->set_airplane_name(  iv_name = 'Airbus' ).
  go_airplane->set_planetype( iv_planetype = 'Boing 787' ).
  "Attribute ausgeben lassen:
  go_airplane->display_attributes(  ).

  "Aufgabe 3.2
  DATA gv_number_of_airplanes TYPE i.
  "Funktionaler Aufruf
  gv_number_of_airplanes = go_airplane->get_n_o_airplaines( ).
  WRITE: / 'Counter ist gleich: ', gv_number_of_airplanes.
  END-OF-SELECTION.
