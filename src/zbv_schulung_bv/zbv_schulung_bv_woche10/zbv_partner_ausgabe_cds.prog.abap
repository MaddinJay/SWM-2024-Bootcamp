*&---------------------------------------------------------------------*
*& Report zbv_partner_ausgabe_cds
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_partner_ausgabe_cds.

"Typeangabe bezieht sich auf CDS View E/ Entität
DATA: lt_result TYPE TABLE OF zob_cds_bv_bu_partner.

SELECT
FROM ZOB_CDS_BV_BU_PARTNER(
p_spras = @sy-langu,
p_datu = @sy-datum
)
FIELDS *
INTO TABLE @lt_result.

cl_demo_output=>display( lt_result ).
