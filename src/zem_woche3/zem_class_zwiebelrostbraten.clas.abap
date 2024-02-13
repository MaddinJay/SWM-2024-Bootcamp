CLASS zem_class_zwiebelrostbraten DEFINITION

PUBLIC.

**********************************************************************
* Methoden um den Nährwerte verschiedener Lebensmittel auszurechnen
*
* Statische Methoden mit Importvariable (Menge der Zutat)
**********************************************************************

  PUBLIC SECTION.

    CLASS-METHODS: rindfleisch                          "
      IMPORTING iv_anzahl_rind TYPE p.

    CLASS-METHODS: zwiebel
      IMPORTING iv_anzahl_zwiebel TYPE p.

    CLASS-METHODS: kartoffel
      IMPORTING iv_anzahl_kartoffel TYPE p.

    CLASS-METHODS: ergebnis.


**********************************************************************
*Definition privater, statische Attribute, für die Ausgabe der Ergebnisse
**********************************************************************

  PRIVATE SECTION.

    CLASS-DATA: lv_kh_zwiebel2   TYPE p DECIMALS 2,
                lv_p_zwiebel2    TYPE p DECIMALS 2,
                lv_kh_rind2      TYPE p DECIMALS 2,
                lv_p_rind2       TYPE p DECIMALS 2,
                lv_kh_kartoffel2 TYPE p DECIMALS 2,
                lv_p_kartoffel2  TYPE p DECIMALS 2,

                lv_kh_erg        TYPE p DECIMALS 2,
                lv_p_erg         TYPE p DECIMALS 2.


ENDCLASS.

CLASS zem_class_zwiebelrostbraten IMPLEMENTATION.

  METHOD rindfleisch.

**********************************************************************
    "Auslesen der Nährwerte für Rindfleisch aus DB (/100g)
**********************************************************************

    SELECT
    FROM zem_db_nw_zutat
    FIELDS protein
    WHERE zutat = 'RIND'
    INTO @DATA(lv_p_rind).
    ENDSELECT.

    SELECT
    FROM zem_db_nw_zutat
    FIELDS kohlenhydrate
    WHERE zutat = 'RIND'
    INTO @DATA(lv_kh_rind).
    ENDSELECT.


**********************************************************************
    " Berechnung der Nährwerte anhand einer Importvariable (Menge Rindfleisch in g)
    " und den Ausgelesenen Nährwerten / 100g = lv_p_rind und lv_kh_rind
**********************************************************************

    lv_kh_rind2 = ( iv_anzahl_rind / 100 ) * lv_kh_rind.
    lv_p_rind2 = ( iv_anzahl_rind / 100 ) * lv_p_rind.


    DATA(iv_p) = 'GRAMM'.


    WRITE: /, 'Kohlenhydrate Rind       :', lv_kh_rind2, iv_p, /,
              'Proteine Rind            :', lv_p_rind2, iv_p, /.
    ULINE.

  ENDMETHOD.

  METHOD zwiebel.

*********************************************************************
    "Auslesen der Nährwerte für Zwiebeln aus DB (/100g)
**********************************************************************


    SELECT                          "Proteine
    FROM zem_db_nw_zutat
    FIELDS protein
    WHERE zutat = 'ZWIEBEL'
    INTO @DATA(lv_p_zwiebel).
    ENDSELECT.

    SELECT                        "Kohlenhydrate
    FROM zem_db_nw_zutat
    FIELDS kohlenhydrate
    WHERE zutat = 'ZWIEBEL'
    INTO @DATA(lv_kh_zwiebel).
    ENDSELECT.


**********************************************************************
    " Berechnung der Nährwerte anhand einer Importvariable (Menge Zwiebeln in 80g/Stück)
    " und den Ausgelesenen Nährwerten / 100g = lv_p_zwiebel und lv_kh_zwiebel
**********************************************************************

    lv_kh_zwiebel2 = ( iv_anzahl_zwiebel * 80 ) * ( lv_kh_zwiebel / 100 ).
    lv_p_zwiebel2 = ( iv_anzahl_zwiebel  / 100 ) * lv_p_zwiebel.

    DATA(iv_p) = 'GRAMM'.

    WRITE: /, 'Kohlenhydrate Zwiebel     :', lv_kh_zwiebel2, iv_p, /,
              'Proteine Zwiebel          :', lv_p_zwiebel2, iv_p, /.

    ULINE.

  ENDMETHOD.


  METHOD kartoffel.

*********************************************************************
    "Auslesen der Nährwerte für Kartoffeln aus DB (/100g)
**********************************************************************


    SELECT
    FROM zem_db_nw_zutat
    FIELDS protein
    WHERE zutat = 'KARTOFFEL'
    INTO @DATA(lv_p_kartoffel).
    ENDSELECT.

    SELECT
    FROM zem_db_nw_zutat
    FIELDS kohlenhydrate
    WHERE zutat = 'KARTOFFEL'
    INTO @DATA(lv_kh_kartoffel).
    ENDSELECT.

**********************************************************************
    " Berechnung der Nährwerte anhand einer Importvariable (Kartoffeln in Stück/150g)
    "und den Ausgelesenen Nährwerten / 100g = lv_p_kartoffel und lv_kh_kartoffel
**********************************************************************

    lv_kh_kartoffel2 = ( iv_anzahl_kartoffel * '1.5' ) * lv_kh_kartoffel.
    lv_p_kartoffel2 = ( iv_anzahl_kartoffel * '1.5' ) * lv_p_kartoffel.

    DATA(iv_p) = 'GRAMM'.

    WRITE: /, 'Kohlenhydrate Kartoffel  :', lv_kh_kartoffel2, iv_p, /,
              'Proteine Kartoffel       :', lv_p_kartoffel2, iv_p, /.

    ULINE. ULINE.

  ENDMETHOD.

  METHOD ergebnis.

**********************************************************************
    " Berechnung des Gesamtergebnisses aus allen Zutaten - Proteine und Kohlenhydrate
**********************************************************************

    lv_p_erg = lv_p_rind2 + lv_p_zwiebel2 + lv_p_kartoffel2.       "Ergebnis Protein
    lv_kh_erg = lv_kh_rind2 + lv_kh_zwiebel2 + lv_p_kartoffel2.    "Ergebnis Kohlenhydrate

    DATA(iv_p) = 'GRAMM'.

    WRITE: /, 'Kohlenhydtrate Gesamt    :', lv_kh_erg, iv_p, /,
              'Proteine Gesamt          :', lv_p_erg, iv_p, /.

    ULINE.

  ENDMETHOD.


ENDCLASS.






