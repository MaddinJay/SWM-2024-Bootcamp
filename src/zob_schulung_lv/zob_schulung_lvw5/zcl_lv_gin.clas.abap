CLASS zcl_lv_gin DEFINITION
  PUBLIC
  INHERITING FROM ZCL_lv_getraenk
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehe_menge REDEFINITION.
    methods constructor.
        CLASS-METHODS display_flights
      IMPORTING iv_customer TYPE scustom-name.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lv_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge / 2 ).
  ENDMETHOD.

  METHOD constructor.

    super->constructor( ).

  ENDMETHOD.

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

ENDCLASS.
