CLASS ztw_apple_produkte DEFINITION
  PUBLIC
  CREATE PUBLIC.
  PUBLIC SECTION.

    CLASS-METHODS eintragen
      IMPORTING
        iv_marke   TYPE ztw_t_produkte-marke
        iv_produkt TYPE ztw_t_produkte-produkt
        iv_jahr    TYPE ztw_t_produkte-jahr
      EXPORTING
        ev_eintrag TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztw_apple_produkte IMPLEMENTATION.
  METHOD eintragen.

    DATA ls_product TYPE ztw_t_produkte.

    ls_product-marke = iv_marke.
    ls_product-produkt = iv_produkt.
    ls_product-jahr = iv_jahr.

    INSERT ztw_t_produkte FROM ls_product.

    ev_eintrag = ls_product.





  ENDMETHOD.

ENDCLASS.
