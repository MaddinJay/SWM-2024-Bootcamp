CLASS zalsu_sachbearbeiter DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: open_Selektionsbildschirm IMPORTING
                                         iv_nummer TYPE zalsu_db_ticket-beschreibung.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zalsu_sachbearbeiter IMPLEMENTATION.
  METHOD open_selektionsbildschirm.
    WRITE: iv_nummer.
  ENDMETHOD.

ENDCLASS.
