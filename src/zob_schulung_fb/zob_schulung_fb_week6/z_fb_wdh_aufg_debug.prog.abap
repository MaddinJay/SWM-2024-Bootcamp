*&---------------------------------------------------------------------*
*& Report z_fb_wdh_aufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_wdh_aufg_debug.

* Übung: ABAP Debugging Aufgabenstellung
* Kopieren Sie den folgenden Code in Ihren Report.
* DAT(lv_test) = 'Test'. lv_test = 'Dies ist ein Test'.
* WRITE lv_test.
* Debuggen Sie den Code um die Fehler zu finden. Der Code enthält einen Syntaxfehler und einen Logikfehler.

*Aufgabe 1:
*DATA(lv_test) = 'Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

*lv_test isz zu kurz beschrieben

*Übung: ABAP Debugging II Aufgabenstellung
*Schauen Sie sich den folgenden Code an und finden Sie das Problem.
*DATA: lv_add_three TYPE i VALUE 3,
*lv_amount TYPE i,
*lv_bigger_than_thrity TYPE abap_bool.
*WHILE lv_bigger_than_thrity <> abap_true.
*lv_amount += lv_add_three.
*WRITE: 'The amount is ' , lv_amount.
*ENDWHILE.

DATA: lv_add_three TYPE i VALUE 3,
lv_amount TYPE i,
lv_bigger_than_thrity TYPE abap_bool.
WHILE lv_bigger_than_thrity <> abap_true.
lv_amount += lv_add_three.
WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
