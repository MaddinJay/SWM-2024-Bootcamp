*&---------------------------------------------------------------------*
*& Report ZAS_SPIELWIESE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_spielwiese.

DATA lv_zahl type i.
DATA lv_zahl2 TYPE i.
  WHILE lv_zahl2 < 100.
  if lv_zahl2 MOD 3 EQ 0.
    lv_zahl2 = lv_zahl + 1.
    WRITE lv_zahl2.
    endif.
  ENDWHILE.
