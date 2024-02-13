CLASS zuh_frachtflugzeug DEFINITION
  PUBLIC
  INHERITING FROM zuh_flugzeug
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA Frachraum_zusatz TYPE string.
    DATA Ladungssicherung TYPE string.

    METHODS Frachbefoerderung.
    METHODS Warenabfertigung.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zuh_frachtflugzeug IMPLEMENTATION.


  METHOD warenabfertigung.

  ENDMETHOD.

  METHOD frachbefoerderung.

  ENDMETHOD.

ENDCLASS.
