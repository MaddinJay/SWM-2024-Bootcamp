*&---------------------------------------------------------------------*
*& Report z_ea_cdstest
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ea_cdstest.

SELECT
 FROM
ZEA_CDS_MN_CARRIER
 FIELDS
 *
 INTO TABLE @DATA(lt_fluggesell_info).

cl_demo_output=>display( lt_fluggesell_info ).
