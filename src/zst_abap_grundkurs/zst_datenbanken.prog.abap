*&---------------------------------------------------------------------*
*& Report ZST_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_datenbanken.

DATA: gt_spfli TYPE TABLE OF spfli,
      gs_spfli TYPE spfli.

*SELECT * FROM spfli INTO TABLE gt_spfli.
SELECT * FROM spfli INTO TABLE gt_spfli where carrid = 'LH'.


LOOP AT gt_spfli INTO gs_spfli.
write:gs_SPfli-carrid, gs_spfli-connid, /.

ENDLOOP.
