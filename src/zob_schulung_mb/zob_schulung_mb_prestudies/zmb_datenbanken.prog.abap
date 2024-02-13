*&---------------------------------------------------------------------*
*& Report ZMB_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMB_DATENBANKEN.


Data: gt_spfli type table of spfli,
      gs_spfli type spfli.

*DATA: wa_spfli type spfli.
*wa steht für work area, ist aber eine Struktur, so am besten nicht verwenden

*Select * From SPFLI INTO TABLE gt_spfli.

*Select * From SPFLI INTO TABLE gt_spfli where carrid = 'LH'.
Select SINGLE * From SPFLI INTO gs_spfli where carrid = 'LH'.

IF sy-subrc <> 0.
Write 'Fehler!'.
Else.
Loop at gt_spfli into gs_Spfli.
Write: gs_spfli-carrid, gs_spfli-connid, /.
Endloop.
ENDIF.
