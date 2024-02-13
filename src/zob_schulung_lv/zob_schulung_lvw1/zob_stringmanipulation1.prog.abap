*&---------------------------------------------------------------------*
*& Report zob_stringmanipulation1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_stringmanipulation1.

DATA: gv_text type string.
      gv_text = 'In einem Loch im Boden, da lebte ein HObbit.'.

REPLACE ALL OCCURRENCES OF 'e' IN gv_text WITH ''.

WRITE gv_text.
ULINE.

WRITE sy-mandt.
WRITE sy-sysid.
ULINE.


WRITE: 'Die aktuelle Zeit ist ' , sy-timlo , ' Uhr.'.
