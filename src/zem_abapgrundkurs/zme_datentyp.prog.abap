*&---------------------------------------------------------------------*
*& Report ZME_DATENTYP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zme_datentyp.

DATA gv_zahl1 TYPE string VALUE 2.
DATA gv_zahl2(2) TYPE c VALUE '5'.
DATA gv_div(30) TYPE n.

gv_div = gv_zahl2 / gv_zahl1.

*CONCATENATE gv_zahl1 gv_zahl2 INTO gv_div separated by 'plsdjflse'. "HiHi Programmabsturz

WRITE gv_div.

IF gv_div >= 5.

  WRITE / 'größer gleich 5'.

ELSE.
  WRITE /'kleiner als 5'.

ENDIF.

*REPLACE '3' IN gv_div WITH 'PPP'.

*IF  sy-subrc = 0.

*ENDIF.

FIND '3' IN gv_div.

IF sy-subrc = 0.

WRITE 'yea'.

ENDIF.
