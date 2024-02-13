INTERFACE zob_od_yif_gefaess
  PUBLIC .

  METHODS fuellen IMPORTING iv_menge TYPE int1.
  METHODS leeren  IMPORTING iv_menge TYPE int1.
  METHODS get_fuellmenge RETURNING VALUE(rv_menge) TYPE int1.


ENDINTERFACE.
