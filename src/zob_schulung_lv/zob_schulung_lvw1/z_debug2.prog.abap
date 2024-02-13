REPORT z_ob_re_mn_04_debug02.

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thrity TYPE abap_bool.



WHILE lv_bigger_than_thrity <> abap_true.
  lv_amount += lv_add_three.
  "gleichbedeuten zu:
*  lv_amount = lv_amount + lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
