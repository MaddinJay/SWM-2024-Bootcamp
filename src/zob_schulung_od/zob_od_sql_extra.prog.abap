*&---------------------------------------------------------------------*
*& Report zob_od_sql_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_sql_extra.

*DATA lt_kunde TYPE TABLE OF spfli.
*DATA lt_Tabelle TYPE TABLE OF spfli.

SELECT
 FROM spfli
 FIELDS
distance, carrid
where distance GT 5000 INTO TABLE @DATA(lt_tabelle).

*SELECT
* FROM scustom
* FIELDS
*Name
*where Name like 'S%' INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).


*SELECT
* FROM scarr
* FIELDS
*CURRCODE,
*CARRID
*where CURRCODE = 'EUR' INTO TABLE @DATA(lt_tabelle).
*
*cl_demo_output=>display( lt_tabelle ).
*SEATSMAX_B,
*SEATSMAX_F
*SELECT
*CONNID,
*CARRID,
*AVG( SEATSMAX_B ) as avg_durschnitt
* FROM SFLIGHT GROUP BY CARRID, CONNID
* INTO TABLE @DATA(lt_tabelle).
*cl_demo_output=>display( lt_tabelle ).
