*&---------------------------------------------------------------------*
*& Report zaw_wiederholung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_wiederholung_extra.

*Erstellt ein Programm, das alle Verkaufsbelege eines bestimmten Datums ausgibt.
*Dabei sollen die folgenden Informationen mit ausgegeben werden:
*- Verkaufsbeleg-Nr.
*- Betrag (Netto) + Währung
*- Name des Kunden
*- Positionen/Materialien mit ihren Namen
*Tabellen: VBAK, VBAP, KNA1, MARA/MAKT

PARAMETERS p_datum TYPE d OBLIGATORY.
*
SELECT
FROM vbak
LEFT JOIN vbap ON vbap~vbeln = vbak~vbeln
LEFT JOIN makt ON vbap~matnr = makt~matnr
LEFT JOIN kna1 ON kna1~kunnr = vbak~kunnr
FIELDS
vbak~kunnr AS Kundennummer,
vbak~erdat AS Datum,
vbap~vbeln AS Verkaufsbelegnummer,
vbak~netwr AS Nettobetrag,
vbak~waerk AS Waehrung,
kna1~land1 AS Land,
kna1~name1 AS Kundenname,
vbap~posnr AS Position,
makt~maktx AS Materialname
WHERE vbak~erdat = @p_datum AND makt~spras = 'E'
INTO TABLE @DATA(lt_verkauf).
*
*cl_demo_output=>display( lt_verkauf ).

"Zusatz 1)
*Prüft wie oft der Kunde bestellt hat.
*Sollte der Kunde mehr als 10-mal bestellt haben erhält er einen Rabatt auf den Preis von 5%.
*Sollte der Kunde mehr als 50-mal bestellt haben erhält er einen Rabatt auf den Preis von 10%.
*Geben Sie den neuen Betrag aus.

"Zusatz 2)
*Prüft woher der Kunde kommt.
*Rechnet bei deutschen Kunden 18 % MwSt. auf den Nettobetrag.
*Bei nicht deutschen Kunden rechnet 23 % auf den Nettobetrag
*Gebt den Bruttowert aus.

SELECT
FROM vbak
FIELDS
kunnr,
COUNT( * ) AS Anzahl
GROUP BY kunnr
INTO TABLE @DATA(lt_kund).

*cl_demo_output=>display( lt_kund ).

LOOP AT lt_verkauf REFERENCE INTO DATA(ls_rabatt).
  READ TABLE lt_kund INTO DATA(ls_kunde) WITH KEY kunnr = ls_rabatt->kundennummer.
  DATA lv_brutto TYPE p.

  "Zusatz 1)

  IF ls_kunde-Anzahl > 10.

    IF ls_kunde-Anzahl > 50.
      ls_rabatt->Nettobetrag = ls_rabatt->Nettobetrag * '0.9'.
      IF ls_rabatt->land = 'DE'.
        lv_brutto = ls_rabatt->Nettobetrag * '1.18'.
      ELSE.
        lv_brutto = ls_rabatt->Nettobetrag * '1.23'.
      ENDIF.
    ELSE.
      ls_rabatt->Nettobetrag = ls_rabatt->Nettobetrag * '0.95'.
      IF ls_rabatt->land = 'DE'.
        lv_brutto = ls_rabatt->Nettobetrag * '1.18'.
      ELSE.
        lv_brutto = ls_rabatt->Nettobetrag * '1.23'.
      ENDIF.
    ENDIF.

  ENDIF.

uline.

  WRITE: / |Kunde "{ ls_rabatt->Kundenname }" zahlt für den Verkaufsbeleg { ls_rabatt->verkaufsbelegnummer } aufgrund des Rabattes nur noch { ls_rabatt->nettobetrag } { ls_rabatt->waehrung } netto.|.

  "Zusatz 2)

  WRITE: / |Für den Nettobetrag von { ls_rabatt->Nettobetrag } { ls_rabatt->waehrung } ergibt sich durch den Steuersatz für { ls_rabatt->land } ein Bruttobetrag von { lv_brutto } { ls_rabatt->waehrung }.|.

ENDLOOP.
