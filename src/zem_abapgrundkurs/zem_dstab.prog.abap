*&---------------------------------------------------------------------*
*& Report ZEM_SQL
*&---------------------------------------------------------------------*
*& Auslesen von Daten
*&---------------------------------------------------------------------*
REPORT ZEM_DSTAB.

Data: gt_spfli TYPE TABLE OF SPFLI,
      gs_spfli TYPE SPFLI.

*SELECT * FROM SPFLI Into Table gt_spfli.
SELECT * FROM SPFLI Into Table gt_spfli WHERE carrid = 'LH'.
*OR usw..

IF sy-subrc <> 0.
  Write 'Fehler'.

  ELSE.
Loop AT gt_spfli INTO gs_spfli.
  WRITE: gs_spfli-carrid, gs_spfli-connid, /.
  Endloop.

ENDIF.
