CLASS zfd_fluggesellschaften DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: name         TYPE String,
          kundennummer TYPE i,
          preis        TYPE i.

    METHODS:
       buchungen_verwalten,
       rechnungenverwalten.
      protected SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfd_fluggesellschaften IMPLEMENTATION.
  METHOD buchungen_verwalten.

  ENDMETHOD.

  METHOD rechnungenverwalten.

  ENDMETHOD.

ENDCLASS.
