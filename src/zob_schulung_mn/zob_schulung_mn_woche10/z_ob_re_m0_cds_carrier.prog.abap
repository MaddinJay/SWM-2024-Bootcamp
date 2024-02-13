*&---------------------------------------------------------------------*
*& Report z_ob_re_m0_cds_carrier
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_m0_cds_carrier.

PARAMETERS: p_rcurr    TYPE s_currcode,
            p_text(10) TYPE c.

START-OF-SELECTION.

  SELECT FROM zob_cds_m0_carrier(
     p_curr = @p_rcurr
   , p_text = @p_text
  )
  FIELDS *
  INTO TABLE @DATA(lt_flug).

  cl_demo_output=>display(
    data    = lt_flug ).
