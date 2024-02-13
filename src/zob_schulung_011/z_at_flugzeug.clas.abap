CLASS z_at_flugzeug DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: flugzeugid     TYPE i,
          gepaeckraum    TYPE i,
          sitzgurtAnzahl TYPE i,
          toiletteAnzahl TYPE i,
          flugzeugArt    TYPE string,
          flugzeugname   TYPE string.

    METHODS:
      fliegen,
      landen,
      bremsen,
      beschlenigen,
      navigieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_at_flugzeug IMPLEMENTATION.
  METHOD beschlenigen.

  ENDMETHOD.

  METHOD bremsen.

  ENDMETHOD.

  METHOD fliegen.

  ENDMETHOD.

  METHOD landen.

  ENDMETHOD.

  METHOD navigieren.

  ENDMETHOD.

ENDCLASS.
