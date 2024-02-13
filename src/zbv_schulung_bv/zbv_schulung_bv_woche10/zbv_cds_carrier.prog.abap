*&---------------------------------------------------------------------*
*& Report zbv_cds_carrier
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_cds_carrier.

Parameters: p_curr type s_currcode,
            p_text(10) Type c.

START-OF-SELECTION.

SELECT FROM zob_cds_bv_carrier(
 p_curr = @p_curr,
 p_text = @p_text
)
FIELDS *
INTO TABLE @DATA(lt_flug).

cl_demo_output=>display( lt_flug ).
