*&---------------------------------------------------------------------*
*& Report z_getraenk_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_getraenk_tl.

START-OF-SELECTION.

  DATA go_getraenk TYPE REF TO zcl_tl_glas.
  DATA gv_gesamtmenge TYPE i.

  go_getraenk = NEW #( ).

  go_getraenk->fuellen( EXPORTING iv_menge2 = 20 ).
  go_getraenk->leeren( EXPORTING iv_menge1 = 3 ).

  gv_gesamtmenge = go_getraenk->getfuellmenge( ).

  WRITE: / 'Gesamtmenge: ', gv_gesamtmenge.

END-OF-SELECTION.
