FUNCTION z_uh_kundenauswertung2.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(LT_KUNDE) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
     " Hier muss eine Standard Tabelle deklariert werden.
  IF ip_name IS NOT INITIAL.
    SELECT
    FROM kna1
    LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
    LEFT JOIN vbak ON kna1~kunnr = vbak~knkli
    FIELDS
    kna1~name1 AS Kunde,
      kna1~kunnr AS Kundennr,
      kna1~ort01 AS Ort,
      kna1~stras AS Strasse,
      knvk~name1 AS Kontakt,
      vbak~vbeln AS Beleg
      WHERE kna1~name1 = @ip_name
      INTO TABLE @lt_kunde.
  ELSE.
    SELECT
FROM kna1
LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
LEFT JOIN vbak ON kna1~kunnr = vbak~knkli
FIELDS
kna1~name1 AS Kunde,
  kna1~kunnr AS Kundennr,
  kna1~ort01 AS Ort,
  kna1~stras AS Strasse,
  knvk~name1 AS Kontakt,
  vbak~vbeln AS Beleg
  INTO TABLE @lt_kunde.
  ENDIF.

ENDFUNCTION.
