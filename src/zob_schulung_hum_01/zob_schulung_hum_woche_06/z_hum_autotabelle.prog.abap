*&---------------------------------------------------------------------*
*& Report z_hum_autotabelle
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_autotabelle.

Select
From zob_hum_t_owner as owner
left join zob_hum_t_car as car
on owner~modell = car~modell and owner~marke = car~marke
Fields
owner~name,
owner~stadt,
owner~strasse,
car~marke,
car~modell,
car~jahr
Where owner~name not like ' '
Into table @Data(lt_autos).

cl_demo_output=>display( lt_autos ).
