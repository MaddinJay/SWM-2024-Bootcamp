CLASS zuh_wh_praxis DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS abruf IMPORTING iv_land TYPE scustom-country.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zuh_wh_praxis IMPLEMENTATION.

  METHOD abruf.

    IF iv_land IS INITIAL.
      SELECT FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~name AS Name,
      scustom~city AS Stadt,
      scustom~street AS Strasse,
      scustom~country AS Land,
      sbook~bookid AS Buchungsnummer,
      sbook~loccuram AS Kosten
      ORDER BY country, city, street
      INTO TABLE @DATA(lt_kunden).
    ELSE.
      SELECT FROM scustom
       LEFT JOIN sbook ON scustom~id = sbook~customid
       FIELDS
      scustom~name AS Name,
      scustom~city AS Stadt,
      scustom~street AS Strasse,
      scustom~country AS Land,
      sbook~bookid AS Buchungsnummer,
      sbook~loccuram AS Kosten
       WHERE country = @iv_land
       ORDER BY country, city, street
       INTO TABLE @lt_kunden.
    ENDIF.

    LOOP AT lt_kunden INTO DATA(ls_kunden).
      WRITE: / |Der Kunde { ls_kunden-name }|.
      WRITE: / |aus dem Land { ls_kunden-land } aus der Stadt { ls_kunden-stadt } und aus der Strasse { ls_kunden-strasse }|.
      WRITE: / |mit der Buchungsnummer { ls_kunden-buchungsnummer } hat folgende Kosten { ls_kunden-kosten } Euro.|.
      ULINE.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

