FUNCTION zem_potenz.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(LV_P_ZAHL1) TYPE  I
*"     REFERENCE(LV_P_ZAHL2) TYPE  I
*"  EXPORTING
*"     REFERENCE(LV_P_ERG) TYPE  I
*"----------------------------------------------------------------------

DATA lv_potenz TYPE i.

 lv_p_erg = lv_p_zahl1 ** lv_p_zahl2.

WRITE / |die Potenz aus { lv_p_zahl1 } hoch { lv_p_zahl2 } lautet: { lv_p_erg }|.


ENDFUNCTION.
