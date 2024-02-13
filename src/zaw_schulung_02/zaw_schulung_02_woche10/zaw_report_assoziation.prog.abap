*&---------------------------------------------------------------------*
*& Report zaw_report_assoziation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_report_assoziation.

SELECT
FROM zob_aw_cds_assoziation
FIELDS
carrid,
connid,
\_carrier-carrname,
\_Flight-planetype
INTO TABLE @DATA(lt_asso).

cl_demo_output=>display( lt_asso ).
