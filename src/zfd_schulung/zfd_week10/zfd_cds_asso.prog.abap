*&---------------------------------------------------------------------*
*& Report zfd_cds_asso
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_cds_asso.
select from ZFD_CDS_Assoziation
Fields
  carrid,
  connid,
  \_Carrier-carrname,
  \_Flight-fldate

into table @DATA(lt_tab).

cl_demo_output=>display( lt_tab ).
