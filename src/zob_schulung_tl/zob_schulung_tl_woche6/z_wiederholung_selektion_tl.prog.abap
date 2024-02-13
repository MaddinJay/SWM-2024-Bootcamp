*&---------------------------------------------------------------------*
*& Report z_wiederholung_selektion_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_wiederholung_selektion_tl.
*TABLES scustom.

SELECTION-SCREEN BEGIN OF BLOCK ausgabe WITH FRAME TITLE TEXT-001. "Geben Sie den Landescode ein
  PARAMETERS p_eing TYPE scustom-country. "Eingabe Landescode
SELECTION-SCREEN END OF BLOCK ausgabe.

" AUFGABE 1 Nur nach Landescode als Tabelle ausgeben
*SELECT
*FROM
*scustom
*FIELDS
*name AS Kunde,
*street AS Strasse,
*city AS Stadt,
*country AS Land
*WHERE country = @p_eing
*ORDER BY country, city, street ASCENDING
*INTO TABLE @DATA(lt_scustom).
*cl_demo_output=>display( lt_scustom ).

"ZUSATZ 1: Die Information als Struktur ausgeben:
"Ausgabe der ganzen Tabelle falls nicht eingegeben wird
IF p_eing IS INITIAL.
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
WHERE country = @p_eing
ORDER BY country, city, street ASCENDING
INTO TABLE @lt_scustom.
ENDIF.

*cl_demo_output=>display( lt_scustom ).
LOOP AT lt_scustom INTO DATA(ls_scustom).
WRITE: |Der Kunde { ls_scustom-name } wohnt in { ls_scustom-city } { ls_scustom-country } { ls_scustom-street }|.
ENDLOOP.
