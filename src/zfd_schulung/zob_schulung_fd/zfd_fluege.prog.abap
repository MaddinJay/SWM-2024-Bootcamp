*&---------------------------------------------------------------------*
*& Report ZFD_FLUEGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_fluege.

PARAMETERS p_ges TYPE spfli-carrid.

DATA: it_fluege TYPE TABLE OF spfli,
      is_flug   TYPE spfli.

*SELECT * FROM SPFLI INTO TABLE it_fluege WHERE carrid = p_ges.

CALL FUNCTION 'Z_FD_GET_FLUEGE'
  EXPORTING
    iv_carrid = p_ges
  IMPORTING
    et_liste  = it_fluege.


LOOP AT it_fluege INTO is_flug.
  WRITE: ' Flugnummer: ', is_flug-carrid, is_flug-connid, ' von ',is_flug-cityfrom, is_flug-countryfr, ' nach ', is_flug-cityto, is_flug-countryto, /.
ENDLOOP.
