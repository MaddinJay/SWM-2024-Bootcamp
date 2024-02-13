*&---------------------------------------------------------------------*
*& Report zas_bc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_bc401_main.

CLASS lcl_airplane DEFINITION.

  "Ihre Methodensignatur muss jeweils aus einem entsprechenden Importparameter bestehen, der kompatibel zum Attribut definiert ist
  PUBLIC SECTION.
    METHODS: set_airplane_name "öffentliche Instanzmethode
      IMPORTING iv_name TYPE string. "iv = importing variable

    METHODS: set_plantype "öffentliche Instanzmethode
      IMPORTING iv_planetype TYPE saplane-planetype. "iv = importing variable

    METHODS: display_attributes "öffentliche Instanzmethode
      EXPORTING ev_name      TYPE string
                ev_planetype TYPE saplane-planetype.

    CLASS-METHODS display_n_o_airplanes. "statische Methode

* Erklärung fehlt!!!
    CLASS-METHODS get_n_o_airplanes
      RETURNING VALUE(rv_count) TYPE i.
    " oder: get_n_o_airplanes_exp EXPORTING ev_count type i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mv_name      TYPE string, "(privates Instanzattribut), mv = member variable
          mv_planetype TYPE saplane-planetype. "(privates Instanzattribut), mv = member variable
    CLASS-DATA gv_n_o_airplanes TYPE i. "(privates statisches Attribut)

ENDCLASS.

**********************************************************************
CLASS lcl_airplane IMPLEMENTATION.
  "Implementieren Sie die Methode so, dass jeweils das Instanzattribut gesetzt wird.
  METHOD set_airplane_name. "Setter Methode
    mv_name = iv_name.

  ENDMETHOD.

* Erklärung fehlt!!!
  METHOD set_plantype. "Setter Methode
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    ev_name = mv_name. "--> Alternative zu write
    ev_planetype = mv_planetype. "--> Alternative zu write
    "Implementieren Sie die Methode so, dass die beiden Instanzattribute als ABAP Liste ausgegeben werden
*    WRITE: icon_green_light.
*    WRITE: / |Der Name ist: { mv_name }|.
*    WRITE: / |Der Flugzeugtype ist: { mv_planetype }|.
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    "Implementieren Sie die Methode derart, daß der Wert des statischen Attributes auf der ABAP Liste (Befehl WRITE) ausgegeben wird
*    ev_n_o_airplanes = gv_n_o_airplanes.
    WRITE: / 'Number of Airplanes: '.
  ENDMETHOD.

* Erklärung fehlt!!!
  METHOD get_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.
    "oder: ev_count = gv_n_o_airplanes. (Bei EXPORTING)
  ENDMETHOD.

ENDCLASS.

**********************************************************************
START-OF-SELECTION.
*  CREATE OBJECT gv_airplane. "Alte Variante, besser: gv_airplane = NEW #( )
*  APPEND gv_airplane TO gt_airplane.

  DATA: gv_airplane            TYPE REF TO lcl_airplane,
        gt_airplane            TYPE TABLE OF REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.


  gv_airplane = NEW #(  ). "Es wird eine Instanz der Klasse erstellt und der Variable gv_airplane zugewiesen

**********************************************************************
* statischer Methodenaufruf
**********************************************************************
  lcl_airplane=>display_n_o_airplanes( ).
  "Es wird die statische Methode(!) display_n_o_airplanes() der Klasse lcl_airplane aufgerufen

  gv_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).

  "Es wird die Methode set_airplane_name der Klasse lcl_airplane aufgerufen,
  "auf die gv_airplane zeigt und dieser übergibt dabei den Wert 'Airbus' für den Importparameter 'iv_name'
  "Exporting: um anzugeben, dass es sich um einen Importparameter handelt,
  "der von außen (vom Aufrufer) an die Methode übergeben wird.
  gv_airplane->set_plantype( EXPORTING iv_planetype = 'Boing 747' ).


  gv_airplane->display_attributes( ). "Es wird die Instanzmethode display_attributes() der Klasse lcl_airplane aufgerufen

**********************************************************************
* Funktionaler Methodenaufruf, ERKLÄRUNG fehlt!!!
**********************************************************************
  gv_number_of_airplanes = gv_airplane->get_n_o_airplanes( ).
  WRITE: /'Nummer: ', gv_number_of_airplanes.

" Wenn man einen exporting Parameter hat, siehe Zeile 71 (Instanzmethodenaufruf)
*  gv_airplane->get_n_o_airplanes_exp(
*  IMPORTING
*  ev_count = gv_number_of_airplanes
*  ).
* WRITE: /'Nummer: ', gv_number_of_airplanes.

*cl_demo_output=>display( gt_airplane ).

END-OF-SELECTION.

  "gv_airplane->set_airplane_name( EXPORTING iv_name = 'Lufthansa' ). "Wenn man nur einen Parameter hat, braucht man das Exporting nicht mehr
  " bei Instanzmethoden: Variable->methode().
  "lcl_airplane=>display_n_o_airplanes( ). "Statische Methode außerhalb der Instanziierung aufrufen
  "bei statischen Methoden: Klassenname=>methode().
