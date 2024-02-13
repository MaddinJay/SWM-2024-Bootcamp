*&---------------------------------------------------------------------*
*& Report zob_fb_report_views
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_fb_report_views.

SELECT FROM ZOB_CDS_FB_001( p_name = 'Kangeroos' )
  FIELDS *
  INTO TABLE @DATA(lt_fluggesell_info).

  cl_demo_output=>display( lt_fluggesell_info ).
