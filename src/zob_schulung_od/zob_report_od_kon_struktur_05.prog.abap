*&---------------------------------------------------------------------*
*& Report zob_report_od_kon_struktur_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_kon_struktur_05.

types: ty_interger3 TYPE int1.
TYPES: BEGIN OF lty_s_teilnehmer,
         id        TYPE ty_interger3,
         vorname   TYPE string,
         erstB     TYPE c LENGTH 1,
         name      TYPE string,
         alter     TYPE i,
         Softskills TYPE string,
       END OF lty_s_teilnehmer.

DATA ts_teilnehmer TYPE lty_s_teilnehmer.

TYPES lt_teilnehmer TYPE  lty_s_teilnehmer.

DATA t_teilnehmer TYPE TABLE OF lt_teilnehmer.
ts_teilnehmer-id = 1.
ts_teilnehmer-vorname = 'Hans'.
ts_teilnehmer-erstB = 'H'.
ts_teilnehmer-alter = 45.
ts_teilnehmer-Softskills = 'Fußball spielen'.
INSERT ts_teilnehmer INTO TABLE t_teilnehmer.
Clear ts_teilnehmer.

ts_teilnehmer-id = 2.
ts_teilnehmer-vorname = 'Peter'.
ts_teilnehmer-erstB = 'P'.
ts_teilnehmer-alter = 40.
ts_teilnehmer-Softskills = 'Bouldern'.
INSERT ts_teilnehmer INTO TABLE t_teilnehmer.

LOOP AT t_teilnehmer INTO ts_teilnehmer WHERE id = 1.
WRITE: / ts_teilnehmer-vorname, ts_teilnehmer-softskills.
ENDLOOP.




***********************************************************************
* ab hier ist debugging
***********************************************************************
*DATA(lv_test) = |Test|.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.



*DATA lv_test TYPE string VALUE 'Dies ist ein Test'.
*WRITE lv_test.
