CLASS zcl_lv_glas1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS fuellen IMPORTING iv_menge TYPE int1.
    METHODS leeren IMPORTING iv_menge TYPE int1.
    METHODS get_name RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mv_menge TYPE int1.

ENDCLASS.



CLASS zcl_lv_glas1 IMPLEMENTATION.




  METHOD fuellen.

  ENDMETHOD.

  METHOD leeren.

  ENDMETHOD.









  METHOD get_name.

  ENDMETHOD.

ENDCLASS.