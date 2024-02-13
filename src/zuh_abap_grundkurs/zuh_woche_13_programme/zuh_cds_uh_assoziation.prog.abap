*&---------------------------------------------------------------------*
*& Report zuh_cds_uh_assoziation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_cds_uh_assoziation.


select
from ZOB_CDS_UH_ASSOZIATION
fields
carrid,
connid,
\_Carrier-carrname,
\_Flight-fldate
into table @Data(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
