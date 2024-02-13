*&---------------------------------------------------------------------*
*& Report ztw_uebung_open_sql_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_uebung_open_sql_1.

*DATA lt_sbook TYPE TABLe of sbook.
*
*DATA: BEGIN OF sbook,
*      agencynum TYPE sbook-agencynum,
*      #bookid TYPE sbook-bookid,
*      passname TYPE sbook-passname,
*      test TYPE string,
*      END OF ls_sbook,
*      lt_sbook_extra LIKE TABLE OF ls_sbook. <--- Alte Schreibeweise, wird durch INTO TABLE0 @DATA(lt_sbook) ersetzt.



*"Nach FIELDS kann Strg + Leerzeichen gedrückt werden, um alle Werte sehen zu können
*SELECT
* FROM
* sbook
* FIELDS *
* WHERE passname = 'Christa Delon'
* INTO TABLE @DATA(lt_sbook). "Die Tabelle für 'Christa Delon' ausgeben = SELECT FROM TABLE 'sbook'.
**cl_demo_output=>display( lt_sbook ).

*SELECT SINGLE
* FROM
* sbook
* FIELDS
* agencynum,
* bookid
*  WHERE passname = 'Christa Delon'
*  Into  @DATA(lt_sbook). "Die ersten Zeile ausgeben = SELECT SINGLE und ohne TABLE, das es keine Tabelle sondern Struktur ist
*cl_demo_output=>display( lt_sbook ).



"Alle Flüge -> Entfernung über '5000'.

*SELECT
* FROM
* spfli
* FIELDS *
* WHERE distance > 5000
* INTO TABLE @DATA(lt_fly).
*cl_demo_output=>display( lt_fly ).


*"Alle Flüge -> von Frankfurt abfliegen
*SELECT
* FROM
* spfli
* FIELDS * "* steht für ALLES -> durchsucht alle und keine bestimmten
* WHERE cityfrom = 'FRANKFURT'
*  INTO TABLE @DATA(lt_fly).
*cl_demo_output=>display( lt_fly ).


SELECT
 FROM
 scustom
 FIELDS *
 WHERE name LIKE 'S%'
 INTO TABLE @DATA(lt_custom).
cl_demo_output=>display( lt_custom ).

*SELECT
* FROM
* Scarr
* FIELDS carrname "Es sollen nur Fluggesehllschaften ausgegeben werden <-
* WHERE currcode = 'EUR'
* INTO TABLE @DATA(lt_scarr).
*cl_demo_output=>display( lt_scarr ).

SELECT
 FROM
 Scarr
 FIELDS *
 WHERE currcode = 'EUR'
 INTO TABLE @DATA(lt_scarr).
cl_demo_output=>display( lt_scarr ).
