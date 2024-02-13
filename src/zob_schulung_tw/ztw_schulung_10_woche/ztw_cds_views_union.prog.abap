*&---------------------------------------------------------------------*
*& Report ztw_cds_views_union
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_cds_views_union.

SELECT
FROM
zob_cds_tw_union
FIELDS *
INTO TABLE @DATA(lt_fluggesell_info).

cl_demo_output=>display( lt_fluggesell_info ).
