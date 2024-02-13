*&---------------------------------------------------------------------*
*& Report ZOD_STATISTIK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_statistik.

DATA: lt_sta_flug TYPE TABLE OF spfli,
      ls_sta_flug TYPE spfli.

PARAMETERS: pa_fges TYPE spfli-carrid.

CALL FUNCTION 'Z_OD_GET_FLUEGE'
  EXPORTING
    iv_carrid = pa_fges
  IMPORTING
    et_fluege = lt_sta_flug.

LOOP AT lt_sta_flug INTO ls_sta_flug.
  WRITE: / '|', ls_sta_flug-connid, ls_sta_flug-cityfrom, ls_sta_flug-cityto.

ENDLOOP.



*SELECT carrid, carrname, fltime FROM spfli. scarr. INTO TABLE gt_sta_typ.
