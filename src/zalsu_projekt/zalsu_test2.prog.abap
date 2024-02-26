*&---------------------------------------------------------------------*
*& Report zalsu_test2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_test2.



TYPE-POOLS: vrm.
TYPES: BEGIN OF ls_status,
         status TYPE zalsu_db_status-status,
       END OF ls_status.

TYPES: BEGIN OF ls_technik,
           technikerid TYPE zalsu_db_technik-technikerid,
           nachname    TYPE zalsu_db_technik-nachname,
           vorname     TYPE zalsu_db_technik-vorname,
           anwesend    TYPE zalsu_db_technik-anwesend,
       END OF ls_technik.

DATA: gt_status TYPE STANDARD TABLE OF ls_status,
      ls_stati  TYPE ls_status,
      gt_technik TYPE STANDARD TABLE OF ls_technik,
      ls_tech  TYPE ls_technik,
      g_id      TYPE vrm_id,
      it_values_s TYPE vrm_values,      " Status
      it_values_t TYPE vrm_values,      " Techniker
      wa_values_s LIKE LINE OF it_values_s,
      wa_values_t LIKE LINE OF it_values_t.

PARAMETERS:    p_stat_z     TYPE zalsu_db_status AS LISTBOX VISIBLE LENGTH 20.
PARAMETERS:    p_tech_z     TYPE zalsu_db_technik AS LISTBOX VISIBLE LENGTH 20.

AT SELECTION-SCREEN OUTPUT.
  SELECT
  FROM zalsu_db_status
  FIELDS status
  INTO TABLE @gt_status.

  LOOP AT gt_status INTO ls_stati.
    wa_values_s-key = ls_stati-status.
    APPEND wa_values_s TO it_values_s.
    CLEAR wa_values_s.
  ENDLOOP.

  g_id = 'p_stat_z'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = g_id
      values = it_values_s.

      SELECT
FROM zalsu_db_technik
FIELDS nachname
INTO TABLE @gt_technik.

LOOP AT gt_technik INTO ls_tech.
  wa_values_t-key = ls_tech-nachname.
  APPEND wa_values_t TO it_values_t.
  CLEAR wa_values_t.
ENDLOOP.

g_id = 'p_tech_z'.
CALL FUNCTION 'VRM_SET_VALUES'
  EXPORTING
    id     = g_id
    values = it_values_t.

        select single
    from zalsu_db_technik
    fields *
    where nachname = @p_tech_z-nachname
    into @DATA(ls_techniker1).

START-OF-SELECTION.

write 'Test'.
*cl_demo_output=>display( ls_techniker1 ).
