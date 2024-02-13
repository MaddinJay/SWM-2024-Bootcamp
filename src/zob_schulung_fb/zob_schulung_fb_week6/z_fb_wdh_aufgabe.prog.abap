*&---------------------------------------------------------------------*
*& Report z_fb_wdh_aufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_wdh_aufgabe.

*** Wiederholung Praxis
*** Erstellt einen Report, der über ein Selektionsbild Daten aus einer Kundentabelle (SCUSTOM) abfragt.
*** Im Selektionsbild kann der Benutzer einen Landescode eingeben, um Kunden aus einem bestimmten Land zu selektieren.
***
*** Wenn ein Land eingegeben wurde, sollen nur die Kunden dieses Landes angezeigt werden, andernfalls sollen alle Kunden ausgegeben werden.
***
*** Die Kunden sollen sortiert ausgegeben werden (nach Land, Stadt und Straße).
***
*** Zusatz 1:
*** Gebt die Informationen nicht als Tabelle sondern als Sätze aus.

*DATA: ls_cust TYPE TABLE OF SCUSTOM.

*SELECT
*FROM SCUSTOM FIELDS *
*INTO TABLE @DATA(lt_cust).

*TABLES: scustom.
*
*TYPES ls_cust TYPE TABLE OF scustom.
*
**DATA: lt_cust TYPE TABLE OF scustom.
*
*SELECTION-SCREEN BEGIN OF BLOCK Flugkunden_Land WITH FRAME TITLE TEXT-002.
*  PARAMETERS p_land TYPE scustom-country.                                         "suche nach dem Ländercode
*SELECTION-SCREEN END OF BLOCK Flugkunden_Land.
*
**SELECT
**FROM SCUSTOM FIELDS *
**WHERE country = @p_land
**ORDER BY country, city, street
**INTO TABLE @DATA(lt_cust).
*
**cl_demo_output=>display( lt_cust ).
*
** Zusatz 1:
** Gebt die Informationen nicht als Tabelle sondern als Sätze aus.
*
*SELECT
*FROM SCUSTOM FIELDS *
*WHERE country = @p_land
*ORDER BY country, city, street
*INTO TABLE @DATA(lt_cust).
*WRITE: scustom-id, scustom-name, scustom-street, scustom-postcode, scustom-city, scustom-country.

*LÖSUNG DENISE:
PARAMETERS p_cntry TYPE c LENGTH 3.

DATA ls_scustom TYPE scustom.

  SELECT
  FROM scustom
  FIELDS *
  WHERE country = @p_cntry
  ORDER BY country, city, street DESCENDING
  INTO TABLE @DATA(lt_scustom).

READ TABLE lt_scustom INTO ls_scustom INDEX 1.

LOOP AT lt_scustom INTO ls_scustom.
  IF sy-subrc = 0.
    WRITE ls_scustom.
  ENDIF.
ENDLOOP.
