INTERFACE zuh_gefaess
  PUBLIC .

  METHODS fuellen IMPORTING iv_menge TYPE int1.
  METHODS leeren IMPORTING iv_menge TYPE int1.
  METHODS get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE int1.

ENDINTERFACE.
