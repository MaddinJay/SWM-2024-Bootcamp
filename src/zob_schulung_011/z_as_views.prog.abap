*&---------------------------------------------------------------------*
*& Report z_as_views
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_views.

SELECT
FROM zob_cds_as_buchungen
FIELDS *
INTO TABLE @DATA(lt_flight).

cl_demo_output=>display( lt_flight ).
