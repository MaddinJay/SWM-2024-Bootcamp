*&---------------------------------------------------------------------*
*& Report zuh_maximale_kapazitaet
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_maximale_kapazitaet.


*Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den
*Namen der Fluggesellschaft mit aus.
*Tabelle: SCARR, SFLIGHT

SELECT
 FROM sflight AS flug
  LEFT JOIN scarr AS gesellschaft
 ON gesellschaft~carrid = flug~carrid
 FIELDS
 flug~connid,
 COUNT( * ) AS amount,
 SUM( seatsmax ) AS sitze_n,
 SUM( seatsmax_b ) AS sitz_b,
 SUM( seatsmax_f ) AS sitze_f,
 SUM( seatsmax + seatsmax_b + seatsmax_f ) AS sitze_g

GROUP BY flug~connid
INTO TABLE @DATA(lt_join_tabelle).


cl_demo_output=>display( lt_join_tabelle ).
