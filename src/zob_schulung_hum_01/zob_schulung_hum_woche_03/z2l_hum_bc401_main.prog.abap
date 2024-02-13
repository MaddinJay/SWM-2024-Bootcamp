*&---------------------------------------------------------------------*
*& Report z2l_hum_bc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z2l_hum_bc401_main.
*
*Deklarieren und implementieren Sie eine Klasse für Flugzeuge.
*Deklarieren Sie innerhalb des Programms die lokale Klasse LCL_AIRPLANE mit folgenden Attributen:
*MV_ NAME (Flugzeugname) TYPE STRING (privates Instanzattribut)
*MV_PLANETYPE (Flugzeugtyp) TYPE SAPLANE-PLANETYPE (privates Instanzattribut)
*GV_N_O_AIRPLANES (Instanzzähler) TYPE I (privates statisches Attribut)

*Definieren Sie die öffentliche Instanzmethode SET_AIRPLANE_NAME und SET_PLANTYPE
*zum Setzen der privaten Instanzattribute MV_NAME und MV_PLANETYPE.
*Ihre Methodensignatur muss jeweils aus einem entsprechenden Importparameter bestehen,
*der kompatibel zum Attribut definiert ist.

*Definieren Sie die öffentliche Instanzmethode DISPLAY_ATTRIBUTES zum Anzeigen der privaten Instanzattribute.
*Implementieren Sie die Methode so, dass die beiden Instanzattribute als ABAP Liste ausgegeben werden.
*[Zusätzlich können Icons ausgegeben werden, wenn die Typgruppe ICON geladen ist ( TYPE-POOLS icon )].

CLASS lcl_flugzeuge DEFINITION.
  PUBLIC SECTION.
    METHODS:
      set_airplane_name                                   "öffentliche Instanzmethode
        IMPORTING iv_name TYPE string,                     " iv importing variable

      set_planetype
        IMPORTING iv_planetype TYPE saplane-planetype,

      display_attributes
        EXPORTING ev_name      TYPE string
                  ev_planetype TYPE saplane-planetype.


    CLASS-METHODS: display_n_o_airplanes                   "öffentliche statische Methode
      EXPORTING ev_n_o_airplanes TYPE i,
      get_n_o_airplane                                    "öffentliche statische funktionale Methode
        RETURNING VALUE(rv_count) TYPE i.                 "Returning Parameter




  PRIVATE SECTION.                                         "private Attribute
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.
    CLASS-DATA: gv_n_o_airplanes TYPE i,
                gv_n_o_airplane TYPE i,
                rv_count Type i.


ENDCLASS.

CLASS lcl_flugzeuge IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
*    WRITE iv_name.                   "Auskommentiert, da es sonst doppelt kommt

  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
*    WRITE iv_planetype.              "Auskommentiert, da es sonst doppelt kommt
  ENDMETHOD.

  METHOD display_attributes.
*    mv_name = ev_name.  "--> alternative zu write, daher auskommentiert
*    mv_planetype = ev_planetype. "--> alternative zu write, daher auskommentiert
    WRITE: icon_green_light,
           / 'Der Flugzeugname lautet:', mv_name,
           / 'Der Flugzeugtyp ist:', mv_planetype.

  ENDMETHOD.

  METHOD display_n_o_airplanes.
    gv_n_o_airplanes = ev_n_o_airplanes.
    WRITE: 'Number of Airlines:', ev_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplane.
  gv_n_o_airplane = gv_n_o_airplane + 1.
    rv_count = gv_n_o_airplane.
  ENDMETHOD.


ENDCLASS.

START-OF-SELECTION.           "Zum erreichen der Anweisungen
  DATA:
    gr_flugzeuge  TYPE REF TO lcl_flugzeuge,
    grt_flugzeuge TYPE TABLE OF REF TO lcl_flugzeuge.
  gr_flugzeuge = NEW #( ).
*  APPEND gr_flugzeuge TO grt_flugzeuge.

  "Instanzmethoden aufrufen

* gr_flugzeuge->display_attributes( ).  "Instanzmethode aufrufen
  gr_flugzeuge->set_airplane_name( EXPORTING iv_name = 'Lufthansa' ). "Importierte Variablen müssen exportiert werden
  gr_flugzeuge->set_planetype( iv_planetype = 'A308' ). "Wenn nur eine Variable, dann kann Exporting auch weggelassen werden
  gr_flugzeuge->display_attributes( ).
  DATA: gv_n_o_airplanes TYPE i,
  gv_number_of_airplanes Type i.



  "statische Methoden aufrufen

  lcl_flugzeuge=>display_n_o_airplanes( IMPORTING ev_n_o_airplanes = gv_n_o_airplanes ). "Exportierte Variablen müssen importiert werden.


  "Funktionale Methode aufrufen
gv_number_of_airplanes = gr_flugzeuge->get_n_o_airplane( ).
WRITE gv_number_of_airplanes.
