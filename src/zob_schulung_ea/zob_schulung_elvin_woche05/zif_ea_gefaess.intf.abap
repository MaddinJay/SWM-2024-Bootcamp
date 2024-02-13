INTERFACE zif_ea_gefaess
  PUBLIC .

  METHODS fuellen IMPORTING iv_fuellen TYPE i.

  METHODS leeren IMPORTING  iv_leeren  TYPE i.

  METHODS get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE i.


ENDINTERFACE.
