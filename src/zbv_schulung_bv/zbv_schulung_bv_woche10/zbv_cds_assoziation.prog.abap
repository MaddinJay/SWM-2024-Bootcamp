*&---------------------------------------------------------------------*
*& Report zbv_cds_assoziation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_cds_assoziation.

SELECT
FROM zob_cds_bv_assoziation
FIELDS
  Carrid,
  Connid,
  \_Carrier-carrname,          "Umgekehrter Schrägstrich und Unterstrich sind notwendig, da im CDS-View Assoziation vorhanden ist
  \_Flight-fldate
INTO TABLE @DATA(lt_Tabelle).

cl_demo_output=>display( lt_Tabelle ).
