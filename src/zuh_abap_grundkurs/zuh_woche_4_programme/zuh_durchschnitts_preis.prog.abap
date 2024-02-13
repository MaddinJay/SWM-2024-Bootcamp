*&---------------------------------------------------------------------*
*& Report zuh_durchschnitts_preis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_durchschnitts_preis.

*Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer
*bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.

*SELECT
* FROM sflight
* FIELDS
* carrid,
* COUNT(*) AS amount,
* AVG( price AS DEC( 10,0 ) ) AS avg_price
*GROUP BY carrid
* INTO TABLE @DATA(lt_flugtabelle).
*
*
*
*cl_demo_output=>display( lt_flugtabelle ).

SELECT
 FROM sflight
 FIELDS
*COUNT(*) AS amount,
 AVG( price AS DEC( 10,0 ) )
WHERE carrid = 'LH'
 INTO  @DATA(lv_avg_price).

WRITE: 'Der Durchschnittspreis der Fluggesellschaft beträgt:', lv_avg_price.
