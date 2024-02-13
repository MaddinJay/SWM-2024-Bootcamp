FUNCTION z_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_ANZAHL) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_FIBOZAHL) TYPE  I
*"----------------------------------------------------------------------
  DATA: lv_zahl1    TYPE i VALUE 0,
        lv_zahl2    TYPE i VALUE 1,
        lv_ergebnis TYPE i,
        lv_runde    TYPE i.
  lv_runde = ip_anzahl.
  lv_runde = lv_runde - 1.

  IF ip_anzahl = 0.
    ep_fibozahl = 0.

  ELSEIF  ip_anzahl = 1.
    ep_fibozahl = 1.

  ELSE.
    DO lv_runde TIMES.

      lv_ergebnis = lv_zahl1 + Lv_zahl2.
      lv_zahl1 = lv_zahl2.
      lv_zahl2 = lv_ergebnis.

    ENDDO.
    ep_fibozahl = lv_ergebnis.

  ENDIF.

ENDFUNCTION.
