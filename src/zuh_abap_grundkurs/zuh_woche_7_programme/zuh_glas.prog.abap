*&---------------------------------------------------------------------*
*& Report zuh_glas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_glas.
SELECTION-SCREEN BEGIN OF BLOCK eingabe.
  PARAMETERS: p_menge TYPE int1,
              p_leer  TYPE int1,
              p_getr Type string.
SELECTION-SCREEN END OF BLOCK eingabe.

START-OF-SELECTION.
  DATA(lo_glas) = NEW zuh_glas( ).
  DATA go_gesamtmenge TYPE int1.

  CALL METHOD lo_glas->fuellen
    EXPORTING
      iv_menge = p_menge.

  CALL METHOD lo_glas->leeren
    EXPORTING
      iv_menge = p_leer.
  go_gesamtmenge = lo_glas->get_fuellmenge( ).
  WRITE: go_gesamtmenge.
