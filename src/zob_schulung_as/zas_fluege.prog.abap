*&---------------------------------------------------------------------*
*& Report ZAS_FLUEGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_fluege.

DATA: gs_spfli TYPE spfli,
      gt_spfli TYPE TABLE OF spfli.

PARAMETERS p_carrid TYPE spfli-carrid.

CALL FUNCTION 'Z_AS_GET_FLUEGE'
  EXPORTING
    iv_carrid = p_carrid
  IMPORTING
    et_liste  = gt_spfli.

IF sy-subrc = 0.
  LOOP AT gt_spfli INTO gs_spfli.
    WRITE: gs_spfli-connid, gs_spfli-cityfrom, gs_spfli-countryfr, gs_spfli-cityto, gs_spfli-countryto, /.
  ENDLOOP.
ENDIF.
