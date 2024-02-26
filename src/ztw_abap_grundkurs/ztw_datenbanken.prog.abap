*&---------------------------------------------------------------------*
*& Report ZTW_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_datenbanken.

DATA: gt_spfli TYPE STANDARD TABLE OF SPFLI,
      gs_spfli TYPE spfli.

SELECT * FROM SPFLI INTO TABLE gt_spfli WHERE carrid = 'LH'.
SELECT SINGLE * FROM SPFLI INTO gs_spfli WHERE carrid = 'LH'.

IF sy-subrc <> 0.
  WRITE 'Fehler!'.
ELSE.
  LOOP AT gt_spfli INTO gs_spfli.
    WRITE: gs_spfli-carrid, gs_spfli-connid, /.
  ENDLOOP.

ENDIF.
