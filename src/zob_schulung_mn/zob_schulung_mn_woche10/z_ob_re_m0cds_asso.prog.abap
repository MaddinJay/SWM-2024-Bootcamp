*&---------------------------------------------------------------------*
*& Report Z_OB_RE_M0CDS_ASSO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_m0cds_asso.
SELECT
  FROM zob_cds_mn_assoziation
  FIELDS
    Carrid,
    Connid,
    \_Carrier-carrname,
    \_Flight-fldate
  INTO TABLE @DATA(lt_res).


cl_demo_output=>display( lt_res ).
