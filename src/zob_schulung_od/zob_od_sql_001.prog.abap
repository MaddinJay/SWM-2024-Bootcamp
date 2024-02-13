*&---------------------------------------------------------------------*
*& Report zob_od_sql_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_sql_001.
**********************************************************************

*DATA lt_kunde TYPE TABLE OF sbook.
*
*SELECT
*FROM
*SBOOK
*FIELDS *
*WHERE passname = 'Christa Delon'
*INTO CORRESPONDING FIELDS OF TABLE @lt_kunde.

*SELECT
*  FROM
*    sbook
*  FIELDS
*    agencynum,
*    bookid,
*    passname
*  WHERE passname = 'Christa Delon'
*  INTO TABLE @DATA(lt_tabelle).
***cl_demo_output=>display( lt_bookings ).

SELECT
  FROM
    scounter
  FIELDS
    carrid,
    airport
      WHERE carrid = ' ' and airport like '%'
  INTO TABLE @DATA(lt_tabelle).
**cl_demo_output=>display( lt_bookings ).



cl_demo_output=>display( lt_tabelle ).
