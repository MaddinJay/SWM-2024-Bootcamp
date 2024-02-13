*&---------------------------------------------------------------------*
*& Report zuh_cds_uh_carrier
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_cds_uh_carrier.

PARAMETERS: p_waehr TYPE s_currcode default 'EUR',
            p_ein   TYPE char10 default 'Text2'.


START-OF-SELECTION.

  SELECT
  FROM zob_cds_uh_carrier(
                          p_waehrung = @p_waehr,
                          p_text = @p_ein
   )
  FIELDS *

  INTO TABLE @DATA(lt_fluggesell_info).

  cl_demo_output=>display( lt_fluggesell_info ).
