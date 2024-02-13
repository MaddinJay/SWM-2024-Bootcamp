*&---------------------------------------------------------------------*
*& Report zuh_fluege_und_flugges
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_fluege_und_flugges.

*Verwenden Sie einen Join, um die Details aller Flüge und deren
*entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu
*holen

SELECT
 FROM sflight AS flug
 LEFT JOIN scarr AS firma
 ON flug~carrid = firma~carrid
 FIELDS
 flug~carrid,
 flug~fldate,
 firma~carrname
 INTO TABLE @DATA(lt_join_tabelle)
 UP TO 100 ROWS.

cl_demo_output=>display( lt_join_tabelle ).
