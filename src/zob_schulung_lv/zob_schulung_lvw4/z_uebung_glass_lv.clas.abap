CLASS z_uebung_glass_lv DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS fuellen IMPORTING iv_menge TYPE int1.

    METHODS leeren IMPORTING iv_menge TYPE int1.

    METHODS getfuellmenge RETURNING VALUE(ev_getfuellmenge) TYPE int1.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mv_getraenk   TYPE string,
          mv_fuellmenge TYPE int1.

ENDCLASS.



CLASS z_uebung_glass_lv IMPLEMENTATION.
  METHOD fuellen.
    mv_fuellmenge = mv_fuellmenge + iv_menge.
  ENDMETHOD.

  METHOD getfuellmenge.
    ev_getfuellmenge = mv_fuellmenge.
    WRITE: ev_getfuellmenge.
  ENDMETHOD.

  METHOD leeren.
    mv_fuellmenge = mv_fuellmenge - iv_menge.
  ENDMETHOD.

ENDCLASS.
