*&---------------------------------------------------------------------*
*& Report zst_spielwiese
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_spielwiese.

TABLES SCOUNTER.

DATA: gv_suche TYPE scounter-carrid.

SELECTION-SCREEN BEGIN OF SCREEN 100.
PARAMETERS: p_suche  TYPE scounter-carrid  OBLIGATORY,
            p_suche3 type scounter-countnum,
            p_suche2 TYPE scounter-airport OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 200." AS SUBSCREEN.
PARAMETERS: p_no   RADIOBUTTON GROUP r_g1,
            p_ja   RADIOBUTTON GROUP r_g1.
SELECTION-SCREEN END OF SCREEN 200.

DATA: BEGIN OF ls_tabelle,
              carrid   LIKE scounter-carrid,
              countnum like scounter-countnum,
              airport  LIKE scounter-airport,

      END OF ls_tabelle.

      Data: LV_Vorb type s_countnum VALUE IS INITIAL.
            LV_vorb =  P_suche3 + 1.

SELECTION-SCREEN BEGIN OF SCREEN 300.
PARAMETERS: p_flugg TYPE scounter-carrid,
            p_flugha TYPE scounter-airport,
            p_flugc type scounter-countnum.
SELECTION-SCREEN END OF SCREEN 300.

INITIALIZATION.
gv_suche = p_suche.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF gv_suche IS NOT INITIAL.
      IF screen-name = 'P_FLUGG'.
        screen-input = '0'. " Disable input for p_flugg
      ENDIF.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.
p_flugg = gv_suche.

START-OF-SELECTION.

    CALL SELECTION-SCREEN 100.

 Select single
from
scounter
fields
countnum
Where carrid = @p_suche and airport = @p_suche2
into @data(ls_schalter).

SELECT
  FROM
    scounter
  FIELDS
    carrid,
    countnum,
    airport
      WHERE carrid = @p_suche and countnum = @p_suche3 and airport = @p_suche2
  INTO @ls_tabelle.
 ENDSELECT.

IF sy-subrc = 0.
   WRITE: ls_tabelle-carrid,
   / ls_tabelle-countnum,
   / ls_tabelle-carrid.
ELSE.
CALL SELECTION-SCREEN 200.

IF p_no = 'X'.
    WRITE 'Danke'.
    EXIT.
  ELSE.
CALL SELECTION-SCREEN 300.
DATA(ls_scounter_insert) = VALUE scounter(
carrid = p_flugg
countnum = p_flugc
airport = p_flugha
).
Modify scounter from ls_scounter_insert.
if sy-subrc = 0.
WRITE 'OK'.
ELSE.
WRITE 'NICHT OK'.
ENDIF.
  ENDIF.
ENDIF.
