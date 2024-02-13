*&---------------------------------------------------------------------*
*& Report zaw_wiederholung_gesamt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_wiederholung_gesamt.


"Erstellt einen Report, der über ein Selektionsbild Daten aus einer Kundentabelle (SCUSTOM) abfragt. Im Selektionsbild kann der Benutzer einen Landescode
"eingeben, um Kunden aus einem bestimmten Land zu selektieren. Wenn ein Land eingegeben wurde, sollen nur die Kunden dieses Landes angezeigt werden,
"andernfalls sollen alle Kunden ausgegeben werden. Die Kunden sollen sortiert ausgegeben werden (nach Land, Stadt und Straße).

PARAMETERS p_laco(3) TYPE c.

*
*IF p_laco IS INITIAL.
*
*  SELECT
*  FROM scustom
*  FIELDS country, city, street
*  GROUP BY country, city, street
*  INTO TABLE @DATA(lt_land).
*
*ELSE.
*
*  SELECT
*  FROM scustom
*  FIELDS country, city, street
*  WHERE country = @p_laco
*  GROUP BY country, city, street
*  INTO TABLE @lt_land.
*
*ENDIF.

* cl_demo_output=>display( lt_land ).


"Gebt die Informationen nicht als Tabelle sondern als Sätze aus.

*DATA: lt_land1 TYPE TABLE OF scustom,
*      ls_land1 TYPE scustom.

*
*IF p_laco IS INITIAL.
*  SELECT * FROM scustom INTO TABLE @lt_land1.
*ELSE.
*  SELECT * FROM scustom INTO TABLE @lt_land1 WHERE country = @p_laco.
*ENDIF.
*
*LOOP AT  lt_land1  INTO ls_land1.
*  WRITE: / ls_land1-country, ls_land1-city, ls_land1-street.
*ENDLOOP.


"Gebt zusätzlich die gebuchten Flüge der Kunden sowie die Kosten dieser Flüge mit Hilfe einer Klasse aus.

DATA: lo_land TYPE REF TO zaw_klasse_wiederholung.

lo_land = NEW #( ).

lo_land->get_flugdaten( EXPORTING iv_land = p_laco ).
