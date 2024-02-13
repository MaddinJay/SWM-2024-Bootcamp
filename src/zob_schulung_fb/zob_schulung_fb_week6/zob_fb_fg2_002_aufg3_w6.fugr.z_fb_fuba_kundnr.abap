*Erstellen Sie ein Funktionsgruppe mit Funktionsbausteine.
*Diese sollen das folgende tun:
*• • Findet die Kundennummer (kunnr) eines Kunden basierend auf dessen Namen,
* bei mehreren möglichen Einträgen, geben Sie alle zurück

FUNCTION Z_FB_FUBA_KUNDNR.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(LT_KUND) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
SELECT
  FROM
    KNA1
  FIELDS
    Kunnr,
    name1,
    ort01,
    pstlz,
    regio

  WHERE name1 = @iv_name
  INTO TABLE @lt_kund.

ENDFUNCTION.
