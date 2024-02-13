*&---------------------------------------------------------------------*
*& Report z_ob_re_m0_cds_cds_bup_rel
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_m0_cds_cds_bup_rel.

" Typeangabe bezieht sich auf CDS View E/ Enität
DATA: lt_Result TYPE TABLE OF zob_cds_mn_bu_partner.

SELECT FROM zob_cds_mn_bu_partner( p_date = '20190101' )
 FIELDS
  *
  INTO TABLE @lt_result.

cl_demo_output=>display(
  data    = lt_result

).
