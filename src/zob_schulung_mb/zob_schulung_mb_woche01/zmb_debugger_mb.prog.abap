*&---------------------------------------------------------------------*
*& Report zmb_debugger_mb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_debugger_mb.

"Break point setzen:


*Data lv_test2 type string.
*DATA(lv_test) = |Test|.
*DATA(lv_test) = 'Test'.
*lv_test = 'Dies ist ein Test'.
*lv_test2 = 'Dies ist noch ein Test'.
*WRITE lv_test.
*Write / lv_test2.

"2 Übung: es entsteht eine Endlosschleife, Variable wurde nicht befüllt

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thirty TYPE abap_bool.

      WHILE lv_bigger_than_thirty <> abap_false. " abap true = X
      lv_amount += lv_add_three.  " In der Zeile danach steht die Alternative, was das += bedeutet
*lv_amont = lv_amont + lv_add_three.
      WRITE: 'The amount is ' , lv_amount.
      IF lv_amount >= 30.
      lv_bigger_than_thirty = abap_true.
      Endif.
      ENDWHILE.
