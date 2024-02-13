*&---------------------------------------------------------------------*
*& Report zuh_partnerbeziehung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_partnerbeziehung.


* Datentypesieren auf die Datendefinition
DATA: lt_result TYPE TABLE OF zob_cds_uh_bu_partner.

SELECT FROM zob_cds_uh_bu_partner( p_date = '20240602' )
FIELDS *
INTO TABLE @lt_result.

cl_demo_output=>display( lt_result ).
