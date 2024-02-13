*&---------------------------------------------------------------------*
*& Report ZOB_TEST_DW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_test_dw.

SELECT SINGLE
  FROM
    scarr
  FIELDS
    *
  INTO @DATA(ls_1).

SELECT
  FROM
    scarr
  FIELDS
    *
  INTO TABLE @DATA(lt_2).
