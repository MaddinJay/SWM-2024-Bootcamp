*&---------------------------------------------------------------------*
*& Include zfd_cl_fahrzeug
*&---------------------------------------------------------------------*

CLASS lcl_fahrzeug DEFINITION.

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_hersteller TYPE string
                            iv_modell     TYPE string,
      set_daten IMPORTING iv_hersteller TYPE string
                          iv_modell     TYPE string
                          iv_baujahr    TYPE n,
      display_details.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_hersteller TYPE string.
    DATA mv_modell TYPE string.
    DATA mv_baujahr(4) TYPE n.
    DATA mv_aktuelles_jahr TYPE n LENGTH 4.

    METHODS:
      get_alter RETURNING VALUE(rv_jahr) TYPE i.

ENDCLASS.

CLASS lcl_fahrzeug IMPLEMENTATION.

  METHOD get_alter.
    mv_aktuelles_jahr = sy-datum.
    rv_jahr =  mv_aktuelles_jahr - mv_baujahr.
  ENDMETHOD.

  METHOD set_daten.
    mv_hersteller = iv_hersteller.
    mv_modell = iv_modell.
    mv_baujahr = iv_baujahr.

  ENDMETHOD.

  METHOD display_details.
    WRITE / |Hersteller: { mv_hersteller }|.
    WRITE / |Modell: { mv_modell }|.
    WRITE / |Baujahr: { mv_baujahr }|.
    WRITE / |Alter |.


  ENDMETHOD.

  METHOD constructor.
    mv_hersteller = iv_hersteller.
    mv_modell = iv_modell.

      endmethod.

ENDCLASS.
