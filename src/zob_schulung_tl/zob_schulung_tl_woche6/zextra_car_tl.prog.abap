*&---------------------------------------------------------------------*
*& Report zextra_car_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_car_tl.

*TABLES ZOBTL_T_OWNER_TL.
*TABLES ZOBTL_T_CAR_TL.

SELECT
FROM
ZOBTL_T_CAR_TL AS auto INNER JOIN ZOBTL_T_OWNER_TL AS besitzer ON auto~brand = besitzer~brand AND auto~model = besitzer~model
FIELDS
auto~brand AS Automarke,
auto~model AS Automodel,
auto~jahr AS Jahr,
besitzer~owner_name AS Besitzer,
besitzer~owner_adress AS Adresse

INTO TABLE @DATA(lt_car).
cl_demo_output=>display( lt_car ).
