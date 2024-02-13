*&---------------------------------------------------------------------*
*& Report z_fb_wdh_aufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_wdh_aufgabe_z3.

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

PARAMETERS p_cntry TYPE c LENGTH 3.

TABLES: scustom, sbook.
*START-OF-SELECTION.
*TYPES: BEGIN OF ls_custom,

*lv_custid  TYPE id,
*
*         lv_name    TYPE scustom-id,
*         lv_street  TYPE scustom,
*         lv_city    TYPE city,
*         lv_country TYPE country,
*         lv_connid  TYPE connid,
*         lv_carrid  TYPE sbook~carrid,
*         lv_lfdate  TYPE sbook~fldate,
*         lv_bookid  TYPE sbook~bookid,
*         lv_forc    TYPE sbook~forcuram,
*         lv_locc    TYPE sbook~loccuram,
*       END OF ls_custom.

  SELECT
  FROM scustom
  RIGHT JOIN sbook
  ON scustom~id = sbook~customid
  FIELDS
  scustom~id,
  scustom~name,
  scustom~street,
  scustom~city,
  scustom~country,
  sbook~connid,
  sbook~carrid,
  sbook~fldate,
  sbook~bookid,
  sbook~FORCURAM,
  sbook~LOCCURAM
  WHERE country = @p_cntry
  ORDER BY country, city, street DESCENDING
  INTO TABLE @DATA(lt_scustom).

READ TABLE lt_scustom INTO DATA(ls_scustom) INDEX 1.

LOOP AT lt_scustom INTO ls_scustom.
  IF sy-subrc = 0.

  ENDIF.
ENDLOOP.

****** AUSGABE nur möglich durch WRITE Befehl oder DEMO_OUTPUT_BEFEHL *****

*    WRITE: / ls_scustom-country,
*    ls_scustom-bookid,
*    ls_scustom-fldate,
*    ls_scustom-forcuram,
*    ls_scustom-loccuram,
*    /.

cl_demo_output=>display( lt_scustom ).
