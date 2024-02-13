CLASS zem_class_tarif DEFINITION
  PUBLIC
   CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: Tarif RETURNING VALUE(rv_tarif) TYPE zem_dt_centkwh.

    METHODS construtor importing iv_handelspreis type zem_dt_centkwh.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA lo_fixpreis TYPE REF TO zem_class_preisfix.      "Datendeklaration für Methodenaufruf fixerteil
    DATA mv_fixpreis TYPE zem_dt_centkwh.                 "Datendeklaration für die Aufnahme des returning aus klasse Preisfix

    DATA lo_allg TYPE REF TO zem_class_preis_vert.        "Datendeklaration für Methodenaufruf ....
    DATA mv_diridari TYPE zem_dt_centkwh.                   "Deklaration für Export Parameters aus handelsteil
    DATA mv_vertrieb TYPE zem_dt_centkwh.                 "  " ..................................Vertriebsteil.

ENDCLASS.



CLASS zem_class_tarif IMPLEMENTATION.

  METHOD tarif.

**********************************************************************
* Aufruf des Returning Parameters (fixe Preise) aus Klasse zem_class_preisfix
**********************************************************************
lo_fixpreis = NEW #(  ).

    mv_fixpreis = lo_fixpreis->fixerteil( ).

**********************************************************************
* Aufruf der Exportparameters ( Vertriebs-teil) aus der Klasse zem_class_preis_vert
**********************************************************************
Data lo_allg type ref to zem_class_preis_vert.


lo_allg = NEW #(  ).

lo_allg->vertrieb( IMPORTING ev_vertrieb = mv_vertrieb
                             ev_diridari = mv_diridari ).


    rv_tarif =  mv_vertrieb + mv_fixpreis + mv_diridari.    "Tarif ohne Handelspreis (Nur FIX und Vertrieb)

    Write: |Gestzlicher, verbrauchsabhängiger Bestandteil im Tarif: { mv_fixpreis } Cent/kWh.|.
    Uline.


  ENDMETHOD.


  METHOD construtor.

mv_diridari = iv_handelspreis.

  ENDMETHOD.

ENDCLASS.
