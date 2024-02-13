*&---------------------------------------------------------------------*
*& Report ZUH_FLUEGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_fluege.

DATA: lt_fluege TYPE TABLE OF spfli,
      ls_fluege TYPE spfli.

PARAMETERS: p_ges TYPE spfli-carrid.

CALL FUNCTION 'Z_0000_GET_FLUEGE'
  EXPORTING
    iv_carrid = p_ges
  IMPORTING
    liste     = lt_fluege.




IF sy-subrc <> 0.
  WRITE 'Fehler!!!'.
ELSE.
  LOOP AT  lt_fluege INTO  ls_fluege.
    WRITE: ls_fluege-carrid, ls_fluege-connid, ls_fluege-cityfrom, ls_fluege-countryfr, ls_fluege-cityto, ls_fluege-countryto, /.
  ENDLOOP.
ENDIF.
