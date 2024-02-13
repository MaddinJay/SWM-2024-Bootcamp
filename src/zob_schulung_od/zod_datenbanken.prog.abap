*&---------------------------------------------------------------------*
*& Report ZOD_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_datenbanken.

DATA: gt_spfli TYPE TABLE OF spfli,
      gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr,
      gs_spfli TYPE spfli.



SELECT * FROM spfli INTO TABLE @gt_spfli WHERE cityto IN ('FRANKFURT').

*SELECT SINGLE * FROM spfli INTO gs_spfli WHERE cityto IN ('FRANKFURT'). "nicht into table zulässig


IF sy-subrc <> 0.
  WRITE: 'Fehler'.
ELSE.
  LOOP AT gt_spfli INTO gs_spfli.
  WRITE: gs_spfli-carrid, gs_spfli-connid, gs_spfli-cityto, gs_spfli-cityfrom, /.
ENDLOOP.
ENDIF.
