CLASS zbv_praxis_klasse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_code TYPE scustom-country.




  PROTECTED SECTION.
  PRIVATE SECTION.

      TYPES: BEGIN OF ty_join,            "Tabelle muss global angelegt werden und im Select benutzt werden, damit sie in anderen Methoden auch benutzt werden kann.
             name     TYPE scustom-name,
             country  TYPE scustom-country,
             city     TYPE scustom-city,
             street   TYPE scustom-street,
             plz      TYPE scustom-postcode,
             customid TYPE sbook-customid,
             forcuram TYPE sbook-forcuram,
           END OF ty_join.
    DATA gt_join TYPE TABLE OF ty_join.
ENDCLASS.



CLASS zbv_praxis_klasse IMPLEMENTATION.

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
      INTO TABLE @gt_join. "Nutzung der globalen Tabelle, die oben bereits angelegt wurde.
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
    LOOP AT gt_join INTO DATA(ls_struktur).
      WRITE: / |Der Kunde { ls_struktur-name } wohnt in { ls_struktur-street } { ls_struktur-city } { ls_struktur-country }.|,
             / |Die Kundennummer lautet { ls_struktur-customid } und kostet { ls_struktur-forcuram } Euro.|, /.
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.
