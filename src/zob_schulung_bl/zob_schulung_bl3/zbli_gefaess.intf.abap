INTERFACE zbli_gefaess
  PUBLIC .
   METHODS: Fuellen IMPORTING iv_fuellen TYPE string,
      Leeren IMPORTING iv_leeren TYPE string,
      get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE i.

      ENDINTERFACE.
