*&---------------------------------------------------------------------*
*& Report zoblv_aufruf_fubas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoblv_aufruf_fubas.

DATA: BEGIN OF ls_customer_number,
        kna1num TYPE kna1-kunnr,
        knaname TYPE kna1-name1,
      END OF ls_customer_number.

DATA: lt_customer_number LIKE TABLE OF ls_customer_number.

DATA(lv_text) = |Greater Hartford Area|.
CALL FUNCTION 'ZOBLV_SEARCH_KUNDENNR'
  EXPORTING
    iv_customer_name = lv_text
  IMPORTING
    ev_customer_nr   = lt_customer_number.


cl_demo_output=>display( lt_customer_number ) .
