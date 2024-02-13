*&---------------------------------------------------------------------*
*& Report zob_schulung_app
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_app.

Tables: zmul_db_zst.

Data: ls_struktur type zmul_db_zst,
      lt_tabelle type table of zmul_db_zst.

Data lv_zst type ZMUL_DE_zst.
Selection-Screen BEGIN OF BLOCK Zahl WITH FRAME TITLE Text-001.
Parameters: p_zst type zmul_de_zst default '000000005'.
SELECTION-Screen END OF BLOCK Zahl.
Selection-Screen BEGIN OF BLOCK Text WITH FRAME TITLE Text-002.
 Parameters: p_datum type zmul_de_abldat default '20231201'.
 SELECTION-Screen END OF BLOCK Text.


insert zmul_db_zst from ls_struktur.

ls_struktur-LFDNR = '0000000002'.
ls_struktur-zaehlerstand = p_zst.
ls_struktur-zaehlernr = 'DE90000121'.
