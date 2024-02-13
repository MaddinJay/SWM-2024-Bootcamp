CLASS zcl_hum_exerc_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS hello RETURNING VALUE(result) TYPE string. "Definition der Methode mit einem Returning Parameter.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_hum_exerc_hello_world IMPLEMENTATION.
  METHOD hello.                                         "Implementierung der Methode
    result = 'Hello, World!'.                           "Returning Parameter für Ausgabe.
  ENDMETHOD.
ENDCLASS.


