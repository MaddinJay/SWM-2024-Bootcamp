INTERFACE zif_mb_gefaess
  PUBLIC .

   METHODS fuellen IMPORTING iv_fuellen TYPE i.


    METHODS leeren IMPORTING iv_leeren TYPE i.

    METHODS getfuellmenge RETURNING VALUE(rv_fuellmenge) TYPE i.


ENDINTERFACE.
