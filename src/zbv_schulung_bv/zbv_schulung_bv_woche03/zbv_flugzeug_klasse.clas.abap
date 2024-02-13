CLASS zbv_flugzeug_klasse DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: Pilotensitze TYPE i,
          Farbe        TYPE string,
          Treibstoff   TYPE string,
          Flugzeug_ID  TYPE i,
          Modell       TYPE string,
          Marke        TYPE string,
          Navigation   TYPE i.

    METHODS: starten, abschalten, abheben, landen, halten.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_flugzeug_klasse IMPLEMENTATION.
  METHOD abheben.
    WRITE 'abheben'.
  ENDMETHOD.

  METHOD abschalten.
    WRITE 'abschalten'.
  ENDMETHOD.

  METHOD halten.
    WRITE 'halten'.
  ENDMETHOD.

  METHOD landen.
    WRITE 'landen'.
  ENDMETHOD.

  METHOD starten.
    WRITE 'starten'.
  ENDMETHOD.

ENDCLASS.
