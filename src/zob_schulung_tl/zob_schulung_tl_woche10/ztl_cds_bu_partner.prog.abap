*&---------------------------------------------------------------------*
*& Report ztl_cds_bu_partner
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_cds_bu_partner.

SELECT
FROM
ZTL_CDS_BU_PARTNER(
p_spras = @sy-langu,
p_date = @sy-datum
 )
FIELDS *

INTO TABLE @DATA(lt_geschpartner_bzh).
cl_demo_output=>display( lt_geschpartner_bzh ).
