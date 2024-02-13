*&---------------------------------------------------------------------*
*& Report zea_uebung_wiederholung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_uebung_wiederholung.

TABLES scustom.

PARAMETERS p_land TYPE scustom-country OBLIGATORY.

**********************************************************************
IF p_land IS INITIAL.
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
WHERE country = @p_land
ORDER BY country, city, street ASCENDING
INTO TABLE @lt_scustom.
ENDIF.

LOOP AT lt_scustom INTO DATA(ls_struktur).

WRITE: / |Der Kunde { ls_struktur-name } wohnt in { ls_struktur-street } { ls_struktur-city } { ls_struktur-country } |.
ENDLOOP.
