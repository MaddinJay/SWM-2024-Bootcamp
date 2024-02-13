*&---------------------------------------------------------------------*
*& Report zuh_material
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_material.

*Gebt alle Materialien mit ihrem Kurztext aus.
*Tabellen: Mara, Makt


SELECT
 FROM mara
 LEFT JOIN makt
 ON mara~matnr = makt~matnr
 FIELDS
 mara~matnr AS Materialnr,
 makt~maktx AS Kurztext

 INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
