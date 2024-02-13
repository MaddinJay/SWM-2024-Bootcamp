*&---------------------------------------------------------------------*
*& Report zuh_cds_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_cds_test.

*parameters: a_name type string


SELECT
FROM ZOB_CDS_UH_001(
p_name = 'Kangeroos',
p_date = '20240101'
 )
FIELDS *

INTO TABLE @DATA(lt_fluggesell_info).

cl_demo_output=>display( lt_fluggesell_info ).
