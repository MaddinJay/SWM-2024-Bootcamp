*&---------------------------------------------------------------------*
*& Report zbv_car
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_car.

SELECT
FROM ZBV_T_OWNER
INNER JOIN ZBV_T_CAR ON zbv_t_owner~brand = zbv_t_car~brand AND zbv_t_owner~model = zbv_t_car~model
FIELDS
zbv_t_owner~owner as Name,
zbv_t_owner~adress as Adresse,
zbv_t_owner~brand as Marke,
zbv_t_owner~model as Modell,
zbv_t_owner~prod as Baujahr
INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
