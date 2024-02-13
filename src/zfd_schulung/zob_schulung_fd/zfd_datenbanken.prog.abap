*&---------------------------------------------------------------------*
*& Report ZFD_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_datenbanken.

DATA: gt_spfli TYPE TABLE OF SPFLI,
      gs_spfli TYPE SPFLI.
*Data wa_spfli TYPE SPFLI. " Arbeitsbereich (Workarea) =  Struktur  wa !

*SELECT * FROM spfli INTO TABLE gt_spfli.
SELECT * FROM SPFLI INTO TABLE gt_spfli WHERE carrid = 'LH'.
SELECT SINGLE * FROM SPFLI INTO gs_spfli WHERE carrid = 'LH'.

IF sy-subrc <> 0.
  WRITE 'Fehler!'.
ELSE.
  LOOP AT gt_spfli INTO gs_spfli.
    WRITE: gs_spfli-carrid ,gs_spfli-connid, /.
  ENDLOOP.


ENDIF.
