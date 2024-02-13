*&---------------------------------------------------------------------*
*& Report zaw_report_view
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_report_view.

PARAMETERS: p_curr  TYPE s_currcode,
            p_input TYPE p_text.

START-OF-SELECTION.

  SELECT
  FROM zob_aw_cds_kangeroos( p_name = 'Kangeroos', p_date = '20240206' )
  FIELDS *
  INTO TABLE @DATA(lt_flugges_info).

  cl_demo_output=>display( lt_flugges_info ).


* Typangabe bezieht sich auf CDS View E / Entität
  DATA lt_busi TYPE TABLE OF zob_cds_aw_bu_partner.

  SELECT
  FROM zob_cds_aw_bu_partner
  FIELDS *
  INTO TABLE @lt_busi.

  cl_demo_output=>display( lt_busi ).


  SELECT
  FROM zob_aw_cds_carrier( p_currcode = @p_curr, p_text = @p_input ) " Wegen Datenbankabfrage muss @ vor der Variable stehen.
  FIELDS *
  INTO TABLE @DATA(lt_curr).

  cl_demo_output=>display( lt_curr ).
