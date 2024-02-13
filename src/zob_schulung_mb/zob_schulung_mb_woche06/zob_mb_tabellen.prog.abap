*&---------------------------------------------------------------------*
*& Report zob_mb_tabellen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_tabellen.



*TABLES ZOBMB_T_CAR_003
*TABLES ZOBMB_T_OWNER003

SELECT
FROM
ZOBMB_T_CAR_003 AS auto INNER JOIN ZOBMB_T_OWNER003 AS besitzer ON auto~model = besitzer~model
FIELDS
auto~brand AS Automarke,
auto~model AS Automodel,
auto~jahr AS Jahr,
besitzer~owner_name AS Besitzer,
besitzer~owner_address AS Adresse

INTO TABLE @DATA(lt_car).
cl_demo_output=>display( lt_car ).
