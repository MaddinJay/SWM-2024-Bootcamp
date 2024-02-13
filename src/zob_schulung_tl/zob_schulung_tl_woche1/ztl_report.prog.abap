*&---------------------------------------------------------------------*
*& Report ztl_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_report.
"TA Code_ ZTL_TC000 wurde erstellt über SE93 um dieses Report zu öffnen. Gehe auf Mavigate--> Open SAPGUI
TABLES: mara.
"Aufgabe: neuen Report erstellen und Hello World ausgeben lassen.
*WRITE 'Hello World'.
*******************************************************************************
*Brutto berechnen:
*******************************************************************************
PARAMETERS p_value1 TYPE p DECIMALS 2.
*DATA lv_brutto TYPE p DECIMALS 2.
*lv_brutto = p_value1 * '1.19'.
*******************************************************************************
*Ein Hinweis ausgeben lassen, wenn kein Wert eingegeben wurde.
*******************************************************************************
PARAMETERS p_prdkt TYPE c LENGTH 24 OBLIGATORY.
*Wenn im Beitrag Feld nichts eingegeben wird kommt pop up fenster:
IF p_value1 IS INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  MESSAGE lv_message TYPE 'I'.
ENDIF.
*******************************************************************************
*Erweitern um Komplexex Selektionsbild:
*******************************************************************************
SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.
*PARAMETERS p_show AS CHECKBOX.
*
*IF p_show = abap_true.
*LOOP AT s_pnum INTO DATA(ls_pnum).
*  WRITE: / 'Produktnummer:', ls_pnum-low.
*ENDLOOP.
*ENDIF.
*******************************************************************************
*Erweitern um Checkbox und Radio Button
*******************************************************************************
PARAMETERS: p_m19 RADIOBUTTON GROUP tax DEFAULT 'X',
            p_m07 RADIOBUTTON GROUP tax.

DATA(lv_tax) = '0.00'.
IF p_m19 = abap_true.
  lv_tax = '1.19'.
ELSEIF p_m07 = abap_true.
  lv_tax = '1.07'.
ENDIF.

DATA(lv_brutto) = p_value1 * lv_tax.
PARAMETERS p_show AS CHECKBOX.
"Produktnummer anzeigen mit checkbox auswahl
IF p_show = abap_true.
LOOP AT s_pnum INTO DATA(ls_pnum).
  WRITE: / 'Produktnummer:', ls_pnum-low.
ENDLOOP.
ENDIF.

WRITE: / 'Betrag:', p_value1.
WRITE: / 'Bruttobetrag:', lv_brutto.
WRITE: / 'Produkt: ', p_prdkt.
