*&---------------------------------------------------------------------*
*& Report zfd__cds_bu_partner
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd__cds_bu_partner.

parameters: p_rlang type spras default 'D',
            p_rdate type bu_datto Default '99991231'.

data lt_tab type table of ZFD_CDS_BU_PARTNER.

SELECT
FROM zfd_cds_bu_partner( p_lang = @p_rlang, p_date = @p_rdate )
FIELDS *
into Table @lt_tab.

cl_demo_output=>display( lt_tab ).
