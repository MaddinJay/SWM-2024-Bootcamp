CLASS zbv_passierflugzeug_klasse DEFINITION
  PUBLIC
  INHERITING FROM zbv_flugzeug_klasse
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: Passagiersitzplatz TYPE i,
          toilettenanzahl    TYPE i,
          bildschirmanzahl   TYPE i,
          kuechenfarbe       TYPE string.

    METHODS: anzeige_fluginfo, anzeige_filme, zubereitung_mahlzeit.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_passierflugzeug_klasse IMPLEMENTATION.


  METHOD anzeige_filme.
    WRITE: 'Film anzeigen'.
  ENDMETHOD.


  METHOD anzeige_fluginfo.
    WRITE: 'Fluginfo anzeigen'.
  ENDMETHOD.


  METHOD zubereitung_mahlzeit.
    WRITE: 'Fahlzeit zubereiten'.
  ENDMETHOD.
ENDCLASS.
