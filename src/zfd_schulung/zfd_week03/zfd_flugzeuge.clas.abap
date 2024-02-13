CLASS zfd_flugzeuge DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hersteller        TYPE string,
          modell            TYPE string,
          anzahl_triebwerke TYPE i,
          treibstoff        TYPE string.

    METHODS:
      hoehe_messen,
      schub_geben,
      ruder_steuern.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zfd_flugzeuge IMPLEMENTATION.
  METHOD hoehe_messen.

  ENDMETHOD.

  METHOD ruder_steuern.

  ENDMETHOD.

  METHOD schub_geben.

  ENDMETHOD.

ENDCLASS.
