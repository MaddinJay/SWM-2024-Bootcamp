*&---------------------------------------------------------------------*
*& Report zoblv_potenz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoblv_potenz.

*data: lv_zahl1 type int1,
*      lv_zahl2 type int1,
*      lv_result type int1.
*
*      lv_result = lv_zahl1 ** lv_zahl2.
*
*data: lv_result2 type int4.
*      call function 'ZOBLV_FLIGHT_GET_CUSTOMER'
*      exporting IP_BASIS = 5
*      IP_EXPONENT = 7
*      IMPORTING
*      EP_RESULT = LV_RESULT2.
*
*      write lv_result2.


data: lv_result3 type int4.

      call function 'ZOBLV_POTENZ'
      EXPORTING
        ip_basis = 3
        ip_exponent = 5
      IMPORTING
        EP_result = lv_result3.

      write lv_result3.
