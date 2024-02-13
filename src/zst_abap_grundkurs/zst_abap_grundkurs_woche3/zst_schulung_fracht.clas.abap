CLASS zst_schulung_fracht DEFINITION INHERITING FROM zst_schulung_flugzeuge
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  Data: Ladeflaeche Type i,
        laderaum Type c,
        typ type string.

        METHODS: papiere, beladen, loeschen.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst_schulung_fracht IMPLEMENTATION.
  METHOD beladen.

  ENDMETHOD.

  METHOD loeschen.

  ENDMETHOD.

  METHOD papiere.

  ENDMETHOD.

ENDCLASS.
