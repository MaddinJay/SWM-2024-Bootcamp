CLASS zst_schulung_passagier DEFINITION INHERITING FROM zst_schulung_flugzeuge
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA:
      seatb  TYPE i,
      seatf  TYPE i,
      seatbb TYPE i,
      seatbf TYPE i,
      seatfb TYPE i,
      seatff TYPE i.

      METHODS: boarding, catering, sicherheit, gabgabe, gausgabe, dutyfree.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: seatfg TYPE i,
          seatbg TYPE i,
          seatg  TYPE i.

ENDCLASS.



CLASS zst_schulung_passagier IMPLEMENTATION.
  METHOD boarding.

  ENDMETHOD.

  METHOD catering.

  ENDMETHOD.

  METHOD dutyfree.

  ENDMETHOD.

  METHOD gabgabe.

  ENDMETHOD.

  METHOD gausgabe.

  ENDMETHOD.

  METHOD sicherheit.

  ENDMETHOD.

ENDCLASS.
