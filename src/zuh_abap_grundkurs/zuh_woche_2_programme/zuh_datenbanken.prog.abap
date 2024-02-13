*&---------------------------------------------------------------------*
*& Report ZUH_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_datenbanken.
**********************************************************************
*Auslesen von Daten aus einer Datenbank
**********************************************************************
DATA: gt_spfli TYPE TABLE OF spfli,
      gs_spfli TYPE spfli.
*      wa_spfli TYPE spfli.   " Arbeitsbereich = Struktur

*SELECT *  FROM spfli INTO TABLE gt_spfli.
*SELECT * FROM spfli INTO TABLE gt_spfli WHERE  carrid = 'LH'.
SELECT SINGLE * FROM spfli INTO gs_spfli WHERE  carrid = 'LH'.

IF sy-subrc <> 0.
  WRITE 'Fehler!!'.
ELSE.
  LOOP AT  gt_spfli INTO  gs_spfli.
    WRITE: gs_spfli-carrid, gs_spfli-connid,/.
  ENDLOOP.
ENDIF.
