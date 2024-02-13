*&---------------------------------------------------------------------*
*& Report zuh_uebung_select2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_select2.


TABLES: sbook.

DATA: lt_kunde LIKE TABLE OF sbook,
      ls_kunde TYPE sbook.

SELECT SINGLE FROM sbook FIELDS * WHERE passname = 'Christa Delon' INTO @ls_kunde.

cl_demo_output=>display( ls_kunde ).

*einfacher:

SELECT SINGLE
  FROM
  sbook
  FIELDS
    *
  WHERE passname = 'Christa Delon'
  INTO @DATA(ls_booking).

cl_demo_output=>display( ls_booking ).
