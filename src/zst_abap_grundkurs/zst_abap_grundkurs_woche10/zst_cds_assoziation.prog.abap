*&---------------------------------------------------------------------*
*& Report zst_cds_assoziation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_cds_assoziation.

Select
from ZOB_CDS_ST_ASSOZIATION
Fields
Carrid,
Connid,
\_Carrier-carrname,
\_Flight-fldate
Into Table @Data(lt_res).

cl_demo_output=>display( lt_res ).
