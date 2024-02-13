*&---------------------------------------------------------------------*
*& Report zaw_uebung_extra2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_extra2.

SELECT
FROM spfli
FIELDS *
WHERE distance > 5000
INTO TABLE @DATA(lt_flight).

cl_demo_output=>display( lt_flight ).

SELECT
FROM spfli
FIELDS *
WHERE cityfrom = 'FRANKFURT'
INTO TABLE @DATA(lt_flight2).

cl_demo_output=>display( lt_flight2 ).

SELECT
FROM scustom
FIELDS *
WHERE name LIKE 'S%'
INTO TABLE @DATA(lt_custom).

cl_demo_output=>display( lt_custom ).

SELECT
FROM scarr
FIELDS carrname
WHERE currcode = 'EUR'
INTO TABLE @DATA(lt_scarr).

cl_demo_output=>display( lt_scarr ).
