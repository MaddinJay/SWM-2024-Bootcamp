*&---------------------------------------------------------------------*
*& Report ztw_wiederholung_uebung_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_wiederholung_uebung_03.

PARAMETERS p_date TYPE d OBLIGATORY.

SELECT FROM vbak
LEFT JOIN vbap ON vbak~vbeln = vbap~vbeln
LEFT JOIN kna1 ON vbak~kunnr = kna1~kunnr
LEFT JOIN mara ON vbap~matnr = mara~matnr
LEFT JOIN makt ON mara~matnr = makt~matnr


FIELDS
vbak~erdat AS Datum,
vbap~vbeln AS Verkaufsbelegnummer,
vbak~netwr AS Nettobetrag,
vbak~waerk AS Waehrung,
kna1~name1 AS Kundenname,
vbap~posnr AS Position,
vbap~matnr AS Materialnummer

WHERE vbak~erdat = @p_date AND makt~spras = 'E'
INTO TABLE @DATA(gt_table).

cl_demo_output=>display( gt_table ).

SELECT FROM vbak
FIELDS
kunnr,
COUNT( * ) AS anzahl
GROUP BY kunnr
INTO TABLE @DATA(gt_person).
