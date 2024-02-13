*&---------------------------------------------------------------------*
*& Report ztl_rus_bauer_mult
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_rus_bauer_mult.

*PARAMETERS: p_links  TYPE p DECIMALS 0,
*            p_rechts TYPE p DECIMALS 0.

DATA: lv_start1    TYPE p DECIMALS 0 VALUE 47,
      lv_start2    TYPE p DECIMALS 0 VALUE 42,
      lv_ergebnis2 TYPE p DECIMALS 0,
      lv_gesamt2   TYPE p DECIMALS 0. "ergebnis von p_rechts alles zusammen addiert



WHILE lv_start1 > 0.
  IF lv_start1 MOD 2 <> 0.
    lv_gesamt2 = lv_gesamt2 + lv_start2.
    "wenns ungerade ist soll er alles summieren
  ENDIF.


  WRITE: / lv_start1, lv_start2.
  lv_start1 = lv_start1 DIV 2.
  lv_start2 = lv_start2 * 2.

ENDWHILE.
ULINE.
WRITE: / 'Gesamtergebnis (rechte Spalte): ', lv_gesamt2.
