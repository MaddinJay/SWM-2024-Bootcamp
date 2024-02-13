*&---------------------------------------------------------------------*
*& Report zuh_autotabelle
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_autotabelle.

select from ZOBUH_T_CAR_007 as car
inner join ZOBUH_T_OWNER007 as owner
on car~model = owner~model and car~brand = owner~brand
fields
car~brand as Hersteller,
car~model as Model,
owner~kunde as Name,
owner~kadresse as Adresse
into table @Data(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
