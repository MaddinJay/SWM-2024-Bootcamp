INTERFACE ztw_gefaess
  PUBLIC .

     METHODS leeren IMPORTING iv_menge TYPE i.
     METHODS fuellen IMPORTING iv_menge TYPE i.
     METHODS getFuellmenge RETURNING VALUE(rv_menge) TYPE i.




ENDINTERFACE.
