*&---------------------------------------------------------------------*
*& Report zfb_week1_debugging
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_week1_debugging.

*****        ÜBUNG 1              *****

*LÖSUNG A - da 'Test' Feld auf 4 Character begrenzt, muss DATA gesetzt werden:

*DATA: lv_test1 TYPE string.
*
*DATA(lv_test) = 'Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

*LÖSUNG B - PIP Symbol | lässt Textzeile zu STRING werden:

*DATA(lv_test) = |Test|.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.
*
*ULINE.

*****        ÜBUNG 2              *****

*Basiscode mit Endlos-Schleife
DATA: lv_add_three TYPE i VALUE 3,
      lv_amount TYPE i,
      lv_bigger_than_thrity TYPE abap_bool.
*
*WHILE lv_bigger_than_thrity <> abap_true.
*lv_amount += lv_add_three.
*WRITE: 'The amount is ' , lv_amount.
*ENDWHILE.

*** im Debugging Feld "lv_bigger_than_thrity" auf abap_true also ein (großes) X setzen --> dann wird Schleife verlassen.

*Lösung A mit IF-Bedingung:

*WHILE lv_bigger_than_thirty <> abap_true.
*  lv_amount += lv_add_three.
*  "gleichbedeuten zu:
**  lv_amount = lv_amount + lv_add_three.
*  WRITE: 'The amount is ' , lv_amount.
*  IF lv_amount >= 30.
*    lv_bigger_than_thirty = abap_true.
*  ENDIF.
*ENDWHILE.

WHILE lv_amount <= 30.
  lv_amount += lv_add_three.
  "gleichbedeuten zu:
*  lv_amount = lv_amount + lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
