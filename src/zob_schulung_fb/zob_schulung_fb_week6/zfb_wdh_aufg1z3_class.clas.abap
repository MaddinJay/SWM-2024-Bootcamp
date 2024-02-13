CLASS zfb_wdh_aufg1z3_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_code TYPE scustom-country.

    TYPES: BEGIN OF ty_join,
             name     TYPE scustom-name,
             country  TYPE scustom-country,
             city     TYPE scustom-city,
             street   TYPE scustom-street,
             plz      TYPE scustom-postcode,
             customid TYPE sbook-customid,
             forcuram TYPE sbook-forcuram,
           END OF ty_join.
    DATA gt_join TYPE TABLE OF ty_join.

METHODS display.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zfb_wdh_aufg1z3_class IMPLEMENTATION.

  METHOD constructor.

    IF iv_code IS NOT INITIAL.
      SELECT
      FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~name,
      scustom~country,
      scustom~city,
      scustom~street,
      scustom~postcode AS plz,
      sbook~customid,
      sbook~forcuram
      WHERE country = @iv_code
      ORDER BY country, city, street ASCENDING
      INTO TABLE @gt_join.
    ELSE.
      SELECT
      FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~name,
      scustom~country,
      scustom~city,
      scustom~street,
      scustom~postcode AS plz,
      sbook~customid,
      sbook~forcuram
      ORDER BY country, city, street ASCENDING
      INTO TABLE @gt_join.
    ENDIF.

* mit der Flugnummer { ls_struktur-bookid } zahlt { ls_struktur-forcuram }
  ENDMETHOD.


  METHOD display.

    LOOP AT gt_join INTO DATA(ls_struktur).
      WRITE: / |Der Kunde { ls_struktur-name } wohnt in { ls_struktur-street } { ls_struktur-city } { ls_struktur-country }.|,
             / |Die Kundennummer lautet { ls_struktur-customid } und kostet { ls_struktur-forcuram } Euro.|, /.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
