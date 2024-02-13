*&---------------------------------------------------------------------*
*& Report zuh_funktionsbaustein
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_funktionsbaustein.


DATA: lv_result TYPE int4,
 iv_zahl1 type i,
 iv_zahl2 type i.

 iv_zahl1 = 3.
 iv_zahl2 = 4.

CALL FUNCTION 'Z_UH_FUNKTIONSMODUL1'   "Aufruf des Funktionsbausteins.
 EXPORTING
 ip_basis = iv_zahl1
 ip_exponent = iv_zahl2
 IMPORTING
 ep_result = lv_result.


WRITE |Das Ergbnis von { iv_zahl1 } hoch { iv_zahl2 } ist { lv_result }|.
