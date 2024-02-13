CLASS zuh_passagierflugzeug DEFINITION INHERITING FROM zuh_flugzeug
  PUBLIC

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA Sitzplaetze TYPE i.
    DATA Mittagsmenue TYPE string.

    METHODS passagierbegleitung.
    METHODS Sicherheitsanweisung.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zuh_passagierflugzeug IMPLEMENTATION.
  METHOD passagierbegleitung.

  ENDMETHOD.

  METHOD sicherheitsanweisung.

  ENDMETHOD.

ENDCLASS.
