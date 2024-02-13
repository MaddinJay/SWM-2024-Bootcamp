*&---------------------------------------------------------------------*
*& Report ZOD_STATISTIK_FLUEGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_statistik_fluege.

TYPES: BEGIN OF lty_s_fluege,
         carrid   TYPE S_carr_id,
         carrname TYPE s_carrname,
         fltime   TYPE s_fltime,
         distance TYPE s_distance,
       END OF lty_s_fluege.

DATA: gs_stafluege    TYPE lty_s_fluege,
      lty_t_stafluege TYPE STANDARD TABLE OF lty_s_fluege.

SELECT sp~carrid, sc~carrname, max( sp~fltime ), sp~distance
     FROM spfli as sp
     LEFT OUTER JOIN scarr as sc ON sp~carrid = sc~carrid
WHERE sp~fltype = '' AND sp~fltime > 420
GROUP BY sp~carrid, sc~carrname, sp~fltime, sp~distance "HAVING COUNT (sp~fltime) GT 420
ORDER BY max( sp~fltime ) DESCENDING
 INTO TABLE @lty_t_stafluege.

IF sy-subrc <> 0.
  WRITE: 'Keine Zustimmung'.
ELSE.

  LOOP AT lty_t_stafluege INTO gs_stafluege.
    WRITE: 'Flug ID: ' , gs_stafluege-carrid,
    '|' , 'Fluggeselschaft: ', '|', gs_stafluege-carrname,
    '|',  'Flugzeit: ', '|', gs_stafluege-fltime,
    '|',  'Strecke: ', '|', gs_stafluege-distance, /.

  ENDLOOP.
ENDIF.
