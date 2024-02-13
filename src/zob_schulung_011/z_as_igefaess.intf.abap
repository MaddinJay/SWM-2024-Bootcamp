INTERFACE z_as_igefaess
  PUBLIC .

  METHODS leeren IMPORTING iv_menge1 TYPE i.
  METHODS fuellen IMPORTING iv_menge2 TYPE i.
  METHODS getFuellmenge RETURNING VALUE(menge) TYPE i.


ENDINTERFACE.
