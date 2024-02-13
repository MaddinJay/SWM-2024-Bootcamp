CLASS z_2wiederholung_selektion_tl DEFINITION
  PUBLIC
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_eing TYPE scustom-country.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_2wiederholung_selektion_tl IMPLEMENTATION.
  METHOD constructor.

    IF iv_eing IS INITIAL.
      SELECT
      FROM
      scustom
      LEFT OUTER JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~name,
      scustom~street,
      scustom~city,
      scustom~country,
      sbook~forcuram,
      sbook~forcurkey,
      sbook~fldate AS Flugdatum,
      sbook~carrid AS Fluggesellschaft,
      sbook~bookid AS Buchungsnummer
      ORDER BY country, city, street ASCENDING
      INTO TABLE @DATA(lt_scustom).

      "Ausgabe nur nach Landescode:
    ELSE.
      SELECT
      FROM
      scustom
      LEFT OUTER JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~name,
      scustom~street,
      scustom~city,
      scustom~country,
      sbook~forcuram AS Kosten,
      sbook~forcurkey AS Waehrung,
      sbook~fldate AS Flugdatum,
      sbook~carrid AS Fluggesellschaft,
      sbook~bookid AS Buchungsnummer

      WHERE scustom~country = @iv_eing
      ORDER BY country, city, street ASCENDING
      INTO TABLE @lt_scustom.
    ENDIF.

    LOOP AT lt_scustom INTO DATA(ls_scustom).
      WRITE: / |Der Kunde { ls_scustom-name } wohnt in { ls_scustom-city } { ls_scustom-country } { ls_scustom-street }|, /,
              |Buchungsnummer: { ls_scustom-buchungsnummer } Flugdatum: { ls_scustom-flugdatum } Fluggesellschaft: { ls_scustom-fluggesellschaft }|, /,
              |Kosten für die Flüge: { ls_scustom-forcuram } in { ls_scustom-forcurkey }|, /.
             ULINE.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
