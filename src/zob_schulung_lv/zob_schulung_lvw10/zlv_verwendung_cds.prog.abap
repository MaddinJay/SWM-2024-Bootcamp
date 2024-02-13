*&---------------------------------------------------------------------*
*& Report zlv_verwendung_cds
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlv_verwendung_cds.

SELECT FROM ZLV_datadefinition_CDS
FIELDS *
INTO TABLE @DATA(lt_flight).

cl_demo_output=>display( lt_flight ).
