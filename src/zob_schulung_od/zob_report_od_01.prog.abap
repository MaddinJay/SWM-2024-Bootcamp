*&---------------------------------------------------------------------*
*& Report zob_report_od_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_01.

DATA(lv_test) = 'test Orlando'.

***********************************************************************
*
***********************************************************************
*DATA(lv_text) = |Ich bin ein Text|.
*DATA(lv_zahl) = 3.

*DATA: lv_text TYPE string.
*lv_text = |Ich bin ein Text|.
*DATA: lv_zahl TYPE int2.
*lv_zahl = 3.

DATA: lv_text TYPE string VALUE 'Ich bin ein Text',
 lv_zahl TYPE i VALUE 3,
 lv_suchtest type string VALUE 'suchtest'.

 if ( 'ich bin ein suchtext' ca lv_suchtest ).
 write 'WAHR'.
 ELSE.
 WRITE 'FALSCH'.

 endif.



*lv_zahl = lv_zahl + 8.
lv_zahl = 3 + 8.


 WRITE: lv_text, / , lv_zahl.





*WRITE:  '|', 'heute ist der: ', '|', sy-datum. "das ist die Datumsausgabe




**********************************************************************
*
**********************************************************************

*cl_demo_output=>display( lv_test ).

***********************************************************************
*
***********************************************************************
