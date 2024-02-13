*&---------------------------------------------------------------------*
*& Report zfb_w3_aufgabe_apapoo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_w3_aufgabe_apapoo.

** Erstellen Sie ein Programm OHNE TOP-Include mit folgendem Namen:
**  - Z2LxxxBC401_MAIN
**
** Deklarieren und implementieren Sie eine Klasse für Flugzeuge.
** Deklarieren Sie innerhalb des Programms die lokale Klasse LCL_AIRPLANE mit folgenden Attributen:
** MV_ NAME (Flugzeugname) TYPE STRING (privates Instanzattribut)
** MV_PLANETYPE (Flugzeugtyp) TYPE SAPLANE-PLANETYPE (privates Instanzattribut)
** GV_N_O_AIRPLANES (Instanzzähler) TYPE I (privates statisches Attribut)
**
** Definieren Sie die öffentliche Instanzmethode SET_AIRPLANE_NAME und SET_PLANTYPE
** zum Setzen der privaten Instanzattribute MV_NAME und MV_PLANETYPE.
** Ihre Methodensignatur muss jeweils aus einem entsprechenden Importparameter bestehen,
** der kompatibel zum Attribut definiert ist.
** Implementieren Sie die Methode so, dass jeweils das Instanzattribut gesetzt wird.

**CLASS lcl_airplane DEFINITION.
**
**  PUBLIC SECTION.
**    METHODS: set_airplane_name "öffentliche Instanzmethode
**      IMPORTING iv_name TYPE string. "iv = importing variable
**
**    METHODS: set_plantype "öffentliche Instanzmethode
**      IMPORTING iv_planetype TYPE saplane-planetype. "iv = importing variable
**
**    METHODS: display_attributes. "öffentliche Instanzmethode
**      WRITE: 'Airplane Name: ', mv_name.
**      WRITE: / 'Planetype: ', mv_planetyp.
**
**    CLASS-METHODS display_n_o_airplanes.
**    WRITE: /'Number of Airplanes: ', gv_n_o_airplanes. "statische Methode
**
**     ENDMETHOD.
**
**PROTECTED SECTION.
**  PRIVATE SECTION.
**    DATA: mv_name      TYPE string, "(privates Instanzattribut), mv = member variable
**          mv_planetype TYPE saplane-planetype. "(privates Instanzattribut), mv = member variable
**    CLASS-DATA gv_n_o_airplanes TYPE i. "(privates statisches Attribut)
**
**ENDCLASS.
**
**CLASS lcl_airplane IMPLEMENTATION.
**  "Implementieren Sie die Methode so, dass jeweils das Instanzattribut gesetzt wird.
**  METHOD set_airplane_name. "Setter Methode
**    mv_name = iv_name.
**  ENDMETHOD.
**
**  METHOD set_plantype. "Setter Methode
**    mv_planetype = iv_planetype.
**  ENDMETHOD.
**
**  METHOD display_attributes.
**    ev_name = mv_name. "--> Alternative zu write
**    ev_planetype = mv_planetype. "--> Alternative zu write
**    "Implementieren Sie die Methode so, dass die beiden Instanzattribute als ABAP Liste ausgegeben werden
***    WRITE: icon_green_light.
***    WRITE: / |Der Name ist: { mv_name }|.
***    WRITE: / |Der Flugzeugtype ist: { mv_planetype }|.
**  ENDMETHOD.
**
**  METHOD display_n_o_airplanes.
**    "Implementieren Sie die Methode derart, daß der Wert des statischen Attributes auf der ABAP Liste (Befehl WRITE) ausgegeben wird
***    ev_n_o_airplanes = gv_n_o_airplanes.
**    WRITE: / |Der Name ist: { gv_n_o_airplanes }|.
**  ENDMETHOD.
**
**ENDCLASS.
**
**DATA: go_airplane   TYPE REF TO lcl_airplane,
**      gt_airplanes  TYPE TABLE OF REF TO lcl_airplane.
**
**START-OF-SELECTION.
**  CREATE OBJECT go_airplane.
**  APPEND go_airplane TO gt_airplanes.
**
**  CREATE OBJECT go_airplane.
**  APPEND go_airplane TO gt_airplanes.
**
**END-OF-SELECTION.
**
**lcl_airplane=>display_n_o_airplanes(  ).

*go_airplane->display_attributes( ).
*go_airplane = NEW #(  ).
*go_airplane->set_airplane_name( iv_name = 'Airbus A380').

*lcl_airplane=>display_n_o_airplanes(  ).
** ENDE Aufgabe ABAP OO Seite 1 vom PDF ( Seite 10 in Powerpoint )

** Aufgabenteil 2:
** Definieren Sie die öffentliche Instanzmethode DISPLAY_ATTRIBUTES zum Anzeigen der privaten Instanzattribute.
** Implementieren Sie die Methode so, dass die beiden Instanzattribute als ABAP Liste ausgegeben werden.
** [Zusätzlich können Icons ausgegeben werden, wenn die Typgruppe ICON geladen ist ( TYPE-POOLS icon )].
**
** Definieren Sie die öffentliche statische Methode DISPLAY_N_O_AIRPLANES zum Anzeigen
** des privaten statischen Attributes. Implementieren Sie die Methode derart, daß der Wert
** des statischen Attributes auf der ABAP Liste (Befehl WRITE) ausgegeben wird.
** (Bisher ist noch nicht dafür gesorgt, daß der Instanzzähler aktualisiert wird).
**
** Ordnen Sie für eine bessere Übersicht die Listausgabe in zwei Spalten an;
** eine für den beschreibenden Text und einen für die Attributwerte.
** Verwenden Sie dafür den Zusatz AT<nummer> in der WRITE Anweisung.
** Um spätere Anpassungen zu erleichtern, verwenden Sie kein Literal
** sondern stattdessen die private Konstante C_POS_1, um die Position anzugeben.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS set_airplane_name IMPORTING iv_name      TYPE string.
    METHODS set_planetype     IMPORTING iv_planetype TYPE saplane-planetype.

    METHODS display_attributes.

    CLASS-METHODS display_n_o_airplanes.
    CLASS-METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i.
    CLASS-METHODS get_n_o_airplanes_exp EXPORTING ev_count TYPE i.

  PRIVATE SECTION.
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.

    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: /'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes_exp.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ev_count = gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA go_airplane TYPE REF TO lcl_airplane.

  lcl_airplane=>display_n_o_airplanes( ).
  go_airplane = NEW #( ).
  lcl_airplane=>display_n_o_airplanes( ).                     " Statische Methodenaufruf

  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).
  go_airplane->set_planetype( iv_planetype = 'Boing 787' ).

  go_airplane->display_attributes( ).

  DATA gv_number_of_airplanes TYPE i.

  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ). " Funktionaler Methodenaufruf

  WRITE: /'Counter ist gleich: ' , gv_number_of_airplanes.

  go_airplane->get_n_o_airplanes_exp(
    IMPORTING
      ev_count = gv_number_of_airplanes
  ).                                                          " Instanzmethodenaufruf

  WRITE: /'Counter ist gleich: ' , gv_number_of_airplanes.
