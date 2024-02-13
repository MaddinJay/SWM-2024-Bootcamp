CLASS zcl_hum_uebung08012024 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lt_custom TYPE TABLE OF scustom,
          ls_custom TYPE scustom,
          BEGIN OF ls_flugbuchungen,
            kundennummer   TYPE scustom-id,
            Kundenname     TYPE scustom-name,
            Buchungsnummer TYPE sbook-bookid,
            Flugkosten     TYPE sbook-forcuram,
            Waehrung       TYPE sbook-loccurkey,
          END OF ls_flugbuchungen,
          lt_flugbuchungen LIKE TABLE OF ls_flugbuchungen.


    METHODS auslesen_Kunden IMPORTING iv_land TYPE scustom-country.
    METHODS display_kunden.
    METHODS Flugbuchungen_und_Kosten IMPORTING iv_land TYPE scustom-country.
    METHODS display_Flugbuchungen.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hum_uebung08012024 IMPLEMENTATION.
  METHOD auslesen_kunden.
    IF iv_land IS INITIAL.
      SELECT *
      FROM
      scustom
      INTO TABLE @lt_custom
      ORDER BY country, city, street.
    ELSE.
      SELECT *
     FROM
     scustom
     INTO TABLE @lt_custom
     WHERE country = @iv_land
     ORDER BY country, city, street.

    ENDIF.
  ENDMETHOD.

  METHOD display_kunden.
    cl_demo_output=>display( lt_custom ).
  ENDMETHOD.

  METHOD flugbuchungen_und_kosten.
    IF iv_land IS INITIAL.
      SELECT FROM scustom AS customer
      LEFT JOIN sbook AS booking
      ON customer~id = booking~customid
      FIELDS
      customer~id AS Kundennummer,
      customer~name AS Kundenname,
      booking~bookid AS Buchungsnummer,
      booking~forcuram AS Flugkosten,
      booking~forcurkey AS Waehrung
      INTO TABLE @lt_flugbuchungen.
    ELSE.
      SELECT FROM scustom AS customer
      LEFT JOIN sbook AS booking
      ON customer~id = booking~customid
      FIELDS
      customer~id AS Kundennummer,
      customer~name AS Kundenname,
      booking~bookid AS Buchungsnummer,
      booking~forcuram AS Flugkosten,
      booking~forcurkey AS Waehrung

      WHERE country = @iv_land
      INTO TABLE @lt_flugbuchungen.
    ENDIF.

  ENDMETHOD.

  METHOD display_flugbuchungen.
    cl_demo_output=>display( lt_flugbuchungen ).
  ENDMETHOD.

ENDCLASS.
