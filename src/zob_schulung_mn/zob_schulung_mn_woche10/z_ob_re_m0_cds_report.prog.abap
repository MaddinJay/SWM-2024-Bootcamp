*&---------------------------------------------------------------------*
*& Report z_ob_re_m0_cds_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_m0_cds_report.

SELECT FROM zob_cds_m0_001(
   p_name = 'Kangeroos' , p_date = '20240101'
)
  FIELDS *
  INTO TABLE @DATA(lt_fluggesellschaften).

cl_demo_output=>display(
  data    = lt_fluggesellschaften
).
