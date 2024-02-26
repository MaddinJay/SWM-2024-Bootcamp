*&---------------------------------------------------------------------*
*& Report ZTL_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTL_DATENBANKEN.

DATA: gt_spfli TYPE TABLE OF SPFLI,
      gs_spfli TYPE SPFLI.

SELECT * FROM SPFLI INTO TABLE gt_spfli.

LOOP AT gt_spfli INTO gs_spfli.
  WRITE: gs_spfli-carrid, gs_spfli-connid, /.
  ENDLOOP.
