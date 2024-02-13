*&---------------------------------------------------------------------*
*& Report zob_mb_test_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_test_2.


select
from
Sflight
left outer join scarr
ON sflight~carrid = scarr~carrid
fields

scarr~carrname,
SUM( seatsmax ) as sitze,
SUM( seatsmax_b ) as sitzeb,
SUM( SEATSMAX_f ) as sitzef,
SUM( seatsmax + seatsmax_b + SEATSMAX_f ) as gesamt
GROUP BY scarr~carrname "->an jedem Tag, gibt es mehrere Flüge von einer Fluggesellschaft
having SUM( seatsmax ) > '100000'

into table @data(lt_max).
cl_demo_output=>display( lt_max ).
