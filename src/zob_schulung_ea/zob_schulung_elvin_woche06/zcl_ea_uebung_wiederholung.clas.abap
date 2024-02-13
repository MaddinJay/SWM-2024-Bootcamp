CLASS zcl_ea_uebung_wiederholung DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS Land  IMPORTING iv_code TYPE scustom-country.
  PROTECTED SECTION.


  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_ea_uebung_wiederholung IMPLEMENTATION.
  METHOD land.

  IF iv_code IS INITIAL.
SELECT
FROM
scustom
FIELDS
name,
street,
city,
country
ORDER BY country, city, street ASCENDING
INTO TABLE @DATA(lt_scustom).

"Ausgabe nur nach Landescode:
ELSE.
SELECT
FROM
scustom
FIELDS
name,
street,
city,
country
WHERE country = @iv_code
ORDER BY country, city, street ASCENDING
INTO TABLE @lt_scustom.
ENDIF.

LOOP AT lt_scustom INTO DATA(ls_struktur).

WRITE: / |Der Kunde { ls_struktur-name } wohnt in { ls_struktur-street } { ls_struktur-city } { ls_struktur-country } |.
ENDLOOP.


  ENDMETHOD.

ENDCLASS.
