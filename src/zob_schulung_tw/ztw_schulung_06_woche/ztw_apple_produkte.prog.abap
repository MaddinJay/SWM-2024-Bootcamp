*&---------------------------------------------------------------------*
*& Report ztw_apple_produkte
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_apple_produkte.

DATA aufrufen TYPE REF TO ztw_apple_produkte.

PARAMETERS: p_marke TYPE ztw_t_produkte-marke,
            p_produ TYPE ztw_t_produkte-produkt,
            p_jahr  TYPE ztw_t_produkte-jahr.

ztw_apple_produkte=>eintragen(

iv_marke = p_marke
iv_produkt = p_produ
iv_jahr = p_jahr ).

IF sy-subrc = 0.
  MESSAGE 'hat geklappt' TYPE 'I'.
ENDIF.
