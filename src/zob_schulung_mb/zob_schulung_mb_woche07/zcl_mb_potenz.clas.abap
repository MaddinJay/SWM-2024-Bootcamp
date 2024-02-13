CLASS zcl_mb_potenz DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.


  methods potenz importing iv_zahl type i
                           iv_zahl2 type i
                  returning value(rv_erg) type i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_mb_potenz IMPLEMENTATION.
  METHOD potenz.

  rv_erg = iv_zahl ** iv_zahl2.


  ENDMETHOD.

ENDCLASS.
