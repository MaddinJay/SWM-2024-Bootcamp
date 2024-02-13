CLASS zst_schulung_flugzeuge DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: name TYPE string,
          model TYPE n,
          flugzeit TYPE t.

          INTERFACES zst_schulung_flugtauglich.

          Methods: starten, landen, notlanden.

  PROTECTED SECTION.
    DATA: heimat          TYPE string,
          geschwindigkeit TYPE i,
          alter           TYPE i,
          tank            TYPE i,
          designnr        TYPE n.
           PRIVATE SECTION.

           Methods: bremsen, anfrage, persplanung.

ENDCLASS.



CLASS zst_schulung_flugzeuge IMPLEMENTATION.
  METHOD landen.

  ENDMETHOD.

  METHOD notlanden.

  ENDMETHOD.

  METHOD starten.

  ENDMETHOD.

  METHOD anfrage.

  ENDMETHOD.

  METHOD bremsen.

  ENDMETHOD.

  METHOD persplanung.

  ENDMETHOD.

  METHOD zst_schulung_flugtauglich~ja.

  ENDMETHOD.

  METHOD zst_schulung_flugtauglich~nein.

  ENDMETHOD.

ENDCLASS.
