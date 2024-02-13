INTERFACE zem_interface_getraenk
  PUBLIC .


  METHODS fuellen IMPORTING iv_fuellen TYPE int1.

  METHODS leeren IMPORTING iv_leeren TYPE int1.

  METHODS get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE int1.

ENDINTERFACE.
