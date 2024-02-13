*&---------------------------------------------------------------------*
*& Report zob_od_sql_extra1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_sql_extra1.

SELECT

FROM sflight
FIELDS
 fldate, carrid
GROUP BY fldate, carrid
ORDER BY fldate
INTO TABLE @DATA(lt_tabelle)
UP TO 5 ROWS.

cl_demo_output=>display( lt_tabelle ).
