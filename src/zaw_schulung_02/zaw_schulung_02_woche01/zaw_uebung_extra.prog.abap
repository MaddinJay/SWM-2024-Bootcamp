*&---------------------------------------------------------------------*
*& Report zaw_uebung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_extra.

*DATA: lv_dezzahl TYPE p DECIMALS 2 VALUE '15.55',
*      lv_integer TYPE i VALUE 4,
*      lv_erg     TYPE p DECIMALS 2,
*      lv_erg2    TYPE p DECIMALS 2.
*
*lv_erg = lv_dezzahl + lv_integer.
*lv_erg2 = lv_dezzahl * lv_integer.
*
*WRITE: / 'Ergebnis Addition: ' , lv_erg,
*/ 'Ergebnis Muliplikation: ' , lv_erg2.
*
*ULINE.
*
*DATA lv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit.'.
*REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ''.
*REPLACE ALL OCCURRENCES OF 'E' IN lv_text WITH ''.
*
*WRITE: / lv_text.
*
*ULINE.
*
*WRITE: / 'System: ', sy-sysid , 'Mandant: ', sy-mandt.
*
*ULINE.

*WRITE: / 'Die aktuelle Zeit ist', sy-uzeit, 'Uhr.'.
**********************************************************************
* | -> Das ist ein Pipe-Symbol!

*DATA(lv_test) = |Test|.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thirty TYPE abap_bool.

WHILE lv_bigger_than_thirty <> abap_true.
  lv_amount += lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
  IF lv_amount >= 30.
   lv_bigger_than_thirty = abap_true.
  ENDIF.
ENDWHILE.
