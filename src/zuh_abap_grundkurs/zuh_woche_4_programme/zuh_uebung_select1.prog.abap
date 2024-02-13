*&---------------------------------------------------------------------*
*& Report zuh_uebung_select1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_select1.

*TABLES: sbook.
*
*DATA: lt_kunde LIKE TABLE OF sbook.
*
*SELECT FROM sbook FIELDS * WHERE passname = 'Christa Delon' INTO TABLE @lt_kunde.
*
*cl_demo_output=>display( lt_kunde ).


*einfacher:

SELECT
  FROM
    sbook
  FIELDS
    agencynum,
    bookid,
    passname
  WHERE passname = 'Christa Delon'
  INTO TABLE @DATA(lt_bookings).

cl_demo_output=>display( lt_bookings ).
