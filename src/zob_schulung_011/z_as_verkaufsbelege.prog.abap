*&---------------------------------------------------------------------*
*& Report z_as_verkaufsbelege
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_verkaufsbelege.

*- Verkaufsbeleg-Nr. --> VBAK: VBELN
*- Betrag (Netto) + Währung --> VBAK: NETWR, WAERK
*- Name des Kunden --> (VBAK: KUNNR) KNA1: name1
*- Positionen/Materialien mit ihren Namen --> VBAP: POSNR, MATNR

SELECT
FROM vbak LEFT JOIN vbap ON vbak~vbeln = vbap~vbeln
LEFT JOIN kna1 ON vbak~kunnr = kna1~kunnr
FIELDS
vbak~vbeln,
vbak~netwr,
vbak~waerk,
vbak~kunnr,
kna1~name1,
vbap~posnr,
vbap~matnr,
COUNT( kna1~name1 ) AS anzahlBestellungen
WHERE vbak~kunnr IS NOT INITIAL
GROUP BY
vbak~vbeln,
vbak~netwr,
vbak~waerk,
vbak~kunnr,
kna1~name1,
vbap~posnr,
vbap~matnr
ORDER BY vbak~kunnr
INTO TABLE @DATA(lt_verkaufsbelege).




SELECT
FROM vbak
FIELDS  kunnr,
COUNT( * ) AS anzahl
GROUP BY kunnr
ORDER BY kunnr
INTO TABLE @DATA(lt_verkaufsbelege2).
cl_demo_output=>display( lt_verkaufsbelege2 ).


LOOP AT lt_verkaufsbelege INTO DATA(ls_verkaufsbeleg).
  READ TABLE lt_verkaufsbelege2 INTO DATA(ls_verkaufsbeleg2) WITH KEY kunnr = ls_verkaufsbeleg-kunnr.
  IF ls_verkaufsbeleg2-anzahl > 10.
    ls_verkaufsbeleg-netwr = ls_verkaufsbeleg-netwr * '0.95'.
    WRITE: 'Kundennummer: ', ls_verkaufsbeleg-kunnr, 'Neuer Preis: ', ls_verkaufsbeleg-netwr, /.
  ELSEIF ls_verkaufsbeleg2-anzahl > 50.
    ls_verkaufsbeleg-netwr = ls_verkaufsbeleg-netwr * '0.90'.
    WRITE: 'Kundennummer: ', ls_verkaufsbeleg-kunnr, 'Neuer Preis: ', ls_verkaufsbeleg-netwr, /.
  ELSE.
    WRITE: 'Kundennummer: ', ls_verkaufsbeleg-kunnr, 'Neuer Preis: ', ls_verkaufsbeleg-netwr, /.
  ENDIF.
ENDLOOP.
