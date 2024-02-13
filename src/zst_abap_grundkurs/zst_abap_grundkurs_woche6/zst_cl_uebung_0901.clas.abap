CLASS zst_cl_uebung_0901 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: ausgabe_verkaufsbelege IMPORTING iv_datum TYPE vbak-audat.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst_cl_uebung_0901 IMPLEMENTATION.
  METHOD ausgabe_verkaufsbelege.
    SELECT
    FROM vbak AS verkaufsbeleg_kopfdaten
    LEFT JOIN vbap AS verkaufsbeleg_posdaten
    ON verkaufsbeleg_kopfdaten~vbeln = verkaufsbeleg_posdaten~vbeln
    LEFT JOIN kna1 AS kundenstamm
    ON verkaufsbeleg_kopfdaten~kunnr = kundenstamm~kunnr
    LEFT JOIN makt AS material
    ON verkaufsbeleg_posdaten~matnr = material~matnr

    FIELDS
    kundenstamm~kunnr AS kundennummer,
    kundenstamm~name1 AS kundenname,
    kundenstamm~name2 AS kundenname2,
    verkaufsbeleg_kopfdaten~vbeln AS verkaufsbeleg,
    verkaufsbeleg_posdaten~pstyv AS position,
    material~matnr AS materialnummer,
    material~maktx AS materialtext,
    verkaufsbeleg_kopfdaten~netwr AS nettobetrag,
    verkaufsbeleg_kopfdaten~waerk AS waehrung
    WHERE  verkaufsbeleg_kopfdaten~audat = @iv_datum AND material~spras = 'E'

    INTO TABLE @DATA(lt_verkaufsbelege).
    cl_demo_output=>display( lt_verkaufsbelege ).


  ENDMETHOD.

ENDCLASS.
