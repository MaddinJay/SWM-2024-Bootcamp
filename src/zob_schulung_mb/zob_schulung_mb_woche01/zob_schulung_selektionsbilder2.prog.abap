*&---------------------------------------------------------------------*
*& Report zob_schulung_selektionsbilder2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_selektionsbilder2.

Selection-Screen BEGIN OF BLOCK Zahl WITH FRAME TITLE Text-001.
PARAMETERS lv_zahl type i.
  SELECTION-SCREEN COMMENT /1(20) c_text.
SELECTION-Screen END OF BLOCK Zahl.
 c_text = 'Ich bin ein Text.'.

Selection-Screen BEGIN OF BLOCK Text WITH FRAME TITLE Text-002.
PARAMETERS lv_text type string.
SELECTION-Screen END OF BLOCK Text.


SELECTION-SCREEN BEGIN OF BLOCK block1
WITH FRAME TITLE title.
PARAMETERS lv_text2 type string.
SELECTION-SCREEN END OF BLOCK block1.

INITIALIZATION.
  title = 'Ich bin ein Blocktitel'.
