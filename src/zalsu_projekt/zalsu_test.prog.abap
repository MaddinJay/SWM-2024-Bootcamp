*&---------------------------------------------------------------------*
*& Report zalsu_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_test.


TYPE-POOLS: vrm.
TYPES: BEGIN OF ls_tech,
         nachname TYPE zalsu_db_technik-nachname,
       END OF ls_tech.

DATA: gt_technik TYPE STANDARD TABLE OF ls_tech,
      ls_tech  TYPE ls_tech,
      g_id      TYPE vrm_id,
      it_values TYPE vrm_values,
      wa_values LIKE LINE OF it_values.

PARAMETERS:    p_tech_z     TYPE zalsu_db_technik AS LISTBOX VISIBLE LENGTH 20.

AT SELECTION-SCREEN OUTPUT.
SELECT
FROM zalsu_db_technik
FIELDS nachname
INTO TABLE @gt_technik.

LOOP AT gt_technik INTO ls_tech.
  wa_values-key = ls_tech-nachname.
  APPEND wa_values TO it_values.
  CLEAR wa_values.
ENDLOOP.

g_id = 'p_tech_z'.
CALL FUNCTION 'VRM_SET_VALUES'
  EXPORTING
    id     = g_id
    values = it_values.
