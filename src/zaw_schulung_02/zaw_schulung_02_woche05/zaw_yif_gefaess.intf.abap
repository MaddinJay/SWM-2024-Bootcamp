INTERFACE zaw_yif_gefaess
  PUBLIC .

  METHODS:
      fuellen IMPORTING iv_fuellmenge TYPE int1,
      leeren IMPORTING iv_leermenge TYPE int1,
      get_fuellmenge RETURNING VALUE(rv_menge) TYPE int1.

ENDINTERFACE.
