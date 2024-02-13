CLASS zbv_fluggesellschaft_klasse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: Name           TYPE string,
          id             TYPE i,
          Herkunftsort   TYPE string,
          Gruendungsjahr TYPE i,
          Beschaeftigte  TYPE i.

    METHODS: flug_buchen, flug_stornieren, fuginformation_abrufen, flugstatus_aktualisieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_fluggesellschaft_klasse IMPLEMENTATION.
  METHOD flugstatus_aktualisieren.
    WRITE 'Flugstatus aktualisieren'.
  ENDMETHOD.

  METHOD flug_buchen.
    WRITE 'Flug buchen'.
  ENDMETHOD.

  METHOD flug_stornieren.
    WRITE 'Flug stornieren'.
  ENDMETHOD.

  METHOD fuginformation_abrufen.
    WRITE 'Fluginformation abrufen'.
  ENDMETHOD.

ENDCLASS.
