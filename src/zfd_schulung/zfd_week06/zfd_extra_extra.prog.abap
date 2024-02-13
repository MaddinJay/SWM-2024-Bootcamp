*&---------------------------------------------------------------------*
*& Report zfd_extra_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_extra_extra.

*******************************
*Erstellt ein Programm welches das folgendes tut.
*Es gibt alle Verkaufsbelege (VBELN  ???) eines bestimmten Datums (Erdat in vbak ?) aus.
*Dabei sollen die folgenden Informationen mit ausgegeben werden:
*- Verkaufsbeleg-Nr. -> DBTabelle: VBAK + VBAP Spalte VBELN
*- Betrag (Netto) + Währung -> vbak Spalte netwr + WAERK
*- Name des Kunden -> kna1 Spalte name1
*- Positionen/Materialien mit ihren Namen -> MATNR bei MARA + makt , MAKTX nur bei makt
*      -> oder
*Tabellen: VBAK, VBAP, KNA1, MARA/MAKT
*
*Zusatz 1:
*Prüft wie oft der Kunde bestellt hat. Count in eigenem SELECT
*Sollte der Kunde mehr als 10-mal bestellt haben erhält er
*einen Rabatt auf den Preis von 5%.
*Sollte der Kunde mehr als 50-mal bestellt haben erhält er
*einen Rabatt auf den Preis von 10%.
*Geben Sie den neuen Betrag aus.
*
*Zusatz 2:
*Prüft woher der Kunde kommt.  ->  Land1 in KNA1
*Rechnet bei deutschen Kunden 18% MwSt. auf den Nettobetrag.
*Bei nicht deutschen Kunden rechnet 23% auf den Nettobetrag
*Gebt den Bruttowert aus.
*******************************

TABLES: vbak, vbap, kna1. " Vielleicht noch  MARA + makt.

DATA lv_date TYPE dats VALUE '20171219'.
DATA lv_brutto TYPE p.

SELECT
FROM vbap
LEFT OUTER JOIN vbak ON vbap~vbeln = vbak~vbeln
LEFT OUTER JOIN kna1 ON vbak~kunnr = kna1~kunnr
LEFT OUTER JOIN makt ON vbap~matnr = makt~matnr
FIELDS
vbak~erdat,
vbap~vbeln,
vbak~netwr,
vbak~waerk,
vbak~kunnr,
kna1~name1,
kna1~land1,
vbap~posnr,
makt~maktx
WHERE vbak~erdat = @lv_date
INTO TABLE @DATA(lt_tab1).

*cl_demo_output=>display( lt_tab1 ).

SELECT
FROM vbak
FIELDS
vbak~kunnr,
COUNT(*) AS amount
GROUP BY vbak~kunnr
INTO TABLE @DATA(lt_count).
*cl_demo_output=>display( lt_count ).

LOOP AT lt_tab1 REFERENCE INTO DATA(ls_rabatt).
  READ TABLE lt_count INTO DATA(ls_count) WITH KEY kunnr = ls_rabatt->kunnr.
  IF ls_count-amount > 10.
    IF ls_count-amount > 50.
      ls_rabatt->netwr = ls_rabatt->netwr * '0.9'.  " Rabatt 10%   Zusatz 1
      IF ls_rabatt->land1 = 'DE'.
        lv_brutto = ls_rabatt->netwr * '1.18'.
      ELSE.
        lv_brutto = ls_rabatt->netwr * '1.23'.
      ENDIF.
    ELSE.
      ls_rabatt->netwr = ls_rabatt->netwr * '0.95'." Rabatt 5%   Zusatz 1
      IF ls_rabatt->land1 = 'DE'.
        lv_brutto = ls_rabatt->netwr * '1.18'.  "    Zusatz 2
      ELSE.
        lv_brutto = ls_rabatt->netwr * '1.23'.  "    Zusatz 2
      ENDIF.
    ENDIF.
  ENDIF.

*    Zusatz 2 Ausgabe.
  WRITE: |Der Kunde { ls_rabatt->name1 } hat durch den Verkaufsbeleg { ls_rabatt->vbeln } am { lv_date } |.
  WRITE: |für einen Bruttoumsatz von { lv_brutto } { ls_rabatt->waerk } gesorgt. |.
  ULINE.

ENDLOOP.



cl_demo_output=>display( lt_tab1 ).
