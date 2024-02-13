*&---------------------------------------------------------------------*
*& Report z_wiederholung_praxis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_wiederholung_praxis.
*zusatz 2: klasse für die anzeige von fluginformationen
CLASS lcl_flight_info DEFINITION.
  PUBLIC SECTION.
          CLASS-METHODS display_flights
      IMPORTING iv_customer TYPE scustom-name.
          class-METHODS display_flights2
      IMPORTING iv_customer TYPE scustom-name.
ENDCLASS.


CLASS lcl_flight_info IMPLEMENTATION.

    METHOD display_flights.

    DATA: lt_flights TYPE TABLE OF sbook,
          ls_flight  TYPE sbook.
    "selektiere flüge für den kunden
    SELECT * FROM sbook INTO TABLE lt_flights WHERE customid = iv_customer.

    "ausgabe der flugdaten
    LOOP AT lt_flights INTO ls_flight.
      WRITE: / 'flugdatum:', ls_flight-fldate,
               / 'kosten:', ls_flight-forcuram.
    ENDLOOP.
  ENDMETHOD.

    METHOD display_flights2.

    DATA: lt_flights TYPE TABLE OF sbook,
          ls_flight  TYPE sbook.
    "selektiere flüge für den kunden
    SELECT * FROM sbook INTO TABLE lt_flights WHERE customid = iv_customer.

    "ausgabe der flugdaten
    LOOP AT lt_flights INTO ls_flight.
      WRITE: / 'flugdatum:', ls_flight-fldate,
               / 'kosten:', ls_flight-forcuram.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.


* Deklaration der internen Tabelle für Kundendaten
DATA: lt_customers TYPE TABLE OF scustom,
      ls_customer  TYPE scustom.

* deklaration der internen tabelle für flugdaten
DATA: lt_flights TYPE TABLE OF sbook,
      ls_flight  TYPE sbook.

* Selektionsbild für die Eingabe des Landescodes
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: pv_counr TYPE scustom-country OBLIGATORY,
              pv_shfli TYPE abap_bool DEFAULT 'X'. " Zusatz 3
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
*selektriere kunden basierend auf dem eingegebenen landescode
  SELECT * FROM scustom INTO TABLE lt_customers WHERE country = pv_counr.

  SORT lt_customers BY country city street ASCENDING.


lcl_flight_info=>display_flights( iv_customer = '00000006' ).

lcl_flight_info=>display_flights2( iv_customer = '00000006' ).


*LOOP AT lt_customers INTO ls_customer.
*  WRITE: / 'land: ', ls_customer-country,
*          / 'stadt: ', ls_customer-city,
*          / 'straße: ', ls_customer-street.
** zusatz 3 wenn pv_shfli gesetzt ist, zeige die fluginformationen an
*  IF pv_shfli = abap_true.
*    DATA(lo_flight_info) = NEW lcl_flight_info( ).
*    lo_flight_info->display_flights(  iv_customer = ls_customer ).
*  ENDIF.
*
*ENDLOOP.



*cl_demo_output=>display( ls_customer ).

*TABLES scustom.
*parameters p_e1 type string.
*select from scustom fields * where scustom~country like @p_e1 into table @data(lt_country).
*cl_demo_output=>display( lt_customers ).
