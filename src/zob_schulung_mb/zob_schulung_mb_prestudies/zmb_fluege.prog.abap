*&---------------------------------------------------------------------*
*& Report ZMB_FLUEGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMB_FLUEGE.

**********************************************************************
* Übung aus Video 4
**********************************************************************


DATA: ls_flug TYPE spfli,
 lt_fluege TYPE TABLE OF spfli.


PARAMETERS p_ges type spfli-carrid.

select * from spfli into table lt_fluege where carrid = p_ges.



 Loop at lt_fluege into ls_flug.
   write: ls_flug-connid, ls_flug-cityfrom, ls_flug-countryfr,ls_flug-cityto, ls_flug-countryto.
   ENDLOOP.
