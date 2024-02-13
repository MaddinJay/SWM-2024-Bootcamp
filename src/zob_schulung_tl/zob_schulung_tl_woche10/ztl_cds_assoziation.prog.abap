*&---------------------------------------------------------------------*
*& Report ztl_cds_assoziation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_cds_assoziation.

SELECT
FROM ZTL_CDS_ASSO
FIELDS
  Carrid,
  Connid,
  \_Carrier-carrname          "Umgekehrter Schrägstrich und Unterstrich sind notwendig, da im CDS-View Assoziation vorhanden ist
INTO TABLE @DATA(lt_assoziation).

cl_demo_output=>display( lt_assoziation ).
