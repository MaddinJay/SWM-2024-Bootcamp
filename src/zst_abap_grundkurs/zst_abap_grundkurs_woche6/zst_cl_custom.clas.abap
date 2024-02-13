CLASS zst_cl_custom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: get_flugdaten IMPORTING iv_land TYPE scustom-country.
    METHODS ausgabe.


  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zst_cl_custom IMPLEMENTATION.
  METHOD get_flugdaten.
    IF iv_land IS INITIAL.
      SELECT
      FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~id AS kundennummer,
      scustom~form AS anrede,
      scustom~name AS kundenname,
      sbook~fldate AS flugdatum,
      sbook~forcuram AS kosten,
      sbook~forcurkey AS waehrung,
      scustom~street AS strasse,
      scustom~city AS stadt,
      scustom~country AS land
      ORDER BY country, city, street
      INTO TABLE @DATA(lt_land).
    ELSE.
      SELECT
      FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~id AS kundennummer,
      scustom~form AS anrede,
      scustom~name AS kundenname,
      sbook~fldate AS flugdatum,
      sbook~forcuram AS kosten,
      sbook~forcurkey AS waehrung,
      scustom~street AS strasse,
      scustom~city AS stadt,
      scustom~country AS land
      WHERE country = @iv_land
      ORDER BY country, city, street
      INTO TABLE @lt_land.
    ENDIF.

    LOOP AT lt_land INTO DATA(ls_land).
      WRITE: / |Der Kunde { ls_land-kundenname } wohnt in { ls_land-strasse } { ls_land-stadt } { ls_land-land }.|,
             / |Die Kundennummer lautet { ls_land-kundennummer } und kostet { ls_land-kosten } Euro.|, /.
    ENDLOOP.

  ENDMETHOD.

  METHOD ausgabe.

  ENDMETHOD.

ENDCLASS.
