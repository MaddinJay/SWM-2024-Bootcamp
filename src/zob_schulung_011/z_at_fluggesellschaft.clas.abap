CLASS z_at_fluggesellschaft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: fluggesellschaftid TYPE i,
          sitzplaetze        TYPE i,
          piloten            TYPE string,
          stewardess         TYPE string,
          mitarbeiterAnzahl  TYPE i,
          ticketPreis        TYPE p DECIMALS 2,
          versorgung         TYPE string.

    METHODS:
      ankunftszeitPlanen,
      abflugszeitPlanen,
      ankunftsortPlanen,
      abflugsortPlanen,
      mitarbeiterPlanen.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_at_fluggesellschaft IMPLEMENTATION.
  METHOD abflugsortplanen.

  ENDMETHOD.

  METHOD abflugszeitplanen.

  ENDMETHOD.

  METHOD ankunftsortplanen.

  ENDMETHOD.

  METHOD ankunftszeitplanen.

  ENDMETHOD.

  METHOD mitarbeiterplanen.

  ENDMETHOD.

ENDCLASS.
