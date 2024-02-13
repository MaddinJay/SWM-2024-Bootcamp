*&---------------------------------------------------------------------*
*& Report z_fb_wdh_aufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_wdh_aufgabe_z3_class.

* Wiederholung Praxis
* Erstellt einen Report, der über ein Selektionsbild Daten aus einer Kundentabelle (SCUSTOM) abfragt.
* Im Selektionsbild kann der Benutzer einen Landescode eingeben, um Kunden aus einem bestimmten Land zu selektieren.
*
* Wenn ein Land eingegeben wurde, sollen nur die Kunden dieses Landes angezeigt werden, andernfalls sollen alle Kunden ausgegeben werden.
*
* Die Kunden sollen sortiert ausgegeben werden (nach Land, Stadt und Straße).
*
* Zustaz 3:
* Gebt zusätzlich die gebuchten Flüge der Kunden so wie die Kosten dieser Flüge aus.

TABLES: scustom.

SELECTION-SCREEN BEGIN OF BLOCK abc WITH FRAME TITLE TEXT-001.
  PARAMETERS p_code TYPE scustom-country.
SELECTION-SCREEN END OF BLOCK abc.

DATA go_praxis type ref to zfb_wdh_aufg1z3_class.

go_praxis = NEW #( iv_code = p_code ).

go_praxis->display( ).

*cl_demo_output=>display( lt_Tabelle ).

*cl_demo_output=>display( lt_Tabelle2 ).

*IF p_code IS not INITIAL.
*  SELECT
*  FROM scustom
*  FIELDS
*  name,
*  country,
*  city,
*  street,
*  postcode
*  WHERE country = @p_code
*  ORDER BY country, city, street ASCENDING
*  INTO TABLE @DATA(lt_tabelle).
**  cl_demo_output=>display( lt_Tabelle ).
*ELSEIF p_code IS INITIAL.
*  SELECT
*  FROM scustom
*  FIELDS
*  name,
*  country,
*  city,
*  street,
*  postcode
*  ORDER BY country, city, street ASCENDING
*  INTO TABLE @DATA(lt_tabelle2).
**  cl_demo_output=>display( lt_Tabelle2 ).
*ENDIF.
*
*LOOP AT lt_tabelle into DATA(ls_struktur).
*WRITE: / |Der Kunde { ls_struktur-name } wohnt in { ls_struktur-street } { ls_struktur-city } { ls_struktur-country }|.
*ENDLOOP.
