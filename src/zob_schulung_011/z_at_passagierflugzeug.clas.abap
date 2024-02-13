CLASS z_at_passagierflugzeug DEFINITION INHERITING FROM z_at_flugzeug
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: passagierAnzahl TYPE i,
          tv              TYPE bool,
          passagierArt    TYPE string.

    METHODS: passagiereTransportieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_at_passagierflugzeug IMPLEMENTATION.
  METHOD passagieretransportieren.

  ENDMETHOD.

ENDCLASS.
