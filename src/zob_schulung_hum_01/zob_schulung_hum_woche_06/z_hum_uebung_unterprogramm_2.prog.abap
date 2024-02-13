*&---------------------------------------------------------------------*
*& Report z_hum_uebung_unterprogramm_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_uebung_unterprogramm_2.

FORM Unterprogramm_Satz
using text type string

changing wort1 type string
         rest type string.
split text at ' ' into wort1 rest.
ENDFORM.

Start-of-selection.
DATA lv_wort type string.
DATA lv_rest type string.
PArameters: p_text type string.

PERFORM unterprogramm_satz using p_text changing lv_wort lv_rest.
WRITE: 'Erstes Wort ist', lv_wort,',', 'der Rest des Satzes lautet', lv_rest.
