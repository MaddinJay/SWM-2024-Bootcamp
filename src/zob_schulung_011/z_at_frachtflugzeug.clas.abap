CLASS z_at_frachtflugzeug DEFINITION INHERITING FROM z_at_flugzeug
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: frachtraum  TYPE i,
          befestigung TYPE i.

    METHODS:
    befestigen,
    frachtTransportieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_at_frachtflugzeug IMPLEMENTATION.
  METHOD befestigen.

  ENDMETHOD.

  METHOD frachttransportieren.

  ENDMETHOD.

ENDCLASS.
