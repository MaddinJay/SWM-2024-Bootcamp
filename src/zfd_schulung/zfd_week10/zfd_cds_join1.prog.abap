*&---------------------------------------------------------------------*
*& Report zfd_cds_join1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_cds_join1.

data lt_tab type table of ZFD_CDS_JOIN1.

SELECT
FROM zfd_cds_join1( p_name = 'Kangeroos', p_date = '20240101' )
FIELDS *
into Table @lt_tab.

cl_demo_output=>display( lt_tab ).
