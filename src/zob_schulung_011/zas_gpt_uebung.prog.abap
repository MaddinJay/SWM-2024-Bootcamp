*&---------------------------------------------------------------------*
*& Report zas_gpt_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_gpt_uebung.

START-OF-SELECTION.
  DATA: o_report TYPE REF TO z_as_gpt.
  PARAMETERS p_cntry TYPE string.
  CREATE OBJECT o_report.
  o_report->get_customers( iv_land = p_cntry ).
