CLASS zuh_flugzeug DEFINITION  INHERITING FROM zuh_fluggesellschaft
  PUBLIC

  CREATE PUBLIC .
  PUBLIC SECTION.
    DATA Pilot TYPE string.
    DATA Treibstoffmenge TYPE i.
    DATA Crew_art TYPE string.

  PROTECTED SECTION.
    DATA Checkliste TYPE string.  " Hier währe eine Tabelle schön

  PRIVATE SECTION.

    METHODS Tanken.
    METHODS Warten.
    METHODS Fliegen.

ENDCLASS.


CLASS zuh_flugzeug IMPLEMENTATION.
  METHOD fliegen.

  ENDMETHOD.

  METHOD tanken.

  ENDMETHOD.

  METHOD warten.

  ENDMETHOD.

ENDCLASS.
