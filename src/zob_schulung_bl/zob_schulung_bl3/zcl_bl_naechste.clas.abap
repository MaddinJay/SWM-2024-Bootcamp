CLASS zcl_bl_naechste DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS fuellen IMPORTING iv_menge TYPE int1.
    METHODS leeren IMPORTING iv_menge TYPE int1.
    METHODS get_menge RETURNING VALUE(rv_menge) type int1.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_menge TYPE int1.

ENDCLASS.



CLASS zcl_bl_naechste IMPLEMENTATION.


  METHOD fuellen.

  ENDMETHOD.

  METHOD leeren.

  ENDMETHOD.





  METHOD get_menge.

  ENDMETHOD.

ENDCLASS.
