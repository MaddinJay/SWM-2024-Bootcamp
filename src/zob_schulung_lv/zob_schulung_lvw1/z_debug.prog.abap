*&---------------------------------------------------------------------*
*& Report z_debug
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_debug.

DATA(lv_test) = 'Test'. "inline deklaration weswegen es ein char c lenght 4 hat
lv_test = 'dies ist ein test'.
write lv_test.
