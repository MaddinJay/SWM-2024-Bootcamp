*&---------------------------------------------------------------------*
*& Report zbv_potenz_berechnen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_potenz_berechnen.

DATA lv_result TYPE int4.

CALL FUNCTION 'ZBV_FM_POTENZ' "Aufruf des Funktionsbausteines, der Name des Funktionsbausteines muss immer groß und in Abostrophen geschrieben werden
  EXPORTING
    ip_basis    = 5
    ip_exponent = 7
  IMPORTING
    ep_result   = lv_result.

WRITE lv_result.
