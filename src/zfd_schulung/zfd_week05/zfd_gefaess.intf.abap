INTERFACE zfd_gefaess
  PUBLIC .
  METHODS:
    glas_fuellen IMPORTING  iv_menge1 TYPE int1,
    glas_leeren IMPORTING iv_menge2 TYPE int1,
    get_fuellmenge RETURNING VALUE(rv_menge) TYPE i,
    get_name returning Value(rv_name) type string.

ENDINTERFACE.
