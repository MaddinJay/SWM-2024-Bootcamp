*&---------------------------------------------------------------------*
*& Report zbv_cds_ausgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_cds_ausgabe.

SELECT
FROM ZOB_CDS_VBV_001( p_name = 'Kangeroos' )
FIELDS *
INTO TABLE @DATA(lt_fluggesell_info).

cl_demo_output=>display( lt_fluggesell_info ).
