*&---------------------------------------------------------------------*
*& Report zea_aufgabe_class
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_aufgabe_class.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_name TYPE string iv_planetype TYPE saplane-planetype "iv_weight TYPE saplane-weight iv_tankcap TYPE saplane-tankcap . "Import = Methode braucht etwas von außen
                        EXCEPTIONS wrong_call. "Klassische Exception

    METHODS set_airplane_name IMPORTING iv_name TYPE string.
    METHODS set_planeytype    IMPORTING iv_planetype TYPE saplane-planetype. "iv weil Importing-Variable

    METHODS display_attributes EXPORTING ev_name TYPE string ev_planetype TYPE saplane-planetype. "Exoprt = Methode gibt Informationen aus

    CLASS-METHODS display_n_o_airplanes EXPORTING ev_n_o_airplanes TYPE i.

    CLASS-METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i. "Returning wird benutzt um private Attribute anzeigen zu können.

    CLASS-METHODS get_n_o_airplanes_exp EXPORTING ev_count TYPE i.

  PRIVATE SECTION.

    DATA: mv_name      TYPE string,            "Instanzattribut
          mv_planetype TYPE saplane-planetype, "Instanzattribut
          mv_weight    TYPE saplane-weight,
          mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA: gv_n_o_airplanes TYPE i. "Statisches Attribut


ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planeytype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
*    ev_name = mv_name. "--> Alternative zu Write
*    ev_planetype = mv_planetype."--> Alternative zu Write
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
    WRITE: /'Weight: ', mv_weight.
    WRITE: /'Tankcap: ', mv_tankcap.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
*    ev_n_o_airplanes = gv_n_o_airplanes.
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

  METHOD constructor.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    SELECT SINGLE                 "Daten aus der Datenbank mit SELECT SINGLE ziehen
    FROM saplane
    FIELDS weight, tankcap
    WHERE planetype = '737-800'
    INTO @DATA(ls_struktur).
    " DB Selekt -> Wir finden keinen Eintrag ind er Datenbank => Exception werfen
*  mv_weight = iv_weight.
*  mv_tankcap = iv_tankcap.
    mv_weight = ls_struktur-weight.   "Daten aus der durch den SELECT-Befehl erstellten Struktur gleichsetzen mit den Variablen.
    mv_tankcap = ls_struktur-tankcap.
    ADD 1 TO gv_n_o_airplanes.
    RAISE wrong_call. "=> Raus aus dem Programm
  ENDMETHOD.

ENDCLASS.

"Definieren Sie eine Referenzvariable für Instanzen Ihrer Klasse LCL_AIRPLANE
*DATA: go_airplane TYPE REF TO lcl_airplane.
*      gt_airplane TYPE TABLE OF REF TO lcl_airplane. "Definieren Sie eine interne Tabelle zum Puffern der Referenzen auf Instanzen Ihrer Klasse LCL-AIRPLANE

*START-OF-SELECTION. "Mit START-OF-SELECTION wird der ausführbare Teil des Programmes festgelegt.
*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.
*
*  go_airplane = NEW #( ).
*  APPEND go_airplane TO gt_airplane.
*
*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.

*  cl_demo_output=>display( gt_airplane ).

*go_airplane->display_attributes( ). "Instanzenmethode bei Export-Variablen aufrufen
*
*go_airplane->set_airplane_name( EXPORTING iv_name = 'Lufthansa'). "Instanzenmethode bei Import-Variablen aufrufen (EXPORTING muss nicht geschrieben werden)
*
*lcl_airplane=>display_n_o_airplanes( ). "Statische Methode aufrufen

START-OF-SELECTION.


  DATA go_airplane TYPE REF TO lcl_airplane.
  lcl_airplane=>display_n_o_airplanes( ).
*  go_airplane = NEW #( iv_name = 'AirBus' iv_planetype = 'Boing 787' ).    "iv_weight = 33000 iv_tankcap = 1000 ). "Objekt erstellen für Constructor

  CREATE OBJECT go_airplane
    EXPORTING
      iv_name      = 'AirBus'
      iv_planetype = 'Boing 787'
    EXCEPTIONS
      wrong_call   = 1.
  IF sy-subrc <> 0.
    WRITE: 'Keine Daten zum PlaneType geunden'.
    EXIT.
  ENDIF.


  "iv_weight = 33000 iv_tankcap = 1000 ). "Objekt erstellen für Constructor
  lcl_airplane=>display_n_o_airplanes( ).                   "Statische Methodenaufruf

*  go_airplane->set_airplane_name( EXPORTING iv_name = 'AirBus' ).
*  go_airplane->set_planeytype( iv_planetype = 'Boing 787' ).

  go_airplane->display_attributes( ).

  DATA gv_number_of_airplanes TYPE i.

  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ). "Funktionaler Methodenaufruf
  WRITE: /'Counter ist gleich: ', gv_number_of_airplanes.

  go_airplane->get_n_o_airplanes_exp(
    IMPORTING
        ev_count = gv_number_of_airplanes
    ).                                                         "Instanzmethodenaufruf

  WRITE: /'Counter ist gleich: ', gv_number_of_airplanes.
