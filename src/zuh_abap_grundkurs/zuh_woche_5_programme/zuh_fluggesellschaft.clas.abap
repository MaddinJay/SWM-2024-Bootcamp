CLASS zuh_fluggesellschaft DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA fluggesellschaftsname TYPE string.
    DATA Moto TYPE string.
    DATA Sprache TYPE string.
    DATA Heimatflughafen TYPE string.

    METHODS buchungenverwaltung.
    METHODS Rechnungsverwaltung.
    METHODS Personalverwaltung.
    METHODS Flugzeugverwaltung.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA Besitzer TYPE string.

ENDCLASS.

CLASS zuh_fluggesellschaft IMPLEMENTATION.
  METHOD buchungenverwaltung.

  ENDMETHOD.

  METHOD flugzeugverwaltung.

  ENDMETHOD.

  METHOD personalverwaltung.

  ENDMETHOD.

  METHOD rechnungsverwaltung.

  ENDMETHOD.

ENDCLASS.
