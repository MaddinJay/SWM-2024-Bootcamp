CLASS zem_frachtflug DEFINITION INHERITING FROM ZEM_FLUGZEUG
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  Data ladevolumen type i.
  Data frachtart type string.
  Data maxcargo type string.

  Methods:
  Frachtfixierung,
  OptTemperatur.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_frachtflug IMPLEMENTATION.


  METHOD frachtfixierung.

  ENDMETHOD.

  METHOD opttemperatur.

  ENDMETHOD.

ENDCLASS.
