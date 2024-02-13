*&---------------------------------------------------------------------*
*& Report z_projektuebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_projektuebung.

TABLES sflight.

SELECTION-SCREEN BEGIN OF BLOCK Verbrauch WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY,
              p_flug   TYPE sflight-connid OBLIGATORY,
              p_fldate TYPE sflight-fldate OBLIGATORY.
SELECTION-SCREEN END OF BLOCK Verbrauch.
