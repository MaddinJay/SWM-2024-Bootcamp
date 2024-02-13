*&---------------------------------------------------------------------*
*& Report ztw_wiederholung_uebung_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_wiederholung_uebung_01.

SELECT FROM ztw_t_owner
RIGHT JOIN ztw_t_car
ON ztw_t_car~brand = ztw_t_owner~brand and ztw_t_car~model = ztw_t_owner~model

fields
ztw_t_owner~name as Name,
ztw_t_owner~adress as Adresse,
ztw_t_car~brand as Marke,
ztw_t_car~model as Model,
ztw_t_car~prodyear as Herstellungsjahr

WHERE ztw_t_owner~brand IS NOT INITIAL
INTO TABLE @DATA(gt_car).

cl_demo_output=>display( gt_car ).
