*&---------------------------------------------------------------------*
*& Report zuh_report_en_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_report_en_01.
*******************************************************
*
******************************************************
*WRITE: 'Hallo World!', /. "gibt einen Text aus
*
*WRITE: sy-datum, sy-langu.

*Write: sy-dbsys, sy-host.

*Data(lv_text) = 'Ich bin ein Text.'.
*Data(lv_zahl) = 3.



*DATA: lv_text TYPE string VALUE 'Ich bin ein Text',
*      lv_zahl TYPE i VALUE 3.


DATA(lv_text1) = 'Hello World'.
DATA(lv_text2) = 'Ich bin ein Text'.
DATA lv_text3 TYPE string.

lv_text3 = lv_text1 && lv_text2.

WRITE lv_text3.

DATA(lv_zahl) = 5.
lv_zahl = lv_zahl + 3.

WRITE lv_zahl.

DATA(lv_zahl2) = '000123'.

SHIFT lv_zahl2 LEFT DELETING LEADING '0'.

WRITE lv_zahl2.

DATA(lv_text4) = 'Das ist ein Text'.

IF lv_text4 CA 'yqe'.
  WRITE 'Wahr.'.
ELSE.
  WRITE 'Falsch'.
ENDIF.
