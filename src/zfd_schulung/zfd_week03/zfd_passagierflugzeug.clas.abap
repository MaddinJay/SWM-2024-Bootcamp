CLASS zfd_passagierflugzeug DEFINITION INHERITING FROM zfd_flugzeuge
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: max_passagiere      TYPE i,
          entertainment       TYPE string,
          anzahl_Stewardessen type i.

    METHODS:
      sicherheitseinweisung,
      Essensausgabe.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfd_passagierflugzeug IMPLEMENTATION.
  METHOD essensausgabe.

  ENDMETHOD.

  METHOD sicherheitseinweisung.

  ENDMETHOD.

ENDCLASS.
