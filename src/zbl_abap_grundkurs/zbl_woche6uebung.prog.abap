*&---------------------------------------------------------------------*
*& Report zbl_woche6uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_woche6uebung.

*Erstellt einen Report, der über ein Selektionsbild Daten aus einer Kundentabelle (scustom) abfragt.
*Im Selektionsbild kann der Benutzer einen Landescode eingeben, um Kunden aus einem bestimmten Land zu selektieren.


*Wenn ein Land eingegeben wurde, sollen nur die Kunden dieses Landes angezeigt werden, andernfalls sollen alle Kunden ausgegeben werden.


*Die Kunden sollen sortiert ausgegeben werden (nach Land, Stadt und Straße).


*Zusatz 1:
*Gebt die Informationen nicht als Tabelle sondern als Sätze aus.
*Zustaz 2:
*Setzt die Lösung mithilfe einer Klasse um.
*Zustaz 3:
*Gebt zusätzlich die gebuchten Flüge der Kunden so wie die Kosten dieser Flüge aus.

TABLES: scustom.
PARAMETERS: p_contry TYPE scustom-country.

START-OF-SELECTION.
  DATA: lt_scustom TYPE TABLE OF scustom.

  IF p_contry IS NOT INITIAL.
  SELECT *
  FROM scustom
  INTO TABLE @lt_scustom
  WHERE country = @p_contry
  ORDER BY country, city, street.
  ELSE.
  SELECT *
  FROM scustom
  INTO TABLE @lt_scustom
  ORDER BY country, city, street.
  ENDIF.
  LOOP AT lt_scustom INTO scustom.
  WRITE: / scustom-country, scustom-city, scustom-street.
  ENDLOOP.
