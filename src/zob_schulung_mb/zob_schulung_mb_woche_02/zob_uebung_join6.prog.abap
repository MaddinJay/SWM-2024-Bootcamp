*&---------------------------------------------------------------------*
*& Report zob_uebung_join6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_join6.

*Gebt alle Materialien mit ihren Lang- und Kurztexten aus.
*Tabellen: MARA, MAKT

Select
from
Mara
left join makt
on mara~matnr = makt~matnr
fields
mara~matnr,
makt~maktx,
makt~maktg

into table @DATA(lt_Materialien).
cl_demo_output=>display( lt_Materialien ).


*Geben Sie zusätzlich den Standardpreis der Materialien aus.
**Tabellen: MARA, MBEW

Select
from
Mara
left join mbew
on mara~matnr = mbew~matnr
fields
mara~matnr,
mbew~stprs


into table @DATA(lt_Spreis).
cl_demo_output=>display( lt_Spreis ).
