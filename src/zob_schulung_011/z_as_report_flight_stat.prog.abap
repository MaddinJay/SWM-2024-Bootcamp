*&---------------------------------------------------------------------*
*& Report z_as_report_flight_stat
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_report_flight_stat.

SELECT
FROM sflight
FIELDS fldate, carrid, COUNT( * ) AS anzahlFluege
GROUP BY fldate, carrid
ORDER BY fldate ASCENDING
INTO TABLE @DATA(lt_sflight).
cl_demo_output=>display( lt_sflight ).

READ TABLE lt_sflight INTO DATA(ls_sflight) INDEX 1.

LOOP AT lt_sflight INTO ls_sflight.
  IF ls_sflight-fldate > '01/01/2024'. " AND ls_sflight-fldate < '2023-12-31'.
    WRITE: ls_sflight-carrid, ls_sflight-fldate, ls_sflight-anzahlfluege, /.
  ENDIF.
ENDLOOP.
