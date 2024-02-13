*&---------------------------------------------------------------------*
*& Report z_potenz_berechnen_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_potenz_berechnen_tl.

*DATA: lv_result TYPE int4.
*
*CALL FUNCTION 'Z_OBTL_FM'
*EXPORTING ip_basis = 5 ip_exponent = 7
*IMPORTING ep_result = lv_result.
*WRITE lv_result.


*Beim Aufruf eines Funktionsbaustein aus einem Programm,
*wird die gesamte Funktionsgruppe in den internen Modus geladen.



DATA: lv_fortune TYPE string.

CALL FUNCTION 'Z_READ_FORTUNE'
EXPORTING iv_name = 'Tea' iv_age = 23 iv_sex = 'w'
IMPORTING ev_fortune = lv_fortune.
WRITE lv_fortune.
