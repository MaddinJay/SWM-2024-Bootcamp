*&---------------------------------------------------------------------*
*& Report zob_test123
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_test123.

data lv_text type i value '2'.
data lv_text2 type string value 'Euro'.

lv_text = lv_text && lv_text2.
write lv_text.


"write: lv_text, lv_text2.  " hier steht ein Leerzeichen hinter, das ist der Unterschied zu &&
